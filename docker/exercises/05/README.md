## ENV Variables

Vamos a crear una nueva aplicación tonta de NodeJS

```bash
npm init -y
```

```bash
npm i express -S
```

Add a .gitignore file

```
node_modules
```

Crear _index.js_

```js
const express = require('express');

const PORT = 8080;
const message = (process.env.MESSAGE) ? process.env.MESSAGE : 'Nothing important';

const app = express();
app.get('/', (req, res) => {
    console.log(req);
    res.send('Hello World\n');
});

app.listen(PORT);

console.log(`Message: ${message}`);
console.log(`Running on http://localhost ${PORT}`);
```

Actualizamos packege.json

```diff
{
  ...
  "scripts": {
+   "start": "node .",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  ...
}

```

Crear _Dockerfile_

```Dockerfile
FROM node:alpine3.16

WORKDIR /opt/app

COPY . .

RUN npm install --only=production

EXPOSE 8080

CMD [ "npm", "start" ]
```

Create .dockerignore

```
node_modules
```

Construimos nuestra imagen

```bash
$ docker build -t myapp .
```

Ahora podemos ejecutar el contenedor, y alimentar varaibles de entorno de la siguiente manera:

```bash
$ docker run -e MESSAGE=hello -p 8080:8080 --name myapp myapp

> env_variables_demo@1.0.0 start /opt/app
> node index.js

Message: hello
Running on http://localhost 8080
```

En este comando en ejecución podemos acceder y ejecutar comandos:


```bash
$ docker exec -it myapp bash
```

Abrir otro terminal y ejecutar: 

```bash
$ docker exec -it myapp touch example.txt
```