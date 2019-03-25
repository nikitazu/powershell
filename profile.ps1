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

function b64 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True, ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
        [string]
        $path
    )
    [Convert]::ToBase64String([IO.File]::ReadAllBytes($path))
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
  Select-String `
    -Pattern ': error' `
    -Path 'C:\Build_Itslearning_log.txt' `
    | Select-String -NotMatch -Pattern 'BlackboardCollaborate'
}

function itsbuild {
  C:\code\main\DevSetup\HelperScripts\BuildLocally\Build_Itslearning.ps1 -build_complete
  itslog
}

function itsprebuild {
  C:\code\main\DevSetup\HelperScripts\PreBuildWebProjects\PreBuildWebProjects.cmd
  itslog
}

function itsts {
  & "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\Msbuild.exe" "C:\code\main\Itslearning\StaticContent\Itslearning.Web.Cdn.csproj" /target:Build /verbosity:minimal
}

function itsmari {
    C:\code\main\DevSetup\HelperScripts\BuildLocally\Build_Itslearning.ps1 -update_databases -combine_sql_scripts -skipUnitTests -skipInstallBuildPrerequisitesAndGulp
}

function itsyarn {
    if ("$(pwd)" -eq "C:\code\main") {
        & "C:\Program Files\Git\bin\sh.exe" --login -i -c "git update-index --assume-unchanged Itslearning/StaticContent/application/Calendar_Overview/Calendar_Overview.bundle.min.*"
    } else {
        Write-Error "You should be in C:\code\main to do this"
    }
}

function itsunyarn {
    if ("$(pwd)" -eq "C:\code\main") {
        & "C:\Program Files\Git\bin\sh.exe" --login -i -c "git update-index --no-assume-unchanged Itslearning/StaticContent/application/Calendar_Overview/Calendar_Overview.bundle.min.*"
    } else {
        Write-Error "You should be in C:\code\main to do this"
    }
}
