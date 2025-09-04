<#  install-printers-tool.ps1
    Descarga y prepara "Agregar Impresoras en red Server.exe"
#>

#Requires -Version 5.1

# ---------- Admin check -----------------------------------------------------
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Write-Error "Ejecuta este script como Administrador."
    exit 1
}

# ---------- Config ----------------------------------------------------------
$repoUrl = "https://github.com/clickinformaticavillaramallo/Agregar-Impresoras-en-red-Server/raw/main/Agregar%20Impresoras%20en%20red%20Server.exe"
$toolDir = "$env:ProgramFiles\ImpresorasRed"
$exeName = "Agregar Impresoras en red Server.exe"
$exePath = Join-Path $toolDir $exeName
$shortcutPath = "$env:PUBLIC\Desktop\Impresoras en red.lnk"

# ---------- Crear carpeta ----------------------------------------------------
New-Item -ItemType Directory -Path $toolDir -Force | Out-Null

# ---------- Descarga --------------------------------------------------------
Write-Host "[*] Descargando herramienta..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $repoUrl -OutFile $exePath -UseBasicParsing
} catch {
    Write-Error "Error al descargar: $($_.Exception.Message)"
    exit 2
}

# ---------- Crear acceso directo --------------------------------------------
$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $exePath
$shortcut.WorkingDirectory = $toolDir
$shortcut.IconLocation = $exePath
$shortcut.Save()

# ---------- Ejecutar (opcional) ---------------------------------------------
# Start-Process $exePath   # <-- descomenta si quieres lanzarla al final

Write-Host "[+] Herramienta lista en: $exePath" -ForegroundColor Green
Write-Host "[+] Acceso directo creado en Escritorio público." -ForegroundColor Green
exit 0