USE [Acquire]
GO

/****** Object:  View [dlk].[vwFormData]    Script Date: 8/24/2023 6:33:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create a variable to store the dynamic SQL query
DECLARE @DynamicSQL NVARCHAR(MAX)

-- Construct the initial part of the dynamic SQL query
SET @DynamicSQL = '
SELECT
    _t1.[ClientID],
    _t1.[ClientShortName],
    _t2.[DateID],
    ''Date'' = FORMAT(_t2.Date, ''dd-MMM-yyyy''),
    _t3.[TimeID],
    ''Time'' = _t3.[TimeValue]' 

-- Construct the dynamic columns based on measures from [dbo].[Measure] table
DECLARE @MeasureColumns NVARCHAR(MAX)
SELECT @MeasureColumns = STRING_AGG(
    '    ,[' + MeasureName + '] = MIN(CASE WHEN _t4.MeasureID = ' + CAST(MeasureID AS NVARCHAR(MAX)) + ' THEN [MeasureValue] ELSE NULL END)',
    CHAR(13) + CHAR(10)
)
FROM [dbo].[Measure]

-- Append the dynamic columns to the dynamic SQL query
SET @DynamicSQL = @DynamicSQL + CHAR(13) + CHAR(10) + @MeasureColumns

-- Add the rest of your query
SET @DynamicSQL = @DynamicSQL + CHAR(13) + CHAR(10) + '
FROM
    [dbo].[client] _t1
    LEFT JOIN [dlk].[Date] _t2 ON 1 = 1
    LEFT JOIN [dbo].[Time] _t3 ON 1 = 1
    LEFT JOIN [dbo].[Measure] _t4 ON 1 = 1
    LEFT JOIN [dlk].[FormData] _t5 ON (
        _t5.ClientID = _t1.ClientID
        AND _t5.DateID = _t2.DateID
        AND _t5.TimeID = _t3.TimeID
        AND _t5.MeasureID = _t4.MeasureID
    )
GROUP BY
    _t1.[ClientID],
    _t1.[ClientShortName],
    _t2.[DateID],
    _t2.[Date],
    _t3.[TimeID],
    _t3.[TimeValue]'

-- Execute the dynamic SQL query
EXEC sp_executesql @DynamicSQL;
GO
