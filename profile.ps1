import-module PsGet
import-module PsUrl
import-module Jump.Location
import-Module PSColor
import-Module PsHosts

function pkill {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$True, ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
    [string]
    $name
  )

  foreach($p in Get-Process -Name $name) { kill $p.Id }
}

function pkill-vsdev {
  pkill WebDev.WebServer40
}
