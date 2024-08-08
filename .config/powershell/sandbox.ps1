function sandbox {

    # Check if sandbox is installed

    # Install sandbox if not installed

    # open sandbox.wsb file

    runAsAdmin -script {

        function get-sandboxStatus {
            $sandboxStatus = Get-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -Online
            if ($sandboxStatus.State -eq "Enabled") { return $true }
            else { return $false }
        }

        if (-not (get-sandboxStatus)) {
            Write-Output "Enabling Windows Sandbox"
            Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online
        }
        else {
            Write-Output "Windows Sandbox already enabled!"
        }

    }

}