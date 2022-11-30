# Almacenamiento y redes en Docker

### Almacenamiento
Los contenedores son efímeros, es decir, los ficheros, datos y configuraciones que creamos en los contenedores sobreviven a las paradas de los mismos pero, sin embargo, son destruidos si el contenedor es destruido.

Ante la situación anteriormente descrita, Docker nos proporciona varias soluciones para persistir los datos de los contenedores:

- Los volúmenes docker.
- Los bind mount

### Redes
Aunque hasta ahora no lo hemos tenido en cuenta, cada vez que creamos un contenedor, esté se conecta a una red virtual y docker hace una configuración del sistema (usando interfaces puente e iptables) para que la máquina tenga una ip interna, tenga acceso al exterior, podamos mapear (DNAT) puertos,…)

Cuando instalamos docker tenemos las siguientes redes predefinidas:

- Red de tipo bridge
- Red de tipo host
- Red de tipo none


### Gestionando volúmenes

Algunos comando útiles para trabajar con volúmenes docker:

- docker volume create: Crea un volumen con el nombre indicado.
- docker volume rm: Elimina el volumen indicado.
- docker volume prune: Para eliminar los volúmenes que no están siendo usados por ningún contenedor.
- docker volume ls: Nos proporciona una lista de los volúmenes creados y algo de información adicional.
- docker volume inspect: Nos dará una información mucho más detallada de el volumen que hayamos elegido.

docker volumen create web_vol

static apache: /usr/local/apache2/htdocs 

docker run -d --name web -v web_vol:/usr/local/apache2/htdocs -p 8080:80 httpd 

docker exec -it web bash

docker rm -f web

docker run -d --name web2 -v web_vol:/usr/local/apache2/htdocs -p 8080:80 httpd 

------

static nginx= /usr/share/nginx/html

docker run -d -v $PWD/index.html:/usr/share/nginx/html/index.html -p 9999:80 nginx

## ro = solo de lectura
docker run -d -v $PWD/index.html:/usr/share/nginx/html/index.html:ro -p 9991:80 nginx

# gestion network

Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks
  prune       Remove all unused networks
  rm          Remove one or more networks

  docker inspect ID_container |grep bridge -C 5

  docker run -it --name test --rm debian bash

  docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' test

  docker run -d --name web3 --network host roxsross12/web:1.0.0 

  docker network create red1

  docker run -d --name web --network red1 -p 8080:80 httpd 

  docker run -it --name test --network red1 --rm debian bash