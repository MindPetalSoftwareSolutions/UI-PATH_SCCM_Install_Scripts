[CmdletBinding()]
Param (
    [Parameter(Mandatory = $true)]
    [String] $condpackagefilepath,
    [Parameter(Mandatory = $true)]
    [String] $installscriptfilepath

)

$Scripts = $condpackagefilepath, $installscriptfilepath
$ErrorActionPreference = 'Stop'
$Scripts |% { & $_ }
Write-Output "Master Script Execution end"