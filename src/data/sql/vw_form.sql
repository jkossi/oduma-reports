CREATE view [dbo].[vwForm] 
as 
select
	[FormID],
	'FormID2' = 'DTF_' + right('000' +  cast(FormID as varchar), 4),
	[FormName],
	'FormName2' = [FormName] + ' (' + _t2.TimeLevel + ')',
	_t1.[TimeLevelID], 
	_t2.TimeValues,
	_t1.[IsActive],
	_t1.IsDeleted,
	_t1.UpdatedBy,
	_t1.UpdatedAt
from [dbo].[Form] _t1
	left join [dbo].[TimeLevel] _t2 on _t2.TimeLevelID=_t1.TimeLevelID
where _t1.[IsDeleted]=0
