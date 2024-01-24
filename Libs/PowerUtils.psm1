function Get-StringHash{
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet("MD5", "SHA1", "SHA256", "SHA384", "SHA512")]
        [string]$Algorithm,

        [Parameter(Mandatory = $true)]
        [string]$String
    )

    $stream = [IO.MemoryStream]::new([byte[]][char[]]$String)
    Get-FileHash -InputStream $stream -Algorithm $Algorithm
}

function Import-RemoteModule{
    param(
       [Parameter(Mandatory = $true, HelpMessage = "Enter a RAW URL")]
       [string]$URL,
       [Parameter(Mandatory = $false)]
       [switch]$DLL,
       [Parameter(Mandatory = $false)]
       [switch]$Ps1,
       [Parameter(Mandatory = $false)]
       [switch]$Psm1
     )
   
     process {
   
       if (($URL -as [System.URI]).IsAbsoluteUri -eq $False) {
   
           Write-Host "URL is Missing http:// or https://" -ForegroundColor Yellow
   
           break
   
       }
   
     if ($URL -match ".DLL" -or $DLL -eq $true) {
    
       try{
           Import-Module ([System.Reflection.Assembly]::Load((Invoke-WebRequest -UseBasicParsing -Uri $URL).content)) -ErrorAction SilentlyContinue > $null
       }catch{
           Write-Host "Import-Module Failed to Import DLL, Make sure the Url is a direct link to the file." -ForegroundColor Red
       }
   
       break
   
     }
   
     if ($URL -match ".psm1" -or $Psm1 -eq $true) {
    
       try{
           New-Module -Name "$URL" -ScriptBlock ([Scriptblock]::Create((New-Object System.Net.WebClient).DownloadString($URL))) -ErrorAction SilentlyContinue > $null
       }catch{
           Write-Host "Import-Module Failed to Import Psm1 Module, Make sure the Url is a direct link to the raw code" -ForegroundColor Red
       }
   
       break
   
     }
   
     if ($URL -match ".ps1" -or $Ps1 -eq $true) {
   
       iex ((New-Object System.Net.WebClient).DownloadString($URL))
       Write-Host "Attempting to invoke the Ps1 script (There is no error handling for .Ps1 scripts)" -ForegroundColor Yellow
       Write-Host "Windows Bug Tip: If a script prompts for UAC and then force closes the Session, Try running the session as admin" -ForegroundColor Yellow
       
       break
   
     }
   
     Write-Host "The URL does not conatin any of file extensions: .DLL, .Ps1, or Psm1, or is Invailed." -ForegroundColor Yellow
     Write-Host "Please add the -DLL, -Ps1 or -Psm1 parameter to let the function know what file type it is." -ForegroundColor Yellow
   
     }
}

