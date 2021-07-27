<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Comunas</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<script src="/static/js/backbutton.js"></script>
<div class="container">
    <header class="d-flex justify-content-between">
        <h1>Administrar Comunas</h1>
        <a class="btn btn-link" href="javascript: history.go(-1)">Volver atrás</a>
    </header>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <span style="color: red;"><form:errors path="d.*"/></span><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <c:forEach var="d" items="${data}">
            <tr>
                <td><c:out value="${d.nameComuna}"/></td>
                <td>
                    <a class="btn btn-link" href="/admin/comunas/${d.id}/edit">Editar</a> |
                    <a  class="btn btn-link" href="/admin/comunas/${d.id}/delete">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
