/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ClientID]
      ,[DateID]
      ,[MeasureID]
      ,[TimeID]
      ,[MeasureValue]
  FROM [Acquire].[dlk].[vwFormData2] where ClientID = 11 order by DateID desc

  select Measure.MeasureID, Measure.MeasureName from Measure  
  inner join FormMeasure on Measure.MeasureID = FormMeasure.MeasureID  
  where Measure.MeasureID in (18, 27, 28);
