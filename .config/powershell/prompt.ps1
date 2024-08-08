$ProgressPreference = 'SilentlyContinue' # Hide progress bar. Make webrequest significantly faster

# Find a way to lazy load this

Write-output "
Hostname: 	$env:computername
WAN IP: 	$(curl ifconfig.me | Select-Object -ExpandProperty Content)
Local IP: 	$(Get-NetIPAddress -addressState Preferred -PrefixOrigin DHCP | Select-Object -ExpandProperty IPAddress)
Weather:	$(Invoke-RestMethod -Uri wttr.in/Apeldoorn?0?q?F)
"

$ProgressPreference = 'Continue' # Show progress bar again