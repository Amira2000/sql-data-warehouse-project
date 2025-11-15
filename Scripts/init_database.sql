/********************************************************************************************
    SCRIPT PURPOSE
    -----------------------------------------------------------------------------------------
    This script creates a new Data Warehouse environment by:
    1. Checking if the database 'DataWarehouse' already exists
    2. Dropping it if it does (⚠ WARNING: This action permanently deletes all data)
    3. Creating a fresh 'DataWarehouse' database
    4. Creating the Bronze, Silver, and Gold schemas

    ⚠ WARNING: 
    Running this script will ERASE the existing DataWarehouse database if it exists.
    Use with caution, especially in production environments.
*********************************************************************************************/

USE master;
GO

-- Check if the database exists and drop it
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT 'Database DataWarehouse already exists. Dropping database...';
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
    PRINT 'Database DataWarehouse dropped successfully.';
END
ELSE
BEGIN
    PRINT 'Database DataWarehouse does not exist. Proceeding to create it...';
END
GO

-- Create the new database
CREATE DATABASE DataWarehouse;
PRINT 'Database DataWarehouse created successfully.';
GO

-- Switch to the new database
USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

PRINT 'Schemas bronze, silver, and gold created successfully.';
