# Como lanzar el proyecto en minikube

Repos utilizados
- https://github.com/Max021311/ctf-web-app (El cliente de escritorio que consume el API de los servidores)
- https://github.com/Max021311/ctf-crud-microservice (Para generar la imagen de Docker del servidor CRUD)
- https://github.com/Max021311/ctf-auth-microservice (Para generar la imagen de Docker del servidor autenticación)

Antes que nada sera necesario actualizar el manifest.yaml para que utilice los datos de accesos correctos para la base de datos ya que estan configurados los valores por defecto de una instancia de PostgreSQL que pueden no ser los correctos.

En una terminal ejecuta los siguientes comandos

1. `minikube start`
2. `minikube addons enable ingress`
3. `kubectl apply -f manifest.yaml`
4. `sudo minikube tunnel`

En otra terminal ejecutamos lo siguiente:

1. `curl http://$(minikube ip)/api/crud/ok` en Linux o `curl http://127.0.0.1/api/crud/ok` en MacOs
2. Lo mismo que en el paso anterior pero con la ruta `/api/auth/ok`

Ahora descarga el repo https://github.com/Max021311/ctf-web-app y ejecuta el proyecto siguiente el README.md y configurando las variables de entorno `VITE_AUTH_SERVER_HOST` y `VITE_CRUD_SERVER_HOST` a la respectiva IP donde se expone el Ingress y en su respectiva ruta.
