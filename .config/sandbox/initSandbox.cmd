REM set execution policy first so that a setup script can be run
powershell.exe -executionPolicy Bypass -Command "Set-ExecutionPolicy Unrestricted -Confirm:$false -Force"

REM run the setup script
powershell.exe -ExecutionPolicy Bypass -Command "Start Powershell { -file "C:\sandbox\initSandbox.ps1" }" -windowstyle maximized