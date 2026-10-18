# omsx_vram.tcl - Vuelca la VRAM (16 KB), los registros del VDP, la RAM y una
# captura del cartucho en un MSX1 (C-BIOS_MSX1), para cotejar los dibujos que
# montan las herramientas con los datos de la ROM.
#
#   "C:/Program Files/openMSX/openmsx.exe" -machine C-BIOS_MSX1 #       -carta kv2_msx1.rom -romtype KonamiSCC -script tools/omsx_vram.tcl
#
# Variables: VRAM_SALIDA (work/omsx), VRAM_TIEMPOS ("30 45 60": segundos
# emulados de cada volcado; sale despues del ultimo), VRAM_TECLAS
# "t:fila:mascara[:segundos] ..." (fila 8: 0x01 espacio, 0x10 izquierda, 0x20
# arriba, 0x40 abajo, 0x80 derecha), VRAM_POKES "t:direccion:valor ...".
proc opcion {nombre porDefecto} {
    global env
    if {[info exists env($nombre)]} { return $env($nombre) }
    return $porDefecto
}
set ::SALIDA [opcion VRAM_SALIDA {work/omsx}]
set ::TIEMPOS [opcion VRAM_TIEMPOS {30 45 60}]
file mkdir $::SALIDA
set throttle off

proc vuelca {etiqueta} {
    set f [open [file join $::SALIDA "vram-$etiqueta.bin"] wb]
    fconfigure $f -translation binary
    puts -nonewline $f [debug read_block VRAM 0 16384]
    close $f
    set g [open [file join $::SALIDA "vdp-$etiqueta.txt"] w]
    for {set i 0} {$i < 8} {incr i} {
        puts $g [format "R%d = 0x%02X" $i [debug read "VDP regs" $i]]
    }
    puts $g [format "segundo = %.4f" [machine_info time]]
    foreach {nombre d} {paso 0xE200 subpaso 0xE201 fase 0xE241 scroll_l 0xE243 scroll_h 0xE244 personaje 0xE24E jefe 0xE340} {
        puts $g [format "%s = 0x%02X" $nombre [debug read memory $d]]
    }
    close $g
    set h [open [file join $::SALIDA "ram-$etiqueta.bin"] wb]
    fconfigure $h -translation binary
    puts -nonewline $h [debug read_block memory 0 65536]
    close $h
    screenshot [file join $::SALIDA "ver-$etiqueta.png"]
}
foreach k [opcion VRAM_TECLAS {}] {
    lassign [split $k :] t f m d
    if {$d eq ""} { set d 0.15 }
    after time $t "keymatrixdown $f $m; after time $d {keymatrixup $f $m}"
}
foreach k [opcion VRAM_POKES {}] {
    lassign [split $k :] t d v
    after time $t "poke $d $v"
}
# VRAM_BP "pc:direccion:valor ...": cada vez que se ejecuta pc se escribe ese
# byte
foreach k [opcion VRAM_BP {}] {
    lassign [split $k :] pc d v
    set ::BPLOG [open [file join $::SALIDA "bp.txt"] w]
    debug breakpoint create -address $pc -command "poke $d $v; puts \$::BPLOG {bp $pc}; flush \$::BPLOG"
}
# VRAM_WP "direccion ...": apunta en wp.txt el PC de cada escritura
set ::WPLOG [open [file join $::SALIDA "wp.txt"] w]
foreach d [opcion VRAM_WP {}] {
    debug set_watchpoint write_mem $d {} "puts \$::WPLOG \[format {%s pc=%04X v=%02X t=%s} $d \[reg PC\] \$::wp_last_value \[machine_info time\]\]; flush \$::WPLOG"
}
# VRAM_FIJO "direccion:valor ...": se escribe cada 0.1 s (para que
# el juego no la cambie)
set ::FIJO [opcion VRAM_FIJO {}]
proc fija {} {
    foreach k $::FIJO { lassign [split $k :] d v; poke $d $v }
    after time 0.1 fija
}
if {$::FIJO ne ""} { after time [opcion VRAM_FIJO_DESDE 21] fija }
# VRAM_TRAZA "pc ...": en cada pc apunta en traza.txt PC, HL, DE, BC, la pila y
# los bancos (0x5000/0x7000/0x9000/0xB000 no se leen: se apunta la sombra F0F1-3)
set ::TRLOG [open [file join $::SALIDA "traza.txt"] w]
foreach pc [opcion VRAM_TRAZA {}] {
    debug set_bp $pc {} "puts \$::TRLOG \[format {%04X HL=%04X DE=%04X BC=%04X IX=%04X A=%02X SP0=%04X F0F1=%02X%02X%02X F000=%02X t=%.4f} \[reg PC\] \[reg HL\] \[reg DE\] \[reg BC\] \[reg IX\] \[reg A\] \[peek16 \[reg SP\]\] \[peek 0xF0F1\] \[peek 0xF0F2\] \[peek 0xF0F3\] \[peek 0xF000\] \[machine_info time\]\]; flush \$::TRLOG"
}
# VRAM_DISPARA t: desde t segundos se pulsa y se suelta el espacio cada 0,1 s
set ::DISPARA [opcion VRAM_DISPARA {}]
proc dispara {} {
    keymatrixdown 8 0x01
    after time 0.05 {keymatrixup 8 0x01}
    after time 0.1 dispara
}
if {$::DISPARA ne ""} { after time $::DISPARA dispara }
# VRAM_ESCRITURAS 1: apunta en escrituras.txt cada escritura a la VRAM que pasa
# por la BIOS (WRTVRM 0x004D, FILVRM 0x0056, LDIRVM 0x005C) o por las rachas de
# p00:4F7F, o con outi (p00:5ACC: 8 bytes de DE en HL; p01:65BA: 64 de HL en 0x31E0) o con out (p00:56CB: letras de la lista DE en HL; p01:63A7: los 10 sprites de la
# eleccion, con la cuenta 0xE203; p08:8120: rachas con mascara, con 0xE3F2), con los bancos; si LDIRVM copia de la RAM, tambien los bytes
proc apunta_escritura {} {
    set pc [reg PC]
    set l [format {%04X HL=%04X DE=%04X BC=%04X A=%02X F0F1=%02X%02X%02X t=%.4f} $pc [reg HL] [reg DE] [reg BC] [reg A] [peek 0xF0F1] [peek 0xF0F2] [peek 0xF0F3] [machine_info time]]
    if {$pc == 0x63A7} { append l [format " M=%02X" [peek 0xE203]] }
    if {$pc == 0x8120} { append l [format " M=%02X" [peek 0xE3F2]] }
    if {$pc == 0x005C && [reg HL] >= 0xC000} {
        binary scan [debug read_block memory [reg HL] [reg BC]] H* hex
        append l " DATOS=$hex"
    }
    puts $::ESLOG $l
}
if {[opcion VRAM_ESCRITURAS {}] ne ""} {
    set ::ESLOG [open [file join $::SALIDA "escrituras.txt"] w]
    foreach pc {0x004D 0x0056 0x005C 0x4F7F 0x5ACC 0x65BA 0x56CB 0x63A7 0x8120} { debug set_bp $pc {} apunta_escritura }
}
# VRAM_CUADROS "desde hasta": de desde a hasta segundos, en cada cuadro anade a
# cuadros.bin la VRAM (16 KB), los 8 registros del VDP y el segundo (8 bytes de
# texto), para montar animaciones con tools/vdp.py
set ::CUADROS [opcion VRAM_CUADROS {}]
proc cuadro {} {
    lassign $::CUADROS desde hasta
    set t [machine_info time]
    if {$t > $hasta} { return }
    puts -nonewline $::CUF [debug read_block VRAM 0 16384]
    for {set i 0} {$i < 8} {incr i} { puts -nonewline $::CUF [binary format c [debug read "VDP regs" $i]] }
    puts -nonewline $::CUF [format %8.3f $t]
    after frame cuadro
}
if {$::CUADROS ne ""} {
    set ::CUF [open [file join $::SALIDA "cuadros.bin"] wb]
    fconfigure $::CUF -translation binary
    after time [lindex $::CUADROS 0] cuadro
}
# VRAM_SCROLL paso: vuelca cada vez que la fase (0xE241) cambia o el scroll
# (0xE243) pasa a otro multiplo de paso (f<fase>_s<scroll>), y con el final del
# recorrido (0xE327 = 1) cada 3 s mientras dura (f<fase>_j<n>)
set ::SCROLL [opcion VRAM_SCROLL {}]
set ::scroll_antes -1
set ::jefe_n 0
proc mira_scroll {} {
    set f [debug read memory 0xE241]
    set sc [expr {[debug read memory 0xE243] + 256 * [debug read memory 0xE244]}]
    set k [expr {$f * 65536 + $sc / $::SCROLL}]
    if {[debug read memory 0xE200] == 5 && $f > 0} {
        if {$k != $::scroll_antes} {
            set ::scroll_antes $k
            set ::jefe_n 0
            vuelca [format "f%d_s%03X" $f $sc]
        } elseif {[debug read memory 0xE327] == 1} {
            incr ::jefe_n
            if {$::jefe_n % 12 == 0} { vuelca [format "f%d_j%02d" $f [expr {$::jefe_n / 12}]] }
        }
    }
    after time 0.25 mira_scroll
}
if {$::SCROLL ne ""} { after time 12 mira_scroll }
# VRAM_PUERTO 1: cuenta las escrituras al puerto de datos del VDP (0x98) por
# PC y por bancos (0xF0F1-3); puerto.txt al salir
array set ::PUERTO {}
proc cuenta_puerto {} {
    set k [format {%04X F0F1=%02X%02X%02X} [reg PC] [peek 0xF0F1] [peek 0xF0F2] [peek 0xF0F3]]
    if {[info exists ::PUERTO($k)]} { incr ::PUERTO($k) } else { set ::PUERTO($k) 1 }
}
proc escribe_puerto {} {
    set f [open [file join $::SALIDA "puerto.txt"] w]
    foreach k [lsort [array names ::PUERTO]] { puts $f "$k $::PUERTO($k)" }
    close $f
}
if {[opcion VRAM_PUERTO {}] ne ""} { debug set_watchpoint write_io 0x98 {} cuenta_puerto }
foreach t $::TIEMPOS { after time $t "vuelca $t" }
after time [expr {[lindex $::TIEMPOS end] + 1}] {if {[opcion VRAM_PUERTO {}] ne ""} escribe_puerto; exit}
