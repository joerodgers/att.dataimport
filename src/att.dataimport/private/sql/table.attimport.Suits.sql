﻿IF OBJECT_ID('attimport.Suits', 'U') IS NULL
BEGIN
    CREATE TABLE attimport.Suits
    (
        Id                       int          IDENTITY(1,1),
        ATTUID                   nvarchar(50) NULL,
        [Status]                 nvarchar(50) NULL,
        FirstName                nvarchar(50) NULL,
        UnOfficialFirstName      nvarchar(50) NULL,
        MiddleName               nvarchar(50) NULL,
        LastName                 nvarchar(50) NULL,
        EmpStatusCode            nvarchar(50) NULL,
        WorkStrAddr1             nvarchar(50) NULL,
        WorkStrAddr2             nvarchar(50) NULL,
        WorkCity                 nvarchar(50) NULL,
        WorkState                nvarchar(50) NULL,
        WorkZip                  nvarchar(50) NULL,
        WorkZipPlus4             nvarchar(50) NULL,
        WorkCountry              nvarchar(50) NULL,
        WorkPhone                nvarchar(50) NULL,
        WorkPhoneCellular        nvarchar(50) NULL,
        WorkFax                  nvarchar(50) NULL,
        WorkEmailId              nvarchar(50) NULL,
        WorkEmailServer          nvarchar(50) NULL,
        WorkURL                  nvarchar(50) NULL,
        SmtpAddress              nvarchar(50) NULL,
        PagerNumber              nvarchar(50) NULL,
        PagerPin                 nvarchar(50) NULL,
        PagerType                nvarchar(50) NULL,
        CompanyCode              nvarchar(50) NULL,
        CompanyName              nvarchar(50) NULL,
        LocationCode             nvarchar(50) NULL,
        ResponsibilityCode       nvarchar(50) NULL,
        BuildingCode             nvarchar(50) NULL,
        RegionCode               nvarchar(50) NULL,
        JobTitleDescription      nvarchar(50) NULL,
        UnofficialJobTitleDesc   nvarchar(50) NULL,
        UnofficialJobTitleSuffix nvarchar(50) NULL,
        EntityCode               nvarchar(50) NULL,
        EntityDescription        nvarchar(50) NULL,
        DominantJobFunctionCode  nvarchar(50) NULL,
        MgtLevelIndicator        nvarchar(50) NULL,
        Affiliate                nvarchar(50) NULL,
        BargainedIndicator       nvarchar(50) NULL
        CONSTRAINT PK_OSuits_id PRIMARY KEY CLUSTERED (Id ASC)
    )
END