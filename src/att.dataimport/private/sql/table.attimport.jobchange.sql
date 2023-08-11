IF OBJECT_ID('attimport.JobChange', 'U') IS NULL
BEGIN
    CREATE TABLE attimport.JobChange
    (
        Id            int          IDENTITY(1,1),
        ATTUID        nvarchar(50) NULL,
        Lastname      nvarchar(50) NULL,
        Firstname     nvarchar(50) NULL,
        CUID          nvarchar(50) NULL,
        BLSUID        nvarchar(50) NULL,
        BLSCUID       nvarchar(50) NULL,
        HRID          nvarchar(50) NULL,
        MgrATTUID     nvarchar(50) NULL,
        JobChangeDate date         NULL,
        CONSTRAINT PK_JobChange_Id PRIMARY KEY CLUSTERED (Id ASC)
    )
END