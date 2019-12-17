USE [EXP2ISU]
GO

/****** Object:  Table [dbo].[sh30]    Script Date: 11/28/2011 11:37:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sh30]') AND type in (N'U'))
DROP TABLE [dbo].[sh30]
GO

USE [EXP2ISU]
GO

/****** Object:  Table [dbo].[sh30]    Script Date: 11/28/2011 11:37:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sh30](
	[nn] [numeric](5, 0) NULL,
	[id] [numeric](10, 0) NULL,
	[rowid] [numeric](6, 0) NULL,
	[prod_abbr2] [varchar](40) NULL,
	[num_otgr] [varchar](9) NULL,
	[ves] [numeric](12, 6) NULL,
	[vzliv] [numeric](5, 0) NULL,
	[date_remov] [varchar](8) NULL,
	[np_data_o] [datetime] NULL,
	[np_timep] [varchar](8) NULL,
	[kol_all] [numeric](12, 6) NULL,
	[tara_all] [numeric](12, 6) NULL,
	[xpl] [numeric](6, 4) NULL,
	[pl] [numeric](6, 4) NULL,
	[temper] [numeric](5, 1) NULL,
	[defi_mass] [numeric](2, 0) NULL,
	[fio_driver] [varchar](60) NULL,
	[vzl_sert] [numeric](5, 0) NULL,
	[status] [numeric](2, 0) NULL,
	[card_id] [varchar](10) NULL,
	[card_num] [numeric](10, 0) NULL,
	[num_sec] [numeric](1, 0) NULL,
	[is_upd] [numeric](1, 0) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


