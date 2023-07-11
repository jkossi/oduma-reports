select
distinct MeasureID, *
from dbo.vwFormAndFileData
where ClientID = 11
and FormID = 12
and IsActiveClient = 1
and Date between '2023-06-28' and '2023-06-28'
order by  DateID desc
