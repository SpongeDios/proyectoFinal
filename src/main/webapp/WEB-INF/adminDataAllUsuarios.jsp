<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Admin Usuarios</title>
</head>
<body>
<script src="/static/js/backbutton.js"></script>
<div class="container">
    <header class="d-flex justify-content-between">
        <h1>Administrar Usuarios</h1>
        <a class="btn btn-link" href="javascript: history.go(-1)">Volver atrás</a>
    </header>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Rol</th>
            <th scope="col">N de publicaciones</th>
            <th scope="col">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <span style="color: red;"><form:errors path="d.*"/></span>
        <c:forEach var="d" items="${data}">
            <tr>
                <td><c:out value="${d.firstName}"/> <c:out value="${d.lastName}"/></td>
                <td>
                    <c:if test="${d.rol == 1}">Prestador de Servicios</c:if>
                    <c:if test="${d.rol == 2}">Solicitador de Servicios</c:if>
                    <c:if test="${d.rol == 3}">Administrador</c:if>
                </td>
                <td><c:out value="${d.publications.size()}"/></td>
                <td>
                    <c:if test="${d.available == false}">Activo
                        <a class="btn btn-link" href="/admin/allusers/${d.id}/available">Banear</a>
                    </c:if>
                    <c:if test="${d.available == true}">Baneado
                        <a class="btn btn-link" href="/admin/allusers/${d.id}/available">Quitar Ban</a>
                    </c:if>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
