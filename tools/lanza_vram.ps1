# lanza_vram.ps1 -dir <dir> -tiempos "<segundos>" ...: UN openMSX con tools/omsx_vram.tcl,
# fuera del sandbox, y espera a que acabe (los parametros, en el guion).
param([string]$dir, [string]$tiempos = "30 45 60", [string]$teclas = "", [string]$pokes = "", [string]$bp = "", [string]$wp = "", [string]$fijo = "", [string]$fijo_desde = "21", [string]$rom = "kv2_msx1.rom", [string]$vecino = "", [string]$traza = "", [string]$dispara = "", [string]$escrituras = "", [string]$cuadros = "", [string]$puerto = "", [string]$scroll = "", [string]$maquina = "C-BIOS_MSX1")
$env:VRAM_BP = $bp
$env:VRAM_WP = $wp
$env:VRAM_FIJO = $fijo
$env:VRAM_FIJO_DESDE = $fijo_desde
$env:VRAM_TRAZA = $traza
$env:VRAM_DISPARA = $dispara
$env:VRAM_ESCRITURAS = $escrituras
$env:VRAM_CUADROS = $cuadros
$env:VRAM_PUERTO = $puerto
$env:VRAM_SCROLL = $scroll
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz
$env:VRAM_SALIDA = "work/$dir"
$env:VRAM_TIEMPOS = $tiempos
$env:VRAM_TECLAS = $teclas
$env:VRAM_POKES = $pokes
$args_ = @("-machine", $maquina, "-carta", $rom, "-romtype", "KonamiSCC")
if ($vecino -ne "") { $args_ += @("-cartb", $vecino) }
$args_ += @("-script", "tools/omsx_vram.tcl")
Start-Process -FilePath "C:\Program Files\openMSX\openmsx.exe" -ArgumentList $args_ -Wait -WindowStyle Minimized
"hecho" | Out-File -Encoding ascii "work/$dir/fin.txt"
