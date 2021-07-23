<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="select" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<header>
    <a class="btn btn-link" href="/">Inicio</a>
    <a class="btn btn-link" href="/publicaciones">Volver atrás</a>
    <a class="btn btn-link" href="/logout">Cerrar Sesión</a>
</header>
<div class="container">

    <div class="col">
        <form:errors path="publication.*"/>
        <form:form method="POST" action="" cssClass="form col border border-1 rounded" modelAttribute="publication">
            <input type="hidden" name="_method" value="PUT">
            <p class="form-group col">
            <form:label path="title">Título: </form:label>
            <form:input cssClass="form-control" path="title"/>
            </p>
            <p class="col">
            <form:label path="description">Descripción:</form:label>
            <form:textarea cssClass="form-control" path="description"/>
            </p>
            <p class="col">
            <form:label path="price">Precio estimado:</form:label>
            <form:input type="number" cssClass="form-control" path="price"/>
            </p>
            <p class="col">
                <form:label path="type_publication">Tipo de publicación:</form:label>
                <form:select cssClass="form-control" path="type_publication">
                    <form:option value="1">Quiero contratar a una perosna</form:option>
                    <form:option value="2">Quiero trabajar</form:option>
                </form:select>
            </p>
            <input class="btn btn-warning" type="submit" value="Publicar!"/>
        </form:form>
    </div>
</div>
</body>
</html>

