CREATE VIEW [dbo].[vwGasOfftakeRequest]
AS
SELECT
ClientID,
ClientName,
Date,
MAX(CASE WHEN MeasureName = 'Comment' THEN MeasureValue END) AS Comment,
MAX(CASE WHEN MeasureName = 'Buyer Declared Volume' THEN MeasureValue END) AS EstimatedEquivalentVolume,
MAX(CASE WHEN MeasureName = 'Gas Requested Offtake' THEN MeasureValue END) AS RequestedOfftakeQuantity
from
(
  SELECT
  DISTINCT MeasureID, ClientName, ClientID, Date, MeasureValue, MeasureName
  FROM dbo.vwFormAndFileData
  WHERE FormID = 10019
  AND IsActiveClient = 1
) AS SubQueryNominations
GROUP BY ClientID, ClientName, Date
