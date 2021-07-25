<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></title>
</head>
<body>
    <div>
        <header>
            <a class="btn btn-link" href="/">Inicio</a>
            <a class="btn btn-link" href="/">Volver atrás</a>
            <a class="btn btn-link" href="/publicaciones/add">Crear Publicación</a>
            <a class="btn btn-link" href="/logout">Cerrar Sesión</a>
        </header>
        <h3>
            <img src="${user.photo}" width="50px" height="50px">
            <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
        </h3>
        <p>
            <a href="/publicaciones">Mis Publicaciones</a>
        </p>
        <p>
            <a href="/perfil/${user.id}/editar">Editar Perfil</a>
        </p>
    </div>
</body>
</html>
