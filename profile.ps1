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

# Git
# ###
function git-merge-to-team-branch {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$True, ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
    [string]
    $teamBranchName,
    [Parameter(Mandatory=$True, ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
    [string]
    $targetBranchName
  )

  git checkout $targetBranchName
  if ($?) {
    git pull --rebase
  }
  if ($?) {
    git checkout $teamBranchName
  }
  if ($?) {
    git pull --rebase
  }
  if ($?){
    git merge $targetBranchName
  }
}

# Arcadia - Itslearning
# #####################
function itsl {
  cd C:\code\main\
}

function itslog {
  Select-String ': error' 'C:\GentlemanLog.txt'
}

function itsbuild {
  C:\code\main\DevSetup\HelperScripts\BuildLocally\Build_Itslearning.cmd 1 0 0 1 0 0 0 0 0 KISS Forever
  itslog
}

function itsmari {
    C:\code\main\DevSetup\HelperScripts\BuildLocally\Build_Itslearning.ps1 -update_databases -combine_sql_scripts
}
