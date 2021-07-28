<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Inicio</title>
    <link rel="shortcut icon" href="archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
    <body>
    <div class="container">
    <header>
        <nav class="navbar navbar-dark bg-dark p-2">
            <c:if test="${user.id == null}">
                <a class="link-light" class="btn btn-link" href="/login">Iniciar Sesión</a>
                <a class="link-light" href="/registration">Registrarse</a>
            </c:if>
            <c:if test="${user.id != null}">
            <a class="link-light" href="/perfil/${user.id}"><img src="${user.photo}" width="50px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a>
            <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
            <a class="link-light" href="/publicaciones">Publicaciones</a>
            <a class="link-light" href="/logout">Cerrar Sesión</a>
            </c:if>
        </nav>
    </header>
        <div class="row">
            <ul class="col">
                <c:forEach var="region" items="${regiones}">
                    <li><a class="link-light" href="/buscador/${region.nameRegion}"><c:out value="${region.nameRegion}"/></a></li>
                </c:forEach>
            </ul>
            <ul class="col">
            </ul>
        </div>

        <div class="">
            <div class="d-flex justify-content-center row">
                    <c:forEach var="categoria" items="${categorias}">
                        <div class="card col-4 m-1" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${categoria.name}"/></h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="/buscador/categoria/${categoria.id}" class="card-link">Card link</a>
                            </div>
                        </div>
                    </c:forEach>
            </div>
        </div>


        <div class="input-group xd">
            <input type="search" class="form-control rounded" placeholder="Buscar" aria-label="Search"
                   aria-describedby="search-addon" />
            <button type="button" class="btn btn-primary">Buscar</button>
        </div>
    </div>
</body>
</html>
