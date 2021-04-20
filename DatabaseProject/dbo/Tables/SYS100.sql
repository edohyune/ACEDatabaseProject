CREATE TABLE [dbo].[SYS100] (
    [pid]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [sys]      VARCHAR (10)  DEFAULT ('10') NOT NULL,
    [frm]      VARCHAR (20)  NOT NULL,
    [frm_name] VARCHAR (200) NULL,
    [memo]     VARCHAR (200) DEFAULT ('') NULL,
    [mdl]      VARCHAR (10)  DEFAULT ('') NULL,
    [yn_hide]  VARCHAR (1)   DEFAULT ('0') NULL,
    [yn_use]   VARCHAR (1)   DEFAULT ('1') NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC)
);

