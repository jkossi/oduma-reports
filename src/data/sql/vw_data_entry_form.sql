USE [Acquire]
GO
	/****** Object:  View [dlk].[vwFormData]    Script Date: 8/24/2023 6:33:03 AM ******/
SET
	ANSI_NULLS ON
GO
SET
	QUOTED_IDENTIFIER ON
GO
	ALTER View [dlk].[vwFormData] as
select
	_t1.[ClientID],
	_t1.[ClientShortName],
	_t2.[DateID],
	'Date' = format(_t2.Date, 'dd-MMM-yyyy'),
	_t3.[TimeID],
	'Time' = _t3.[TimeValue],
	[Output Pressure] = min(
		case
			when _t4.MeasureID = 4 then [MeasureValue]
			else null
		end
	),
	[Output Volume] = min(
		case
			when _t4.MeasureID = 5 then [MeasureValue]
			else null
		end
	),
	[Output Temperature] = min(
		case
			when _t4.MeasureID = 6 then [MeasureValue]
			else null
		end
	),
	[Input Pressure] = min(
		case
			when _t4.MeasureID = 8 then [MeasureValue]
			else null
		end
	),
	[Input Temperature] = min(
		case
			when _t4.MeasureID = 9 then [MeasureValue]
			else null
		end
	),
	[End of Day Volume] = min(
		case
			when _t4.MeasureID = 15 then [MeasureValue]
			else null
		end
	),
	[HHV] = min(
		case
			when _t4.MeasureID = 16 then [MeasureValue]
			else null
		end
	),
	[End of Day Energy] = min(
		case
			when _t4.MeasureID = 17 then [MeasureValue]
			else null
		end
	),
	[Comment] = min(
		case
			when _t4.MeasureID = 18 then [MeasureValue]
			else null
		end
	),
	[Number of units] = min(
		case
			when _t4.MeasureID = 19 then [MeasureValue]
			else null
		end
	),
	[Steam in operation] = min(
		case
			when _t4.MeasureID = 20 then [MeasureValue]
			else null
		end
	),
	[Power] = min(
		case
			when _t4.MeasureID = 21 then [MeasureValue]
			else null
		end
	),
	[Regulator Outlet Pressure] = min(
		case
			when _t4.MeasureID = 22 then [MeasureValue]
			else null
		end
	),
	[EOD Power Generated ] = min(
		case
			when _t4.MeasureID = 23 then [MeasureValue]
			else null
		end
	),
	[Flow Rate] = min(
		case
			when _t4.MeasureID = 25 then [MeasureValue]
			else null
		end
	),
	[Buyer Declared Volume] = min(
		case
			when _t4.MeasureID = 27 then [MeasureValue]
			else null
		end
	),
	[Supplier Declared Volume] = min(
		case
			when _t4.MeasureID = 28 then [MeasureValue]
			else null
		end
	),
	[Steam power] = min(
		case
			when _t4.MeasureID = 29 then [MeasureValue]
			else null
		end
	),
	[Assoc. Gas Prod. 1] = min(
		case
			when _t4.MeasureID = 30 then [MeasureValue]
			else null
		end
	),
	[Assoc. Gas Prod. 4] = min(
		case
			when _t4.MeasureID = 31 then [MeasureValue]
			else null
		end
	),
	[Assoc. Gas Prod. 3] = min(
		case
			when _t4.MeasureID = 32 then [MeasureValue]
			else null
		end
	),
	[Assoc. Gas Prod. 2] = min(
		case
			when _t4.MeasureID = 33 then [MeasureValue]
			else null
		end
	),
	[Non-Assoc. Gas Prod. 1] = min(
		case
			when _t4.MeasureID = 34 then [MeasureValue]
			else null
		end
	),
	[Non-Assoc. Gas Prod. 2] = min(
		case
			when _t4.MeasureID = 35 then [MeasureValue]
			else null
		end
	),
	[Non-Assoc. Gas Prod. 3] = min(
		case
			when _t4.MeasureID = 36 then [MeasureValue]
			else null
		end
	),
	[Non-Assoc. Gas Prod. 4] = min(
		case
			when _t4.MeasureID = 37 then [MeasureValue]
			else null
		end
	),
	[ORF Fuel Gas] = min(
		case
			when _t4.MeasureID = 38 then [MeasureValue]
			else null
		end
	),
	[FPSO Fuel Gas] = min(
		case
			when _t4.MeasureID = 39 then [MeasureValue]
			else null
		end
	),
	[Flared Gas] = min(
		case
			when _t4.MeasureID = 40 then [MeasureValue]
			else null
		end
	),
	[Gas injected] = min(
		case
			when _t4.MeasureID = 41 then [MeasureValue]
			else null
		end
	),
	[Fuel Gas import] = min(
		case
			when _t4.MeasureID = 42 then [MeasureValue]
			else null
		end
	),
	[Gas export] = min(
		case
			when _t4.MeasureID = 43 then [MeasureValue]
			else null
		end
	),
	[Avg. Flow rate] = min(
		case
			when _t4.MeasureID = 44 then [MeasureValue]
			else null
		end
	),
	[Gas Lift] = min(
		case
			when _t4.MeasureID = 45 then [MeasureValue]
			else null
		end
	),
	[Gas Received] = min(
		case
			when _t4.MeasureID = 46 then [MeasureValue]
			else null
		end
	),
	[Export to Supplier 2] = min(
		case
			when _t4.MeasureID = 47 then [MeasureValue]
			else null
		end
	),
	[Supplier 2 export] = min(
		case
			when _t4.MeasureID = 48 then [MeasureValue]
			else null
		end
	),
	[Run-in notice] = min(
		case
			when _t4.MeasureID = 49 then [MeasureValue]
			else null
		end
	),
	[_Date2] = min(
		case
			when _t4.MeasureID = 50 then [MeasureValue]
			else null
		end
	),
	[_Time2] = min(
		case
			when _t4.MeasureID = 51 then [MeasureValue]
			else null
		end
	)
from
	[dbo].[client] _t1
	left join [dlk].[Date] _t2 on 1 = 1
	left join [dbo].[Time] _t3 on 1 = 1
	left join [dbo].[Measure] _t4 on 1 = 1
	left join [dlk].[FormData] _t5 on (_t5.ClientID = _t1.ClientID)
	and (_t5.DateID = _t2.DateID)
	and (_t5.TimeID = _t3.TimeID)
	and (_t5.MeasureID = _t4.MeasureID)
group by
	_t1.[ClientID],
	_t1.[ClientShortName],
	_t2.[DateID],
	_t2.[Date],
	_t3.[TimeID],
	_t3.[TimeValue]
GO
