# Prueba Tecnica - Recorrido.cl Back

...

## 1. Casos de uso

<img src="https://imgur.com/8Dzjhb7.png" width="400"/>

## 2. Page flow

<img src="https://imgur.com/LmsO7by.png" width="600"/>

## 3. Diagrama de base de datos

<img src="https://imgur.com/GFubz7F.png" width="500"/>

## 4. Requerimientos y pasos

Por mi poca experiencia trabajando con Docker y ruby tube un problema al dockerizar el administrador de tareas (schedule) usando Docker. Asi que solo tenemos que hacerlo manualmente. Primero necesitamos intalar nuestra aplicación usando `bundle install`. Esto instalará todas las dependenicas, se recomienda utilizar ... para ejecutar la version 3 de ruby sin alterar la version que utilices para trabajar. Luego de esto necesitamos tener instalado cron, puedes usar `apt get install cron` en linux, aunque en ubuntu 20.0 ya viene instalado, asi que solo necesitaremos verificar que funciona usando `service cron status`. 

Lo siguiente es ejecutar whenever para poder subir nuestras tareas periodicas a cron. Para esto usamos el comando `whenever -w`. Con esto ya tenemos un cron revisando periodiamente el aPI para encontrar nuevos precios de buses. 

