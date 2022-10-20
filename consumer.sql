-- Get Current Namespace
SELECT CURRENT_NAMESPACE

-- Show Datashares
SHOW DATASHARES

-- Create a Database from the Datashare
CREATE DATABASE from_datashare_db FROM DATASHARE datashare_to_serverless OF NAMESPACE '<name_space_of_producer_cluster>';

-- Test the Datashare
SELECT * FROM from_datashare_db.public.people