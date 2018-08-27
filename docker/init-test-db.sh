#!/bin/bash

psql -c "CREATE ROLE ddluser WITH LOGIN PASSWORD 'ddluser';" -U postgres
psql -c "GRANT ALL PRIVILEGES ON DATABASE sogis TO ddluser;" -U postgres
psql -c "CREATE ROLE dmluser WITH LOGIN PASSWORD 'dmluser';" -U postgres
psql -c "CREATE ROLE readeruser WITH LOGIN PASSWORD 'readeruser';" -U postgres
psql -c "SELECT version();" -d sogis -U postgres
psql -c "CREATE EXTENSION postgis;" -d sogis -U postgres
psql -c "CREATE EXTENSION \"uuid-ossp\";" -d sogis -U postgres
psql -c "SELECT postgis_full_version();" -d sogis -U postgres
psql -c "ALTER DATABASE sogis SET postgis.gdal_enabled_drivers TO 'GTiff PNG JPEG';" -d sogis -U postgres
