<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/css/estadoCuenta.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Estado Cuenta</title>
</head>
<body>
    <div class="container">
        <header class="d-flex justify-content-between">
            <h1>Administrar Usuarios</h1>
            <a class="btn btn-link" href="/admin">Inicio Administrador</a>
            <a class="btn btn-link" href="javascript: history.go(-1)"> ◄ Volver atrás</a>
        </header>
        <h1>
            <c:if test="${user.available == false && user.id != userLog.id}">¿Estás seguro de que quieres desbanear a este usuario?</c:if>
            <c:if test="${user.available == true && user.id != userLog.id}">¿Estás seguro de que quieres banear a este usuario?</c:if>
            <c:if test="${user.available == true && user.id == userLog.id}">¿Estás seguro de que quieres deshabilitar tu cuenta? (No podrás volver a habilitarla)</c:if>
        </h1>
        <ul class="list-group">
            <img src="${user.photo}" width="200px">
            <li class="list-group-item">Nombre Usuario: <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></li>
            <li class="list-group-item">Rol: <c:out value="${user.rol}"/></li>
            <li class="list-group-item">Email: <c:out value="${user.email}"/></li>
            <li class="list-group-item">Número telefónico: <c:out value="${user.phone}"/></li>
            <li class="list-group-item">Número de publicaciones: <c:out value="${user.publications.size()}"/></li>
            <li class="list-group-item">Dirección: <c:out value="${user.address.nameCalle}"/></li>
            <li class="list-group-item">Comuna: <c:out value="${user.address.comuna.nameComuna}"/></li>
            <li class="list-group-item">Región: <c:out value="${user.address.comuna.region.nameRegion}"/></li>
            <li class="list-group-item">
                <c:if test="${user.available == false}">
                <a class="btn btn-link" href="/${user.id}/estadoCuenta">Desbanear</a>
                </c:if>
                <c:if test="${user.available == true}">
                    <a class="btn btn-link" href="/${user.id}/estadoCuenta">Banear</a>
                </c:if>
            </li>
        </ul>
    </div>
</body>
</html>
