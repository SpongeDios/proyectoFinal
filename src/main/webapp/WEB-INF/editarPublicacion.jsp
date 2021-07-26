<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Editar Publicación</title>
</head>
<body>
<div class="container">
    <header>
        <nav class="navbar navbar-dark bg-dark p-2">
            <a class="link-light" href="/perfil/${user.id}"> <img src="${user.photo}" width="50px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a>
            <a class="link-light" href="/">Inicio</a>
            <a class="link-light" href="/publicaciones/${user.publication.id}">Volver atrás</a>
            <a class="link-light" href="/logout">Cerrar Sesión</a>
        </nav>
    </header>
    <div class="col">
        <form:errors path="publication.*"/>
        <form:form method="POST" action="" cssClass="form col border border-1 rounded" modelAttribute="publication">
            <input type="hidden" name="_method" value="PUT">
            <p class="form-group col">
            <form:label path="title">Título: </form:label>
            <form:input value="${p.title}" cssClass="form-control" path="title"/>
            </p>
            <p class="col">
            <form:label path="description">Descripción:</form:label>
            <form:input value="${p.description}" cssClass="form-control" path="description"/>
            </p>
            <p class="col">
            <form:label path="price">Precio estimado:</form:label>
            <form:input type="number" value="${p.price}" cssClass="form-control" path="price"/>
            </p>
            <p class="col">
                <form:label path="type_publication">Tipo de publicación:</form:label>
                <form:select cssClass="form-control" path="type_publication">
                    <form:option value="1">Quiero contratar a una persona</form:option>
                    <form:option value="2">Quiero trabajar</form:option>
                </form:select>
            </p>
            <input class="btn btn-warning" type="submit" value="Publicar!"/>
        </form:form>
    </div>
</div>
</body>
</html>

