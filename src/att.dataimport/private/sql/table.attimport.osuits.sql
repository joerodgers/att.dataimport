IF OBJECT_ID('attimport.OSuits', 'U') IS NULL
BEGIN
    CREATE TABLE attimport.OSuits
    (
        Id             int          IDENTITY(1,1),
        ATTUID         nvarchar(50) NOT NULL,
        Lastname       nvarchar(50) NOT NULL,
        Firstname      nvarchar(50) NOT NULL,
        SeparationDate date         NOT NULL
        CONSTRAINT PK_Suits_Id PRIMARY KEY CLUSTERED (Id ASC)
    )
END