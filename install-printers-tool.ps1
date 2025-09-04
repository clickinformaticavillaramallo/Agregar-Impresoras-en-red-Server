# run-printers-tool.ps1
# Descarga y ejecuta "Agregar Impresoras en red Server.exe" en memoria temporal
$exeUrl = 'https://github.com/clickinformaticavillaramallo/Agregar-Impresoras-en-red-Server/raw/main/Agregar%20Impresoras%20en%20red%20Server.exe'
$tmpExe = "$env:TEMP\AgregarImpresoras.exe"

Invoke-WebRequest -Uri $exeUrl -OutFile $tmpExe -UseBasicParsing
Start-Process $tmpExe -Wait            # -Wait para que no cierre inmediatamente
