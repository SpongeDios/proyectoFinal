<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="/css/allPublicaciones.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<header>
    <a class="btn btn-link" href="/">Inicio</a>
    <a class="btn btn-link" href="/publicaciones/add">Crear Publicación</a>
    <a class="btn btn-link" href="/logout">Cerrar Sesión</a>
</header>
<div class="container">
    <h3>
        <img src="${user.photo}" width="50px" height="50px">
        <a href="/perfil/${user.id}"><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a>
    </h3>
    <div class="navbar">
        <form class="form-inline" action="">
            <input type="text" class="form-control" placeholder="Buscar" name="busqueda">
            <input type="submit" class="btn btn-outline-primary" value="Buscar">
        </form>
    </div>

    <div class="row">
        <table class="table">
            <thead class="thead-dark">
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
                <c:forEach var="publicacion" items="${user.publications}">
                    <tr>
                        <th scope="row"><a href="/publicaciones/${publicacion.id}"><c:out value="${publicacion.title}"/></a></th>
                        <td><a target="_blank" href="${publicacion.photo_publication}"><img src="${publicacion.photo_publication}" height="80px" width="100px"></a></td>
                        <td>$<c:out value="${publicacion.price}"/></td>
                        <td><c:out value="${publicacion.category.name}"/></td>
                        <td>
                            <c:if test="${publicacion.type_publication == 1}">Contratar una persona</c:if>
                            <c:if test="${publicacion.type_publication == 2}">Buscar trabajo</c:if>
                        </td>
                        <td><a class="btn btn-link" href="/publicaciones/${publicacion.id}/edit">Editar</a>
                            <form action="/publicaciones/${publicacion.id}/delete" method="post">
                            <input type="hidden" name="_method" value="delete">
                            <input class="btn btn-link boton" type="submit" value="Eliminar"></form> |

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

