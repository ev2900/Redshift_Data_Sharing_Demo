------------
-- Set Up --
------------

-- Create Table
CREATE TABLE dev.public.people (
  id INTEGER primary key,
  name character varying,
  created_at timestamp without time zone -- Always store time in UTC
);

-- Insert Record, Select
INSERT INTO dev.public.people values (1,'Chris', GETDATE());

INSERT INTO dev.public.people values (2,'Christopher', GETDATE());

INSERT INTO dev.public.people values (3,'Christopher Sharkey', GETDATE());

SELECT * FROM dev.public.people;

-- TRUNCATE TABLE dev.public.people;

---------------
-- Datashare --
---------------

-- Create Datashare
CREATE DATASHARE datashare_to_serverless;
-- DROP DATASHARE datashare_to_serverless

-- Add Table to Datashare
ALTER DATASHARE datashare_to_serverless ADD SCHEMA public ;
ALTER DATASHARE datashare_to_serverless ADD TABLE dev.public.people;

-- View all Objects in Datashare
SELECT * FROM SVV_DATASHARE_OBJECTS WHERE share_name = 'datashare_to_serverless';

-- Grant Access to Other Redshift (Serverless)
GRANT USAGE ON DATASHARE datashare_to_serverless TO NAMESPACE '<name_space_of_consumer_cluster>';

-- Get Current Namespace
SELECT CURRENT_NAMESPACE