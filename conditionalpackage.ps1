if (Get-PackageProvider -Name NuGet) {
    try {
        Install-PackageProvider -Name NuGet -Confirm:$False -Force -Scope CurrentUser
    }
    catch [Exception]{
        $_.message 
        exit
    }
}
else {
    Write-Host "Version of NuGet installed = " (Get-PackageProvider -Name NuGet).version
}

if (Get-Module -ListAvailable -Name UiPath.Powershell){
    Write-Host "UiPath.Powershell Already Installed"
} 
else {
    try {
        
        Register-PSRepository -Name UiPath -SourceLocation https://www.myget.org/F/uipath-dev/api/v2
        Install-Module -Repository UiPath -Name UiPath.Powershell -AllowClobber -Confirm:$False -Force 
         
    }
    catch [Exception] {
        $_.message 
        exit
    }


}