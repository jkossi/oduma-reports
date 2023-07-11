CREATE VIEW vwNominations
AS
SELECT
ClientID,
ClientName,
Date,
MAX(CASE WHEN MeasureName = 'Comment' THEN MeasureValue END) AS Comment,
MAX(CASE WHEN MeasureName = 'Buyer Declared Volume' THEN MeasureValue END) AS BuyerDeclaredVolume,
MAX(CASE WHEN MeasureName = 'Supplier Declared Volume' THEN MeasureValue END) AS SupplierDeclaredVolume
from
(
  SELECT
  DISTINCT MeasureID, ClientName, ClientID, Date, MeasureValue, MeasureName
  FROM dbo.vwFormAndFileData
  WHERE FormID = 12
  AND IsActiveClient = 1
) AS SubQueryNominations
GROUP BY ClientID, ClientName, Date

