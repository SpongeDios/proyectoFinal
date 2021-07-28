<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Admin Categorias</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <header class="d-flex justify-content-between">
        <h1>Administrar Categorías</h1>
        <a class="btn btn-link" href="/admin">Inicio Administrador</a>
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
