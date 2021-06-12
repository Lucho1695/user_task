# Programa que permita ver los grupos y tareas de un usuario

Ruby Version 2.7.1
Rails Version 6.1.3.2

Base de datos utilizada sqlite3.

Gemas implementadas
gem 'knock'
gem 'JWT'
gem 'bcrypt'


endpoints:
# Para crear un usuario se debe utilizar el metodo post /users
post '/users'       => 'users#create'
# el body debe contener
{
    "user": {
        "name": "Nombre",
        "email": "email@email.email",
        "password": "password"
    }
}
# Muestra todos los usuarios que existen en la base de datos
get '/users'        => 'users#index'

# Para obtener el JWT token se debe ejecutar la metod post /user_token
post 'user_token'   => 'user_token#create'
# El header debera incluir
key: Content-Type, value: application/json
# El body debera incluir el siguiente formato
{
    "auth":
    {
        "email": "email@email.email",
        "password": "password"
    }
}

# Para las siguientes consultas debe iniciar sesion para poder acceder.

# Muestra el usuario seleccionado con las respectivas relaciones de grupos y tareas
get '/users/:id'    => 'users#show'

# Para crear una tarea se debe utilizar el metodo post /task
post '/task'        => 'tasks#create'


post '/groups'      => 'groups#create'
