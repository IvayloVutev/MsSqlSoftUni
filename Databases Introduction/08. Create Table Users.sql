 
--8
  CREATE TABLE Users
  (
    Id BIGINT PRIMARY KEY IDENTITY,
    Username VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	LastLoginTime DATETIME2,
	IsDeleted BIT  
  );

  INSERT INTO Users
  VALUES 
    ('Pesho', '123455', null, '10-20-2023', 0),
    ('Pesho1', '223456', null, '9-19-2023', 1),
    ('Pesho2', '323457', null, '8-18-2023', 0),
    ('Pesho3', '423458', null, '7-17-2023', 1),
    ('Pesho4', '523459', null, '6-16-2023', 0)

-- 9
 ALTER TABLE [Users] 
   DROP CONSTRAINT PK__Users__3214EC07B3FE98E9

 ALTER TABLE [Users]
   ADD CONSTRAINT Id_Username PRIMARY KEY (Id,Username);

 --10
 ALTER TABLE [Users] 
   ADD CONSTRAINT CHK_PasswordLen CHECK(LEN([Password]) >= 5);
 
 --11
 ALTER TABLE [Users]
   ADD CONSTRAINT DF_LastLoginTime DEFAULT GETDATE() FOR [LastLoginTime]

 --12
 ALTER TABLE [Users]
   DROP CONSTRAINT Id_Username
 ALTER TABLE [Users]
   ADD CONSTRAINT PK_Id PRIMARY KEY(Id)
 ALTER TABLE [Users]
   ADD CONSTRAINT UC_Username UNIQUE (Username)
 ALTER TABLE [Users]
   ADD CONSTRAINT CHK_Username CHECK(LEN([Username]) >=3)