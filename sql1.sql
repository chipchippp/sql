USE master
GO
IF(DB_ID('Lab04') IS NOT NULL)
      DROP DATABASE Lab04
GO
CREATE DATABASE Lab04
ON PRIMARY
(
    NAME= N'Lab04 data',
    FILENAME = N'C:\Temp\Lab04_data.mdf'
)
LOG ON
(
      NAME= N'Lab04_log',
      FILENAME = N'C:\Temp\Lab04_log.ldf'
)
GO
USE Lab04
GO
	  