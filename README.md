# Programa que permita ver los grupos y tareas de un usuario

Ruby Version 2.7.1
Rails Version 6.1.3.2

Base de datos utilizada sqlite3.

Gemas implementadas
gem 'knock'
gem 'JWT'
gem 'bcrypt'


Endpoints:
```ruby
    GET /users
    GET /users/:id
    POST /users
    POST /task
    POST /groups 
```
# Para crear un usuario se debe utilizar el metodo ```ruby post /users ```
```ruby
post '/users'
```
* el body debe contener
```ruby
{
    "user": {
        "name": "Nombre",
        "email": "email@email.email",
        "password": "password"
    }
}
```
# Muestra todos los usuarios que existen en la base de datos
```ruby
get '/users'
```
# Para obtener el JWT token se debe ejecutar la metod ```ruby post /user_token ```
```ruby
post '/user_token'
```
* El header debera incluir
```ruby
key: Content-Type, value: application/json
```
* El body debera incluir el siguiente formato
```ruby
{
    "auth":
    {
        "email": "email@email.email",
        "password": "password"
    }
}
```

# Para las siguientes consultas debe tener el token obtenido en el paso anterior.

* Show User with task and group
# Mostrar el usuario seleccionado con las respectivas relaciones de grupos y tareas
```ruby
get '/users/:id'
```
* Header
```ruby
Key: Authorization, value: Bearer JWT
```

* Create task
# Para crear una tarea se debe utilizar el metodo ```ruby post /task ```
```ruby
post '/task'
```
* Header
```ruby
Key: Authorization, value: Bearer JWT
```
* Body
```ruby
{
    "task": {
        "name": "name",
        "description": "Lorem Ipsum",
        "state": 1 o 2
    }
}
```
El estado del task esta definico como un enumerador sindo 1 = "Pendiente" y 2 = "Terminado"

* Create Group
# Para crear un grupo se debe utilizar el metodo ```ruby post /groups ```
```ruby
post '/groups'
```
* Header
```ruby
Key: Authorization, value: Bearer JWT
```
* Body
```ruby
{
    "group": {
        "name": "name",
        "user_ids": ids de usuarios ej= [1, 2],
        "task_ids": ids de las tareas ej= [1, 2]
    }
}
```
