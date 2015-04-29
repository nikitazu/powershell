(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

echo "import-module PsGet" >> $profile

install-module PsUrl
install-module Jump.Location
Install-Module PSColor
Install-Module PsHosts
