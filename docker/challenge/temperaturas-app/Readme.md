### Despliegue de la aplicación Temperaturas

Vamos a hacer un despliegue completo de una aplicación llamada Temperaturas. Esta aplicación nos permite consultar la temperatura mínima y máxima.

Esta aplicación está formada por dos microservicios:

### frontend: 

Es una aplicación escrita en Python que nos ofrece una página web para hacer las búsquedas y visualizar los resultados. Este microservicio hará peticiones HTTP al segundo microservicio para obtener la información. Este microservicio ofrece el servicio en el puerto 3000/tcp. 

Usaremos la imagen:

`roxsross12/temperaturas_frontend`

### backend: 

Es el segundo microservicio que nos ofrece un servicio web de tipo API Restful. A esta API Web podemos hacerles consultas sobre los municipios y sobre las temperaturas. En este caso, se utiliza el puerto 5000/tcp para ofrecer el servicio. 

Usaremos la imagen: 

`roxsross12/temperaturas_backend`

El microservicio frontend se conecta a backend usando el nombre temperaturas-backend. Por lo tanto el contenedor con el micorservicio backend tendrá ese nombre para disponer de una resolución de nombres adecuada en el dns.

cliente "localhost:3000" [FRONTEND] ---> "localhost:5000" [Backend] 
## creacion de network
docker network create red_temperatura 

# Correr Imagen
docker run -d --name back --network red_temperatura -p 5000:5000 roxsross12/temperaturas_backend

docker run -d --name front --network red_temperatura -p 80:3000 roxsross12/temperaturas_frontend

docker-compose



