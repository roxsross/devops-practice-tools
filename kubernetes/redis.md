
```
##Deployment replica=1
kubectl create deployment redis-master --image=redis
kubectl create deployment redis-cli --image=redis

##Crear el Servicio
kubectl expose deploy redis-master --port=6379 --type=ClusterIP

##Accedo al pod redis-cli-xxxxxx

kubectl exec -it redis-cli  bash
### dentro del contenedor redis-cli

Root/xxxx $ redis-cli -h redis-master
redis-master:6379> set v1 10
redis-master:6379> get v1 

### Acceder al contenedor del master

kubectl exec redis-master -it bash
Root/xxxx $ redis-cli
127.0.0.1:6379> info keyspace

```

$ docker run -d --name servidor_mysql \
                --network red_wp \
                -v /opt/mysql_wp:/var/lib/mysql \
                -e MYSQL_DATABASE=bd_wp \
                -e MYSQL_USER=user_wp \
                -e MYSQL_PASSWORD=asdasd \
                -e MYSQL_ROOT_PASSWORD=asdasd \
                mariadb
                
$ docker run -d --name servidor_wp \
                --network red_wp \
                -v /opt/wordpress:/var/www/html/wp-content \
                -e WORDPRESS_DB_HOST=servidor_mysql \
                -e WORDPRESS_DB_USER=user_wp \
                -e WORDPRESS_DB_PASSWORD=asdasd \
                -e WORDPRESS_DB_NAME=bd_wp \
                -p 80:80 \
                wordpress