<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Comunas</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <header class="d-flex justify-content-between">
        <h1>Administrar Comunas</h1>
        <a class="btn btn-link" href="/admin">Volver atrás</a>
    </header>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Acciones</th>
        </tr>
        </thead>
        <tbody>
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
