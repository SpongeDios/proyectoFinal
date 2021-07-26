<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Inicio</title>
    <link rel="stylesheet" href="/css/editPackage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body class="container">
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
            <li> <a href="/arica">Región de Arica y Parinacota</a> </li>
            <li> <a href="/tarapaca">Región de Tarapacá</a> </li>
            <li> <a href="/antofagasta">Región de Antofagasta</a> </li>
            <li> <a href="/atacama">Región de Atacama</a> </li>
            <li> <a href="/coquimbo">Región de Coquimbo</a> </li>
            <li> <a href="/valparaiso">Región de Valparaíso</a> </li>
            <li> <a href="/metropolitana">Región Metropolitana de Santiago</a> </li>
            <li> <a href="/ohiggins">Región O'Higgins</a> </li>
            <li> <a href="/maule">Región del Maule</a> </li>
            <li> <a href="/nuble">Región del Ñuble</a> </li>
            <li> <a href="/biobio">Región del Biobío</a> </li>
            <li> <a href="/araucania">Región de La Araucanía</a> </li>
            <li> <a href="/rios">Región de Los Ríos</a> </li>
            <li> <a href="/lagos">Región de Los Lagos</a> </li>
            <li> <a href="/aysen">Región de Aysén</a> </li>
            <li> <a href="/magallanes">Región de Magallanes</a> </li>
        </ul>
        <ul class="col">
            <c:forEach items="${comunas}" var="comuna">
                <c:out value="${comuna}"></c:out>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
