# docker-adventureworks

SQL Server on Docker

## run

```cmd
docker-compose up -d
```

or

```cmd
docker run -e ACCEPT_EULA=Y -e SA_PASSWORD=P@ssw0rd! -p 1433:1433 -p 8080:8080 -d nuitsjp/adventureworks:latest
```

## stop

```cmd
docker stop adventureworks
```
