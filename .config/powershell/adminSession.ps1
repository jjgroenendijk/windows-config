function runAsAdmin {

    param(
        [Parameter(Mandatory = $true)]
        [scriptblock]$script
    )

    # Check if the script is running as an administrator
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        # Relaunch as an administrator
        $encodedScript = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script.ToString() + "; Read-Host 'Press Enter to exit'"))
        Start-Process "powershell.exe" -Verb RunAs -Wait -ArgumentList "-NoProfile -ExecutionPolicy Bypass -EncodedCommand $encodedScript"
    }
    else {
        & $script
        Read-Host "Press Enter to exit"
    }

}

<#

Function:
Launch 32 bit system shell for intune/sccm packaging using psexec
%SystemRoot%\SysWOW64\WindowsPowerShell\v1.0\powershell.exe

#>
