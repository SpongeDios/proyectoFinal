<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Añadir Publicación</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <form:errors path="publication.*"/>
            <form:form method="POST" action="" cssClass="form col border border-1 rounded" enctype="multipart/form-data" modelAttribute="publication" >
                <p class="form-group col">
                    <form:label path="title">Titulo: </form:label>
                    <form:input cssClass="form-control" path="title"/>
                </p>
                <p class="col">
                    <form:label path="description">Descripción:</form:label>
                    <form:textarea cssClass="form-control" path="description"/>
                </p>
                <p class="col">
                    <form:label path="price">Precio estimado:</form:label>
                    <form:input cssClass="form-control" path="price"/>
                </p>
                <p class="col">
                    <form:label path="type_publication">Tipo de publicacion:</form:label>
                    <form:select cssClass="form-control" path="type_publication">
                        <form:option value="1">Quiero contratar a una perosna</form:option>
                        <form:option value="2">Quiero trabajar</form:option>
                    </form:select>
                </p>
<%--                <p class="col">--%>
<%--                    <form:label path="category">Categoria:</form:label>--%>
<%--                    <form:input cssClass="form-control" path="category"/>--%>
<%--                </p>--%>
                <input multiple type="file" accept="image/png, image/jpeg" name="file">
                <input class="btn btn-warning" type="submit" value="Publicar!"/>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>

