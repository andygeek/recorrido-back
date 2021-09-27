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
```

### Inicializando el proyecto

Luego de descargar el repositorio debes instalar sus dependencias usando el siguiente comando.

```
bundle install
```
Para ejecutar el servidor utilizamos el comando.

```
rails server
```

Esto nos abrirá un puerto en el localhost para utilizar nuestro API.

### Ejecutando el cron

Para crear el cron debemos primero verificar que este se ejecuta en nuestra computadora. Para esto usamos `service cron status`, si el resultado es satisfactorio podemos usar el comando `whenever -w` y esto escribirá dentro de nuestro cron nuestra tarea a ejecutar que ya esta escrita en `/lib/tasks/recorrido_tasks.rake` permitiendo que dicha tarea se ejecute cada 5 minutos.

Si ocurriera algúnn error podemos verificarlos en el archivo `/log/cron_error_log`.

