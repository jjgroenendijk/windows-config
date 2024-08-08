# Clear the terminal
Clear-Host

function refreshEnvironment {
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
    $env:PATH += ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
}

function install-Config {
    Write-Output "Cloning .config..."

    git init "$env:USERPROFILE" --separate-git-dir "$env:USERPROFILE\.dotfiles"
    git remote add origin "https://github.com/jjgroenendijk/windows-config"
    git fetch
    git checkout -f main
    
    Clear-Host

    Write-Output "Initialized the powershell configuration"
}

function install-Git {
    winget install --exact Git.Git --source winget --accept-package-agreements --accept-source-agreements --silent
}

# Check if git is installed and if not, install it
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Output "Git is not installed. Installing Git..."
    install-Git
    refreshEnvironment
}

# Check if .config is up to date
if (-not (Test-Path "$env:USERPROFILE\.config")) { install-Config }


# Load all functions from the functions folder
$functions = Get-ChildItem -Path "$env:USERPROFILE\.config\powershell" -Recurse -Filter *.ps1
foreach ($function in $functions) {
    . $function.FullName
}