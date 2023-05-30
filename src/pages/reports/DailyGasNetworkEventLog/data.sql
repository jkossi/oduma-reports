/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EventID]
      ,[Date]
      ,[Time]
      ,[ClientID]
      ,[Description]
      ,[Reason]
      ,[Impact]
      ,[Summary]
      ,[IsDeleted]
      ,[UpdatedBy]
      ,[UpdatedAt]
  FROM [Acquire].[dbo].[Event]
  where ClientID = 22
  and IsDeleted = 0
  and [Date] between '2022-07-01'  and '2022-07-25'
  order by [Date] asc

