<%--
  Created by IntelliJ IDEA.
  User: Zhyng
  Date: 29/07/2021
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/css/estadoCuenta.css">
    <title>Estado Cuenta</title>
</head>
<body>
    <div>
        <h1>
            <c:if test="${user.available == false && user.id != userLog.id}">¿Estás seguro de que quieres desbanear a este usuario?</c:if>
            <c:if test="${user.available == true && user.id != userLog.id}">¿Estás seguro de que quieres banear a este usuario?</c:if>
            <c:if test="${user.available == true && user.id == userLog.id}">¿Estás seguro de que quieres deshabilitar tu cuenta? (No podrás volver a habilitarla)</c:if>
        </h1>
        <img src="${user.photo}" width="200px">
        <h2>Nombre usuario: <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></h2>
        <h2>Rol: <c:out value="${user.rol}"/></h2>
        <h2>Email: <c:out value="${user.email}"/></h2>
        <h2>Número telefónico: <c:out value="${user.phone}"/></h2>
        <h2>Número de publicaciones: <c:out value="${user.publications.size()}"/></h2>
        <h2>Dirección: <c:out value="${user.address.nameCalle}"/></h2>
        <h2>Comuna: <c:out value="${user.address.comuna.nameComuna}"/></h2>
        <h2>Región: <c:out value="${user.address.comuna.region.nameRegion}"/></h2>
        <c:if test="${user.available == false}">
            <a class="btn btn-link" href="/${user.id}/estadoCuenta">Desbanear</a>
        </c:if>
        <c:if test="${user.available == true}">
            <a class="btn btn-link" href="/${user.id}/estadoCuenta">Banear</a>
        </c:if>
    </div>
</body>
</html>
