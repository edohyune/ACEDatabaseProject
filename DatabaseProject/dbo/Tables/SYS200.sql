CREATE TABLE [dbo].[SYS200] (
    [pid]                INT           IDENTITY (1, 1) NOT NULL,
    [sys]                VARCHAR (20)  CONSTRAINT [DF_SYS200_sys] DEFAULT ('10') NULL,
    [frm]                VARCHAR (20)  NULL,
    [wkset]              VARCHAR (10)  NULL,
    [memo]               VARCHAR (200) NULL,
    [wktype]             VARCHAR (10)  NULL,
    [grid_name]          VARCHAR (200) NULL,
    [chkNew]             VARCHAR (1)   CONSTRAINT [DF_SYS200_chkNew] DEFAULT ('0') NULL,
    [chkDelete]          VARCHAR (1)   CONSTRAINT [DF_SYS200_chkDelete] DEFAULT ('0') NULL,
    [chkUpdate]          VARCHAR (1)   CONSTRAINT [DF_SYS200_chkUpdate] DEFAULT ('0') NULL,
    [chkUse]             VARCHAR (1)   CONSTRAINT [DF_SYS200_chkUse] DEFAULT ('1') NULL,
    [chkShowFooter]      VARCHAR (1)   CONSTRAINT [DF_SYS200_chkShowerFooter] DEFAULT ('0') NULL,
    [chkShowGroupPanel]  VARCHAR (1)   CONSTRAINT [DF_SYS200_chkShowGroupPanel] DEFAULT ('1') NULL,
    [chkEditable]        VARCHAR (1)   CONSTRAINT [DF_SYS200_chkEditable] DEFAULT ('0') NULL,
    [chkOptionsFind]     VARCHAR (1)   CONSTRAINT [DF_SYS200_chkOptionsFind] DEFAULT ('1') NULL,
    [chkColumnAutoWidth] VARCHAR (1)   CONSTRAINT [DF_SYS200_chkColumnAutoWidth] DEFAULT ('1') NULL,
    [chkEvenRow]         VARCHAR (1)   CONSTRAINT [DF_SYS200_chkEvenRow] DEFAULT ('0') NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC)
);

