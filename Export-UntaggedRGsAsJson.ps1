Connect-AzAccount -Identity | Out-Null
$untaggedRgs = Get-AzResourceGroup | Where-Object { $_.Tags.Count -eq 0 }
$output = @{
Found = $false
UntaggedRGs = @()
TimeStamp = (Get-Date)
}
if ($unTaggedRgs) {
$output.UntaggedRGs = $untaggedRgs | Select-Object -Property
ResourceGroupName,ResourceId,Tags
$output.Found = $true
}
else {
Write-Host 'Resource groups without tags were not found.'
} Write-Output ($output |
ConvertTo-Json -
Depth 5)
