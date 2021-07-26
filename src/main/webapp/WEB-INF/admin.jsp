<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="shortcut icon" href="/static/archivos/thebuilder.png" type="image/x'icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Panel del Administrador</title>
</head>
<body>
<div class="container">
    <header>
        <ul class="list-group">
            <li class="list-group-item"><a class="btn btn-link" href="/">Inicio</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/admin/allpublications">Todas las publicaciones</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/admin/allusers">Todos los Usuarios</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/admin/comunas/new">Crear Comunas</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/admin/regiones/new">Crear Región</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/admin/categories/new">Crear Categoría</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/admin/comunas">Lista Comunas</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/admin/regiones">Lista Regiones</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/admin/categories">Lista Categorías</a></li>
            <li class="list-group-item"><a class="btn btn-link" href="/logout">Cerrar Sesión</a></li>
        </ul>
    </header>
</div>
</body>
</html>
