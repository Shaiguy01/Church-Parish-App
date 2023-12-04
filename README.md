# Church-Parish-App
- database wise, it uses that local/msssql thing like in campus
- database is called ChurchDB
- line 17: SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ChurchDB;Integrated Security=True"); //created a connection to the ParishDB


# the create table script:
CREATE TABLE [dbo].[ParishTable](
	[personID] [int] IDENTITY(1,1) NOT NULL,
	[personFirstName] [varchar](50) NULL,
	[personLastName] [varchar](50) NULL,
	[personAge] [int] NULL,
	[gender] [varchar](50) NULL,
	[dateOfBirth] [date] NULL,
	[contactNumber] [nchar](10) NULL,
	[email] [varchar](50) NULL,
	[houseNumber] [int] NULL,
	[roadName] [varchar](50) NULL,
	[suburb] [varchar](50) NULL,
	[Occupation] [varchar](50) NULL,
	[TimeAndTalents] [varchar](50) NULL,
	[PreferredMassTime] [varchar](50) NULL,
	[stewardship] [varchar](50) NULL
) ON [PRIMARY]
GO



ok i hope thats all haha
