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

Function youtube-dl-audio {
    # Stop OneDrive Process
    Stop-Process -Name "onedrive"
  
    # Define path for music folder
    $MusicPath = [Environment]::GetFolderPath("MyMusic")
  
    # Download the music with the @args argument
    yt-dlp `
        --extract-audio `
        --embed-thumbnail `
        --add-metadata `
        --format m4a `
        --output "$MusicPath\%(title)s.%(ext)s" `
        --restrict-filenames `
        --quiet `
        --progress `
        --download-archive "$MusicPath\history.txt" `
        @args
  
    # Start OneDrive process silently again
    Start-Process -FilePath "C:\Program Files\Microsoft OneDrive\OneDrive.exe" -ArgumentList "/background"
}

function weather { Invoke-RestMethod -Uri wttr.in }
  
function soundcloud-dl {
    # Stop OneDrive Process
    Stop-Process -Name "onedrive"
  
    # Define path for music folder
    $MusicPath = [Environment]::GetFolderPath("MyMusic")
  
    # Download the music with the @args argument
    yt-dlp `
        --extract-audio `
        --embed-thumbnail `
        --add-metadata `
        --output "$MusicPath\%(title)s.%(ext)s" `
        --restrict-filenames `
        --quiet `
        --progress `
        --download-archive "$MusicPath\history.txt" `
        @args
  
    # Start OneDrive process silently again
    Start-Process -FilePath "C:\Program Files\Microsoft OneDrive\OneDrive.exe" -ArgumentList "/background"
}