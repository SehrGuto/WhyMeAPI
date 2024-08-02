# WhyMe - Descrube porque te pasa lo que te pasa

## Funcionalidades
- Comprender como funciona el Karma, que acciones de tu pasado tienen relación directa con lo que te está pasando ahora

## Features
- GET api/Users: Trae todos los usuarios registrado
- GET api/Users/{id}: Trae u usuario registrado especifico determinado por su id
- POST api/Users: Agrega nuevos usuarios.
- PUT api/Users/{id}: Actualiza un usuario existente a partir de su id.
- DELETE api/Users/{id}: Borra un usuario de la base de datos.
- GET api/Pasts: Trae todos las acciones del pasado precargadas
- GET api/Results: Trae todos los resultados relacionados a cada usuario, problema actual y accion pasada

## Tecnologias usadas
- .NET 8.0
- Entity Framework Core
- SQLite
- ASP .NET core

## Estructura de la Base de datos
[![Db-diagram.jpg](https://i.postimg.cc/D0Xcw1kZ/Db-diagram.jpg)](https://postimg.cc/9wc9xRf5)

- Si desea vizualizar la base de datos de forma grafica la encuentras en la raíz del proyecto > WhyMe.db
- Puedes abrir el archivo usando DB Browser
- En la carpeta Scripts dentro del proyecto encuentras los SQL querys para crear la base de datos (no es necesario), para agregar los valores (no es necesario) y realizar las consultas (select/union/join/etc).

## Requisitos
- .Net core 8.0
- Microsoft Visual Studio
- DB Browser

## Como instalar
1. Clona ese repositorio.
2. Abre el proyecto en Microsoft Visual Studio.
3. Y listo! hacer click en "'Run'"

## RoadMap
Pendiente por desarrollar el frontend en donde el usuario pueda de forma intuitiva ingresar datos y recibir la respuesta

