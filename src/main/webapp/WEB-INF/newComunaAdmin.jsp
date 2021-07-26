<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Agregar Comunas</title>
</head>
<body>
<div class="container">
    <header class="d-flex justify-content-between">
        <h1>Agregar Comunas</h1>
        <a class="btn btn-link" href="/admin">Volver atrás</a>
    </header>
    <form:errors path="comuna.*"/>
    <form:form method="POST" action="" cssClass="form col border border-1 rounded" modelAttribute="comuna" >
        <p class="form-group col">
            <form:label path="nameComuna">Nombre: </form:label>
            <form:input cssClass="form-control" path="nameComuna"/>
        </p>
        <p class="col">
            <form:label path="region">Region:</form:label>
            <form:select cssClass="form-control" path="region">
                <c:forEach items="${regiones}" var="region">
                    <form:option value="${region.id}"><c:out value="${region.nameRegion}"/></form:option>
                </c:forEach>
            </form:select>
        </p>
        <input class="btn btn-warning" type="submit" value="Crear Comuna"/>
    </form:form>
</div>
</body>
</html>
