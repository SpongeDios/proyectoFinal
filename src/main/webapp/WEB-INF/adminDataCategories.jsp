<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><span style="color: red;"><form:errors path="d.*"/></span>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Admin Categorias</title>
</head>
<body>
<div class="container">
    <header class="d-flex justify-content-between">
        <h1>Administrar Categorías</h1>
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
        <span style="color: red;"><form:errors path="d.*"/></span>
        <c:forEach var="d" items="${data}">
            <tr>
                <td><c:out value="${d.name}"/></td>
                <td>
                    <a class="btn btn-link" href="/admin/categories/${d.id}/edit">Editar</a> |
                    <a  class="btn btn-link" href="/admin/categories/${d.id}/delete">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
