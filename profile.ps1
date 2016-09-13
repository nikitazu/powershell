import-module PsGet
import-module PsUrl

function pkill {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$True, ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
    [string]
    $name
  )

  foreach($p in Get-Process -Name $name) { kill $p.Id }
}

function md5 {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$True, ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
    [string]
    $path
  )
  Get-FileHash -Path $path -Algorithm MD5
}

function pkill-vsdev {
  pkill WebDev.WebServer40
}

function pkill-vs {
  pkill devenv
}

# Arcadia - Itslearning
function itslog {
  Select-String ': error' 'C:\GentlemanLog.txt'
}
