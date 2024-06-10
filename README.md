# Nagios Docker Deployment

## Descripción
Este proyecto contiene los archivos necesarios para crear una imagen Docker con Nagios Core y desplegarla en AWS ECS con persistencia en EFS.

## Pasos para Construir la Imagen Docker
1. Clonar este repositorio.
2. Navegar al directorio del proyecto.
3. Ejecutar `docker build -t nagios-image .`.
4. Ejecutar `docker run -d -p 80:80 --name nagios-container nagios-image`.
5. Acceder a `http://localhost` para verificar.

## Despliegue en AWS ECS
1. Configurar AWS CLI.
2. Crear un repositorio en ECR.
3. Subir la imagen Docker a ECR.
4. Crear un Cluster ECS.
5. Crear una definición de tarea y configurar EFS.
6. Crear un servicio ECS y configurar un ALB.
7. Verificar el acceso a Nagios y la persistencia de datos.

## Autor
-Roxy

