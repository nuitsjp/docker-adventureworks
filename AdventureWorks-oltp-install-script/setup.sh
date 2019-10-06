#start SQL Server, start the script to create the DB and import the data, start the app
export ACCEPT_EULA=Y
export SA_PASSWORD=P@ssw0rd!
/opt/mssql/bin/sqlservr &

#wait for the SQL Server to come up
sleep 90s

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd! -d master -i /work/instawdb.sql
# & /usr/src/app/import-data.sh & npm start 
