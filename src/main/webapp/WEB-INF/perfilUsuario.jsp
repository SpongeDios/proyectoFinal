<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="shortcut icon" href="archivos/logos/iconodepana.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></title>
</head>
<body>
<script src="/static/js/backbutton.js"></script>
    <div class="container">
        <header>
            <nav class="navbar navbar-dark bg-dark p-2">
                <a class="link-light" href="/">Inicio</a>
                <a class="link-light" href="/publicaciones">Mis Publicaciones</a>
                <a class="link-light" href="/perfil/${user.id}/editar">Editar Perfil</a>
                <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
                <a class="link-light" href="javascript: history.go(-1)">Volver atrás</a>
                <a class="link-light" href="/logout">Cerrar Sesión</a>
            </nav>
        </header>
        <br>
        <h3>
            <img src="${user.photo}" width="50px" height="50px">
            <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
        </h3>
    </div>
</body>
</html>
