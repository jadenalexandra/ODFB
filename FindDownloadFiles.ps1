#ODFB Usage By Licensed User
$ODFBbase = "https://theblueottergroup-my.sharepoint.com/personal/"
$users = Get-MsolUser -All | Where {$_.IsLicensed -eq $true}
$ODFBusage = $users | Foreach-Object {Get-SPOSite ($($ODFBbase)+$($_.UserPrincipalName.Replace(".","_"))).Replace("@","_") | Select Owner,StorageUsageCurrent}
$ODFBFileList = 
# http://www.nubo.eu/en/blog/2017/04/Enumerate-OneDrive-For-Business-Contents/
# https://stackoverflow.com/questions/35232628/powershell-script-to-view-all-onedrive-files-and-who-has-access-to-them
# https://stackoverflow.com/questions/47541426/how-to-download-files-from-onedrive-by-authenticating-using-get-credentials-usin
# https://community.spiceworks.com/topic/1880570-script-generating-listing-of-files-folders-on-onedrive-fromthe-cloud-not-local

$ODFBusage

<# NOTES
FANTASTIC! Several ODFB Scripts suitable for automation https://github.com/nickrod518/PowerShell-Scripts/blob/master/MSO/OneDrive.psm1
#>