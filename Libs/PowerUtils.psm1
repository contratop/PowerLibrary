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

