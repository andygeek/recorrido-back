# Prueba Tecnica - Recorrido.cl Back

Este es un API creado con Ruby on Rails que permite crear usuarios y a cada usuario le permitirá crear alertas de precios para distintas rutas. De esta forma el usuario podrá obtener un historio de los precios vien como este varía a lo alrgo de 7 días. 

## 1. Esquematizando los requerimientos del proyecto

### Casos de uso

<img src="https://imgur.com/8Dzjhb7.png" width="400"/>

### Diagrama de base de datos

<img src="https://imgur.com/GFubz7F.png" width="500"/>

## 2. Requerimientos y pasos

### Requerimientos

Este proyecto esta hecho usando Ruby 3.0.0 y Rails 6.1.4 por lo que es necesario tenerlo instalado en tu computadora.

Para la base de datos usamos SQLite, asi que también será necesario tenerlo instalado. 

Por último para ejecutar el cron que enviará solicitudes al API de Recorrido.cl en busqueda de los precios de buses usamos cron. Si usas alguna distribución de linux basado en Debian lo puedes instalar usando el siguiente comando.

```
...
```

### Inicializando el proyecto

Luego de descargar el repositorio debes instalar sus dependencias usando el siguiente comando.

```
bundle install
```

.
.
.

Por mi poca experiencia trabajando con Docker y ruby tube un problema al dockerizar el administrador de tareas (schedule) usando Docker. Asi que solo tenemos que hacerlo manualmente. Primero necesitamos intalar nuestra aplicación usando `bundle install`. Esto instalará todas las dependenicas, se recomienda utilizar ... para ejecutar la version 3 de ruby sin alterar la version que utilices para trabajar. Luego de esto necesitamos tener instalado cron, puedes usar `apt get install cron` en linux, aunque en ubuntu 20.0 ya viene instalado, asi que solo necesitaremos verificar que funciona usando `service cron status`. 

Lo siguiente es ejecutar whenever para poder subir nuestras tareas periodicas a cron. Para esto usamos el comando `whenever -w`. Con esto ya tenemos un cron revisando periodiamente el aPI para encontrar nuevos precios de buses. 

