1. Create a new MySQL database: https://cloud.google.com/sql/docs/mysql/create-instance
- Choose **Enterprise** instead of **Enterprise Plus**
- Choose **Development** as the preset
_ Create an Instance ID of **k8stest**
- Ensure to name the MySQL DB **k8stest**
- Use the username: root1
- Use the password: Password1

### Local DB
1. Create a local Volume
```
docker volume create testvolume
```

2. Test running a local database in Docker
```
docker run -tid -v testvolume --name mysql -e MYSQL_ROOT_PASSWORD=Password12 mysql:latest
```

3. Look at the connection
```
docker container inspect mysql
```

### DB
```
docker run --name mysqlcontainer -p 3306:3306 -e MYSQL_ROOT_USER=root1 -e MYSQL_ROOT_PASSWORD=Password1 -e MYSQL_DATABASE=k8stest -e MYSQL_HOST=gold-mode-297211:northamerica-northeast1:test mysql:latest
```