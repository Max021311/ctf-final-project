Repos utilizados
- https://github.com/Max021311/ctf-web-app (El cliente de escritorio que consume el API de los servidores)
- https://github.com/Max021311/ctf-crud-microservice (Para generar la imagen de Docker del servidor CRUD)
- https://github.com/Max021311/ctf-auth-microservice (Para generar la imagen de Docker del servidor autenticación)

## Como lanzar el proyecto en minikube

Antes que nada sera necesario actualizar el manifest.yaml para que utilice los datos de accesos correctos para la base de datos ya que estan configurados los valores por defecto de una instancia de PostgreSQL que pueden no ser los correctos.

### Iniciar Minikube y desplegar el proyecto
En una terminal ejecuta los siguientes comandos

1. `minikube start`
2. `minikube addons enable ingress`
3. `kubectl apply -f manifest.yaml`
4. `sudo minikube tunnel`

### Probar el proyecto
En una terminal ejecutamos lo siguiente:

1. `curl http://$(minikube ip)/api/crud/ok` en Linux o `curl http://127.0.0.1/api/crud/ok` en MacOs
2. Lo mismo que en el paso anterior pero con la ruta `/api/auth/ok`

Ahora descarga el repo https://github.com/Max021311/ctf-web-app y ejecuta el proyecto siguiente el README.md y configurando las variables de entorno `VITE_AUTH_SERVER_HOST` y `VITE_CRUD_SERVER_HOST` a la respectiva IP donde se expone el Ingress y en su respectiva ruta.

## Como lanzar el proyecto usando la integración de Kubernetes en Docker Desktop

Antes que nada sera necesario actualizar el manifest.yaml para que utilice los datos de accesos correctos para la base de datos ya que estan configurados los valores por defecto de una instancia de PostgreSQL que pueden no ser los correctos.

### Iniciar Kubernetes en Docker Desktop y desplegar el proyecto (https://docs.docker.com/desktop/kubernetes/)

1. Abrir docker desktop
2. Ir a Configuraciones>Kubernetes
3. Marcar la casilla para habilitar Kubernetes
4. Dar clic en el boton para aplicar y guardar cambios.
5. Espera a que termine de iniciar Kubernetes
6. Desplega el proyecto `kubectl apply -f manifest.yaml`
7. Para que el Ingress funcione de forma correcta es necesario ejecutar el siguiente comando para usar el controlador ingress-nginx.
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.43.0/deploy/static/provider/cloud/deploy.yaml
```

### Probar el proyecto

1. `curl http://$(minikube ip)/api/crud/ok` en Linux o `curl http://127.0.0.1/api/crud/ok` en MacOs
2. Lo mismo que en el paso anterior pero con la ruta `/api/auth/ok`

Ahora descarga el repo https://github.com/Max021311/ctf-web-app y ejecuta el proyecto siguiente el README.md y configurando las variables de entorno `VITE_AUTH_SERVER_HOST` y `VITE_CRUD_SERVER_HOST` a la respectiva IP donde se expone el Ingress y en su respectiva ruta.
