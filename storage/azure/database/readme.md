1. Create an Azure MySQL Database: https://portal.azure.com/#create/Microsoft.SQLDatabase
- Ensure to name the MySQL DB **k8stest**
- Use the username: root1
- Use the password: Password1
- Ensure to set up a public endpoint under the **Connectivity method** section of the **Networking** section
Ensure to enable the **Add current client IP address**  under the **Connectivity method** section of the **Networking** section

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

### Azure DB
```
docker run --name mysqlcontainer -p 3306:3306 -e MYSQL_ROOT_USER=root1 -e MYSQL_ROOT_PASSWORD=Password1 -e MYSQL_DATABASE=k8stest -e MYSQL_HOST=k8stesteveryday.database.windows.net mysql:latest
```

### Docker Compose Settings
```
version: '3'

services:
  database:
    image: mysql:latest
    volumes:
      - mysql_data:/var/lib/mysql
    restart: always
    container_name: mysql_container
    environment:
      - MYSQL_ROOT_PASSWORD=Password1
      - MYSQL_DATABASE=k8stest
      - MYSQL_ROOT_USER=root1
      - MYSQL_HOST=k8stesteveryday.database.windows.net mysql:latest
```