### Se construye la app

`docker build -t app-python:1.0.0 . `

`docker build -t app:python:1.0.0 -f `

docker run -d -p 8000:8000 app-python:1.0.0

curl localhost:8000
```
> curl localhost:8001
<!DOCTYPE html>
<html lang="en">
<body>

<h2>Hotname: e8a97746772c</h2>
<p>IP Address: 172.17.0.7</p>

</body>
</html>%  
```
### Consumer

# Modificar IP Linea 11 consumer.py

docker build -t consumer-python:1.0.0 .

docker run -it -e LOCAL=true consumer-python:1.0.0

```
> docker run -e LOCAL=true -it consumer-python:1.0.1
Run container on local
Response OK!!!
Response OK!!!
Response OK!!!
Response OK!!!
Response OK!!!
```

