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
    <div class="row">
        <ul>
            <li>Autor: <c:out value="${publication.user.firstName} ${publication.user.lastName}"/> </li>
            <li>Titulo: <c:out value="${publication.title}"/> </li>
            <li>Descripcion: <c:out value="${publication.description}"/> </li>
            <li>Precio: <c:out value="${publication.price}"/> </li>
            <li>Categoria: <c:out value="${publication.category.name}"/> </li>
            <li>Anuncio creado en:<fmt:formatDate value="${publication.createdAt}" pattern="dd 'de' MMMM 'de' yyyy"/></li>
            <li>Foto<c:out value="${publication.photo_publication}"/></li>
        </ul>
    </div>
</div>
</body>
</html>

