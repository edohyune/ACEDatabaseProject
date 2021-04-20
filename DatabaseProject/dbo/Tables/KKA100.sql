CREATE TABLE [dbo].[KKA100] (
    [pid]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [prj_no]     INT           NOT NULL,
    [prj_name]   VARCHAR (400) NOT NULL,
    [prj_sdate]  VARCHAR (10)  NULL,
    [prj_edate]  VARCHAR (10)  NULL,
    [prj_period] INT           NULL,
    [curr]       VARCHAR (20)  NULL,
    [amt_cntr]   DECIMAL (38)  NULL,
    [memo]       VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC)
);

