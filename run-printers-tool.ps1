# run-printers-tool.ps1
$exeUrl = 'https://github.com/clickinformaticavillaramallo/Agregar-Impresoras-en-red-Server/raw/main/Agregar%20Impresoras%20en%20red%20Server.exe'
$tmpExe = "$env:TEMP\AgregarImpresoras.exe"

Invoke-WebRequest -Uri $exeUrl -OutFile $tmpExe -UseBasicParsing
Start-Process $tmpExe