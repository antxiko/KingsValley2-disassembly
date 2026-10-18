# omsx_demo.tcl - Vuelca la VRAM y la RAM en unos cuadros de las demostraciones,
# contados en CUADROS DEL JUEGO: el volcado se hace justo antes de cada uno
# ($DEMO_BP: la llamada de la interrupcion al cuadro del juego, p00:4086 en
# MSX2 y p00:4088 en MSX1) con el juego en la demostracion (0xE200 = 2). No se
# cuentan interrupciones: si un cuadro no acaba a tiempo (0xE205), en la
# siguiente solo suena la musica. Para cotejar con tools/coteja_demo.py.
#
# Variables: DEMO_SALIDA (directorio), DEMO_CUADROS ("60 300 600": cuadros de
# demostracion en los que se vuelca; se cuentan seguidos aunque haya varias
# demostraciones), DEMO_FIN (segundos emulados a los que sale).
set throttle off
set ::SALIDA $::env(DEMO_SALIDA)
set ::CUADROS $::env(DEMO_CUADROS)
set ::n 0
file mkdir $::SALIDA
proc vuelca {k} {
    set f [open [file join $::SALIDA "vram-$k.bin"] wb]
    fconfigure $f -translation binary
    puts -nonewline $f [debug read_block VRAM 0 [debug size VRAM]]
    close $f
    set h [open [file join $::SALIDA "ram-$k.bin"] wb]
    fconfigure $h -translation binary
    puts -nonewline $h [debug read_block memory 0 65536]
    close $h
    set g [open [file join $::SALIDA "vdp-$k.txt"] w]
    set nr [expr {[debug size "VDP regs"] > 8 ? 47 : 8}]
    for {set i 0} {$i < $nr} {incr i} { puts $g [format "R%d = 0x%02X" $i [debug read "VDP regs" $i]] }
    # la paleta del V9938 (0xRGB, 3 bits cada uno); en el TMS9918 no hay
    if {![catch {getcolor 0}]} {
        for {set i 0} {$i < 16} {incr i} { puts $g [format "P%d = 0x%s" $i [getcolor $i]] }
    }
    close $g
}
debug set_bp $::env(DEMO_BP) {[debug read memory 0xE200] == 2} {
    incr ::n
    if {[lsearch -exact $::CUADROS $::n] >= 0} { vuelca $::n }
}
after time $::env(DEMO_FIN) exit
