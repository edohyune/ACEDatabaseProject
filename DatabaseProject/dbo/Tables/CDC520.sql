﻿CREATE TABLE [dbo].[CDC520] (
    [company]      VARCHAR (2)     NOT NULL,
    [flock]        VARCHAR (20)    NOT NULL,
    [hh]           VARCHAR (20)    NOT NULL,
    [chick_date]   DATE            NOT NULL,
    [ymd]          DATE            NOT NULL,
    [bg_ps_female] DECIMAL (38, 3) NULL,
    [bg_ps_male]   DECIMAL (38, 3) NULL,
    [ed_ps_female] INT             NULL,
    [ed_ps_male]   INT             NULL,
    [pd_ps_female] DECIMAL (38, 3) NULL,
    [pd_ps_male]   DECIMAL (38, 3) NULL,
    [ep]           DECIMAL (38, 3) NULL,
    [epCumm]       DECIMAL (38, 3) NULL,
    [pp5p]         DECIMAL (38, 6) NULL,
    [pp5pCumm]     DECIMAL (38, 6) NULL,
    [ave_pd]       INT             NOT NULL,
    [ave_acc]      INT             NOT NULL,
    [dd]           INT             NULL,
    [wk]           INT             NULL,
    [wd]           INT             NULL,
    [weekday]      VARCHAR (40)    NULL,
    [ep_type]      VARCHAR (10)    NULL,
    [stat]         VARCHAR (10)    NULL,
    [acc_ps]       DECIMAL (38, 3) NULL
);
