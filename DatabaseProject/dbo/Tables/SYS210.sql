﻿CREATE TABLE [dbo].[SYS210] (
    [pid]           INT           IDENTITY (1, 1) NOT NULL,
    [sys]           VARCHAR (10)  DEFAULT ('10') NULL,
    [frm]           VARCHAR (20)  NULL,
    [wkset]         VARCHAR (10)  NULL,
    [seq]           INT           NOT NULL,
    [field]         VARCHAR (40)  NULL,
    [title]         VARCHAR (200) NULL,
    [field_type]    VARCHAR (10)  NULL,
    [width]         INT           NULL,
    [visible]       VARCHAR (1)   DEFAULT ('1') NULL,
    [necessary]     VARCHAR (1)   DEFAULT ('0') NULL,
    [allowedit]     VARCHAR (1)   DEFAULT ('0') NULL,
    [fixing]        VARCHAR (1)   DEFAULT ('0') NULL,
    [groupping]     VARCHAR (1)   DEFAULT ('0') NULL,
    [suppress]      VARCHAR (1)   DEFAULT ('0') NULL,
    [band_title1]   VARCHAR (200) NULL,
    [band_title2]   VARCHAR (200) NULL,
    [Pop]           VARCHAR (40)  NULL,
    [sum_type]      VARCHAR (20)  NULL,
    [format_type]   VARCHAR (20)  NULL,
    [align_text]    VARCHAR (20)  DEFAULT ('3') NULL,
    [align_title]   VARCHAR (20)  DEFAULT ('3') NULL,
    [default_value] VARCHAR (40)  NULL,
    [backColor]     VARCHAR (40)  NULL,
    [color]         VARCHAR (40)  CONSTRAINT [DF_SYS210_color] DEFAULT ('Black') NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC)
);
