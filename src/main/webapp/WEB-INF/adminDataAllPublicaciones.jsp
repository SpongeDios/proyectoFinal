<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Admin Publicaciones</title>
</head>
<body>
<script src="/static/js/backbutton.js"></script>
<div class="container">
    <header class="d-flex justify-content-between">
        <h1>Administrar Publicaciones</h1>
        <a class="link-light" href="javascript: history.go(-1)">Volver atrás</a>
    </header>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Título</th>
            <th scope="col">Nombre Publicador</th>
            <th scope="col">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="d" items="${data}">
            <tr>
                <td><c:out value="${d.title}"/></td>
                <td><c:out value="${d.user.firstName} ${d.user.lastName}"/></td>
                <td><a class="btn btn-link" href="/publicaciones/${publicaion.id}">Ver Publicación</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>
