<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Publicaciones</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <header>
        <nav class="navbar navbar-dark bg-dark p-2">
            <a class="link-light" href="/perfil/${user.id}"><img src="${user.photo}" width="50px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a>
            <a class="link-light" href="/">Inicio</a>
            <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
            <a class="link-light" href="javascript: history.go(-1)"> ◄ Volver atrás</a>
            <a class="link-light" href="/logout">Cerrar Sesión</a>
    </nav>
    </header>
    <br>
    <div class="row">
        <table class="table table-dark table-striped">
            <thead class="thead">
            <tr>
                <th scope="col">Título</th>
                <th scope="col">Foto referencial</th>
                <th scope="col">Precio</th>
                <th scope="col">Categoría</th>
                <th scope="col">Tipo de publicación</th>
                <th scope="col">Acción | Estado</th>
            </tr>
            </thead>
            <tbody>
            <span style="color: red;"><form:errors path="publicacion.*"/></span>
                <c:forEach var="publicacion" items="${publicationList}">
                    <tr>
                        <th scope="row"><a class="link-light" href="/publicaciones/${publicacion.id}"><c:out value="${publicacion.title}"/></a></th>
                        <td>
                            <a target="_blank" href="${publicacion.photo_publication}">
                                <img src="${publicacion.photo_publication}" height="80px" width="120px">
                            </a>
                        </td>
                        <td>$<c:out value="${publicacion.price}"/></td>
                        <td><c:out value="${publicacion.category.name}"/></td>
                        <td>
                            <c:if test="${publicacion.type_publication == 1}">Contratar una persona</c:if>
                            <c:if test="${publicacion.type_publication == 2}">Buscar trabajo</c:if>
                        </td>
                        <td>
                            <a class="btn btn-warning" href="/publicaciones/${publicacion.id}/edit">Editar</a>
                            <a href="/publicaciones/${publicacion.id}/delete" class="btn btn-danger boton">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

