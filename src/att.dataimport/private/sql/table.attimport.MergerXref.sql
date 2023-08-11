IF OBJECT_ID('attimport.MergerXref', 'U') IS NULL
BEGIN
    CREATE TABLE attimport.MergerXref
    (
        Id      int          IDENTITY(1,1),
        ATTUID  nvarchar(10) NULL,
        ATTHRID nvarchar(10) NULL,
        CUID    nvarchar(10) NULL,
        BSCUID  nvarchar(10) NULL,
        BSUID   nvarchar(10) NULL
        CONSTRAINT PK_MergerXref_Id PRIMARY KEY CLUSTERED (Id ASC)
    )
END