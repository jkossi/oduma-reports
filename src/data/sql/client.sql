CREATE VIEW vwClientData
as
select 
cl.ClientID,
cl.ClientName,
cl.ClientShortName,
cl.IsActive,
cl.IsDeleted IsDeletedClient,
cl.ClientGroupID,
clg.ClientGroup,
clg.IsDeleted IsDeletedClientGroup,
cl.ClientTypeID,
ct.ClientType,
ct.IsDeleted IsDeletedClientType,
cl.UpdatedBy ClientUpdater,
cl.UpdatedAt ClientUpdatedAt
from dbo.Client cl
left join dbo.ClientType ct on ct.ClientTypeID = cl.ClientTypeID
left join dbo.ClientGroup clg on clg.ClientGroupID = cl.ClientGroupID
