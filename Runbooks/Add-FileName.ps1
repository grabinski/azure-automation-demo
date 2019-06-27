param(
  $EVENTDATA
)

$EVENTDATA.Data.FileName

$cred = Get-AutomationPSCredential -Name 'Demo-SP-Site-Cred'
$url = Get-AutomationVariable -Name 'Demo-SP-Site-URL'
$siteConnection = Connect-PnPOnline -Credentials $cred -Url $url -ReturnConnection
$addedItem = Add-PnPListItem -List 'File Names' -Values @{ 'Title' = 'Test Title' } -Connection $siteConnection
