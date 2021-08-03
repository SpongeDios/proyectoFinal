<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link rel="stylesheet" href="/css/perfilUsuario.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
    <div class="container">
        <header>
            <nav class="navbar p-2">
                <c:if test="${user.rol == 3 }">
                    <a class="link-light" href="/admin">Administrar</a>
                </c:if>
                <a class="link-light" href="/">Inicio</a>
                <a class="link-light" href="/publicaciones">Mis Publicaciones</a>
                <a class="link-light" href="/perfil/${user.id}/editar">Editar Perfil</a>
                <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
                <a class="link-light" href="javascript: history.go(-1)"> ◄ Volver atrás</a>
                <c:if test="${user.id != null }">
                    <a style="text-decoration: none" class="link-light" href="/logout">Cerrar Sesión</a>
                </c:if>
            </nav>
        </header>
        <br>
        <h3>
            <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
        </h3>
        <img src="${user.photo}" width="200px" height="200px" class="img-thumbnail">
        <div class="row ">
            <div class="col-6">
                <ul class="list-group">
                    <li class="list-group-item"> Celular: <img src="/archivos/logos/wi.png" width="20px"><c:out value="${user.phone}"/> </li>
                    <li class="list-group-item">Email: <c:out value="${user.email}"/></li>
                    <li class="list-group-item">Direccion: <c:out value="${user.address.nameCalle}"/></li>
                    <li class="list-group-item">Número de publicaciones: <c:out value="${user.publications.size()}"/></li>
                    <li class="list-group-item">Comuna: <c:out value="${user.address.comuna.nameComuna}"/></li>
                    <li class="list-group-item">Región: <c:out value="${user.address.comuna.region.nameRegion}"/></li>
                    <li class="list-group-item">Estado:
                        <c:if test="${user.available == true}">Activo</c:if>
                        <c:if test="${user.available == false}">Baneado</c:if>
                    </li>
                    <li class="list-group-item">Rol Usuario:
                        <c:if test="${user.rol == 1}">Prestador de Servicios</c:if>
                        <c:if test="${user.rol == 2}">Solicitador de Servicios</c:if>
                        <c:if test="${user.rol == 3}">Administrador</c:if>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
