param(
  $EVENTDATA
)

$data = $EVENTDATA.EventProperties.Data | ConvertFrom-Json
Write-Verbose $data

$cred = Get-AutomationPSCredential -Name 'Demo-SP-Site-Cred'
$url = Get-AutomationVariable -Name 'Demo-SP-Site-URL'

$siteConnection = Connect-PnPOnline -Credentials $cred -Url $url -ReturnConnection
$addedItem = Add-PnPListItem -List 'File Names' -Values @{ 'Title' = "$data.FileName" } -Connection $siteConnection
