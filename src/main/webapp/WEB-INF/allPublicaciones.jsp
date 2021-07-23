<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<div class="container">
    <h1> Bienvenido <c:out value="${user.firstName}"/> </h1>
    <div class="row">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Título</th>
                <th scope="col">Precio</th>
                <th scope="col">Categoría</th>
                <th scope="col">Tipo de publicación</th>
                <th scope="col">Acción | Estado</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="publicacion" items="${user.publications}">
                    <tr>
                        <th scope="row"><a href="/publicaciones/${publicacion.id}"><c:out value="${publicacion.title}"/></a></th>
                        <td>$<c:out value="${publicacion.price}"/></td>
                        <td><c:out value="${publicacion.category.name}"/></td>
                        <td><c:out value="${publicacion.type_publication}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>

