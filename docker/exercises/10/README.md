# 10

## Comprobamos las imágenes y los contenedores.

```bash
$docker images -a
$docker ps
$docker ps -a
```

## Creación del Dockerfile.

Usen node:16-alpine

```bash
FROM node:16-alpine


## Creación del contenedor.

```bash
$docker build -t "nodeweb:1.0.0" .
$docker images -a
$docker ps -a
$docker ps
```
## Levantamos el contenedor.

```bash
$docker run -d --name node -p 4000:4000 nodeweb:1.0.0
$docker ps -a
$docker ps
```

## Comprobación de la app corriendo.


## Deploy to Registry DockerHub.

```bash
$docker tag nodeweb:1.0.0 username_dockerhub/nodeweb:1.0.0
$docker push username_dockerhub/nodeweb:1.0.0
```

## Script para ejecutar los comandos anteriores.

```bash
#!/bin/bash

docker build -t nodeweb:1.0.0 .
docker run -d --name node -p 4000:4000 nodeweb:1.0.0
docker tag nodeweb:1.0.0 username_dockerhub/nodeweb:1.0.0
docker push username_dockerhub/nodeweb:1.0.0
```

## Salida al ejecutar script.sh.

```bash
$ chmod +x 10/script.sh
$ ./10/script.sh
```