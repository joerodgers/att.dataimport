IF OBJECT_ID('attimport.osuits', 'U') IS NULL
BEGIN
    CREATE TABLE attimport.osuits
    (
        Id             int          IDENTITY(1,1),
        ATTUID         nvarchar(50) NOT NULL,
        Lastname       nvarchar(50) NOT NULL,
        Firstname      nvarchar(50) NOT NULL,
        SeparationDate date         NOT NULL
        CONSTRAINT PK_osuits_id PRIMARY KEY CLUSTERED (Id ASC)
    )
END