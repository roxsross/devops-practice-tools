### Welcome a la Class de Docker

### Docker images
_Muestra un listado de todas las images

`$docker images`

### Docker ps
_docker ps muestra un listado de los contenedores en ejecución

`$docker ps`

### Docker Pull
_docker pull, el cual permite extraer la imagen de un repositorio

`$docker pull``

### Docker Push 
_docker push permite cargar las images creadas a cualquier repositorio principalmente a docker hub

`$docker push`

### Docker run 
_Iniciar el Contenedor

`$docker run`

### Docker exec
_docker Exec se utiliza para conectarse y obtener una shell (acceso)

`$docker exec -it CONTENEDOR_ID`

### Docker inspect
_docker Inspect es un comando que permite obtener información detallada del contenedor

### Docker rm
_docker rm es un comando que permite la eliminación de contenedores, imágenes, volúmenes

### Ejemplo: 
Descarguemos la imagen de Jenkins

[dockerhub](https://hub.docker.com/r/jenkins/jenkins)

Paso 1: Descargar jenkins
docker pull jenkins/jenkins:latest

Paso 2: Buscar la imagen 
`$docker images |grep jenkins`

Paso 3: Ejecutamos el Contenedor
- El Flag -d ejecuta el contenedor en segundo plano e imprime el ID de contenedor

`$docker run -d jenkins/jenkins:latest` 

Paso 4: Listar si se ejecutó el contenedor
`$docker ps`

Paso 5: Mapear puerto
`$docker run -d -p 8080:8080 jenkins/jenkins:latest`

Paso 6: Si eliminamos
`$docker rm -f contenedor_id"

### Iniciar | Detener |Reiniciar

### Detener
`$docker stop ID_Container`

### Iniciar
`$docker start ID_Container`

### Ejemplo 2
_Conectar con el Contenedor con exec y sacar el secret de jenkins

Paso 1: iniciamos el contenedor Jenkins
`$docker run -d -p 8080:8080 jenkins/jenkins:latest`

Paso 2: ubicar la ruta donde esta ubicado el secret de jenkins y hacer un cat dentro del contenedor 
`cat /var/jenkins_home/secrets/initialAdminPassword`

Paso 3: Docker Exec
`$docker exec -ti "container_ID" bash

_Nota: - Es posible que su contenedor no tenga bash y, de ser así, puede usar sh.

`$docker exec -ti "container_ID" sh

Paso 4: problemos agregar el usuario root
`$docker exec -u root -ti "container_ID" bash

### Variables de Entorno

Paso 1: agregarlo al momento de correr el contenedor

`$docker run -d -e "prueba1=4321" nathanpeck/greeting`

`$docker run -d -p 80:80 docker/getting-started`

Paso 2: entrar en el contenedor y revisar si tiene la variable de entorno

`$docker exec -it contenedorID sh`   

Paso 3: en el Dockerfile


### Crear contenedor mysql
```
`$docker pull mysql:5.7`
`$docker run -d -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=12345678" -e "MYSQL_DATABASE=docker-db" -e "MYSQL_USER=docker-user" -e "MYSQL_PASSWORD=88321564" mysql:5.7`
`$docker logs -f my-db1`
`mysql -u root -h 127.0.0.1 -p12345678 --port 3306`
`mysql -u root -h 127.0.0.1 -p12345678`
`show databases;`

###registry 
docker login -u username_dockerhub

docker build -t nombre_imagen:etiqueta 

docker tag nombre_imagen:etiqueta username_dockerhub/nombre_imagen:etiqueta

docker push username_dockerhub/nombre_imagen:etiqueta

docker logout

docker login -u "myusername" -p "mypassword" docker.io
