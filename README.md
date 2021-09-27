# Recorrido.cl Back

Este es un API creado con Ruby on Rails que permite crear usuarios y a cada usuario le permitirá crear alertas de precios para distintas rutas. También tiene un cron cuya función es hacer una petición al API de recorrido.cl en búsqueda del precio mínimo para luego almacenarlo. Creando de esta manera un histórico del cambio de precio a lo largo de 7 días. 

El proyecto consta de controladores para el usuario en donde utilizamos [JWT](https://github.com/jwt/ruby-jwt) y [Bycript](https://github.com/bcrypt-ruby/bcrypt-ruby) para la generación de Token y para encriptar la contraseña del usuario.

Para hacer la petición a la API de recorrido.cl desde nuestra tarea(taks) utilizamos [Faraday](https://lostisland.github.io/faraday/). Asi mismo, para ejecutar esta tarea cada 5 minutos utilizamos [Whenever](https://github.com/javan/whenever) ya que este nos ayuda a escribir la tarea periodica dentro de nuestro cron, para que se ejecute cada 5 minutos.

Por último para las pruebas usamos [RSpec](https://github.com/rspec/rspec-rails) junto con algunas herramientas como [Faker](https://github.com/faker-ruby/faker) para generar datos dummy, [Shoulda-matchers](para agregar funcionalidades a nuestro rspec), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) para que nos ayude a crear automaticamnete registros en nuestra base de datos para nuestras pruebas.

## 1. Esquematizando los requerimientos del proyecto

### Casos de uso

<img src="https://imgur.com/8Dzjhb7.png" width="500"/>

### Diagrama de base de datos

<img src="https://imgur.com/EfYddvp.png" width="600"/>

### Flujo del cron

![](https://imgur.com/4uF197v.png)

## 2. Requerimientos y pasos

### Requerimientos

Este proyecto esta hecho usando Ruby 3.0.0 y Rails 6.1.4 por lo que es necesario tenerlo instalado en tu computadora. Para la base de datos usamos SQLite, asi que también será necesario tenerlo instalado. 

Por último para ejecutar el cron que enviará solicitudes al API de Recorrido.cl en busqueda de los precios de buses usamos **Cron**. Si usas alguna distribución de linux basado en Debian lo puedes instalar usando el siguiente comando.

```
apt-get install cron
...

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



## 4. Pruebas con Postman

Para enviar los datos del usuario para el las rutas de login y signup, estos deben tener la siguiente forma.

```json
{
    "user": {
        "name": "nuevo",
        "email": "nuevo@gmail.com",
        "password": "nuevo@gmail.com"
    }
}

{
    "user": {
        "email": "nuevo@gmail.com",
        "password": "nuevo@gmail.com"
    }
}
```
