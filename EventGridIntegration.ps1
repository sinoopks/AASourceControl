param(
    [object]$WebhookData
)

Connect-AzAccount -Identity

$RequestBody = $WebhookData.RequestBody | ConvertFrom-Json

$DateCreated = [datetime]$RequestBody.eventTime
$tag = @{
    MonthCreated = $DateCreated.Month
    DayCreated   = $DateCreated.Day
    YearCreated  = $DateCreated.Year
}


Update-AzTag -ResourceId $RequestBody.Subject -Operation Merge -Tag $tag 
