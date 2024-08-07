

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
  
  Set-Alias -Name 'yt-audio' -Value 'youtube-dl-audio'
  
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