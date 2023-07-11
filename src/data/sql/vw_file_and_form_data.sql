CREATE VIEW vwFormAndFileData
AS
select * from (
select
'file' as DataSource,
fld.FileID,
null as FormID,
fld.RecordID,
fld.DateID,
dat.Date,
fld.TimeID,
tm.TimeValue,
fld.ClientID,
cl.ClientShortName,
ct.ClientTypeID,
ct.ClientType,
cl.ClientName,
cl.IsActive IsActiveClient,
cl.IsDeleted IsDeletedClient,
fld.MeasureID,
msr.MeasureName,
fld.MeasureValue,
mtp.MeasureType,
mut.MeasureUnit,
msr.IsDeleted IsDeletedMeasure,
msr.IsActive IsActiveMeasure,
rds.RecordStatus,
fld.SourceID,
src.SourceName,
fle.FIlename,
fle.FileStatus,
src.IsActive IsActiveSource,
src.IsDeleted IsDeletedSource,
src.UpdatedBy SourceUpdater
from dlk.FileData fld
left join dlk.Date dat on dat.DateID = fld.DateID
left join dbo.Client cl on fld.ClientID = cl.ClientID
left join dbo.ClientType ct on ct.ClientTypeID = cl.ClientTypeID
left join dbo.Time tm on tm.TimeID = fld.TimeID
left join dbo.Source src on src.SourceID = fld.SourceID
left join dbo.Measure msr on msr.MeasureID = fld.MeasureID
left join dbo.MeasureType mtp on mtp.MeasureTypeID = msr.MeasureTypeID
left join dbo.MeasureUnit mut on mut.MeasureUnitID = msr.MeasureUnitID
left join dbo.RecordStatus rds on rds.RecordStatusID = fld.RecordStatusID
left join dbo.[File] fle on fle.FileID = fld.FileID

UNION ALL

select 
'form' as DataSource,
null as FileID,
frm.FormID,
null as RecordID,
fmd.DateID,
dat.Date,
fmd.TimeID,
tm.TimeValue,
fmd.ClientID,
cl.ClientShortName,
ct.ClientTypeID,
ct.ClientType,
cl.ClientName,
cl.IsActive IsActiveClient,
cl.IsDeleted IsDeletedClient,
fmd.MeasureID,
msr.MeasureName,
fmd.MeasureValue,
mtp.MeasureType,
mut.MeasureUnit,
msr.IsDeleted IsDeletedMeasure,
msr.IsActive IsActiveMeasure,
rds.RecordStatus,
null as SourceID,
frm.FormName as SourceName,
frm.FormName as FileName,
'PROCESSED' as FileStatus,
frm.IsActive as IsActiveSource,
frm.IsDeleted as IsDeletedSource,
frmsub.UpdatedBy as SourceUpdater
from dlk.FormData fmd
left join dlk.Date dat on dat.DateID = fmd.DateID
left join dbo.Client cl on fmd.ClientID = cl.ClientID
left join dbo.ClientType ct on ct.ClientTypeID = cl.ClientTypeID
left join dbo.Time tm on tm.TimeID = fmd.TimeID
left join dbo.Measure msr on msr.MeasureID = fmd.MeasureID
left join dbo.MeasureType mtp on mtp.MeasureTypeID = msr.MeasureTypeID
left join dbo.MeasureSize msz on msz.MeasureSizeID = msr.MeasureSizeID
left join dbo.MeasureUnit mut on mut.MeasureUnitID = msr.MeasureUnitID
left join dbo.FormMeasure fmsr on fmsr.MeasureID = fmd.MeasureID
left join dbo.Form frm on frm.FormID = fmsr.FormID
left join dbo.FormSubmit frmsub on frmsub.FormID = frm.FormID
left join dbo.RecordStatus rds on rds.RecordStatusID = fmd.RecordStatusID
) As FormAndFileData


