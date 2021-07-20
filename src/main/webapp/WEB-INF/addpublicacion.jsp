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
        <div class="col">
            <form:errors path="publication.*"/>
            <form:form method="POST" action="" cssClass="form col border border-1 rounded" modelAttribute="publication" >
                <p class="form-group col">
                    <form:label path="title">Titulo: </form:label>
                    <form:input cssClass="form-control" path="title"/>
                </p>
                <p class="col">
                    <form:label path="description">Descripcion:</form:label>
                    <form:textarea cssClass="form-control" path="description"/>
                </p>
                <p class="col">
                    <form:label path="price">Precio estimado:</form:label>
                    <form:input cssClass="form-control" type="email" path="price"/>
                </p>
                <p class="col">
                    <form:label path="category">Categoria:</form:label>
                    <form:input cssClass="form-control" type="email" path="category"/>
                </p>

                <input class="btn btn-warning" type="submit" value="Register!"/>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>

