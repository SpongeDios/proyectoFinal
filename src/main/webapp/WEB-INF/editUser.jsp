<%--
  Created by IntelliJ IDEA.
  User: Hector
  Date: 25-07-2021
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<div class="container">
    <header>
        <a class="btn btn-link" href="/">Inicio</a>
        <a class="btn btn-link" href="/perfil/${user.id}">Volver atrás</a>
        <a class="btn btn-link" href="/logout">Cerrar Sesión</a>
    </header>
    <h3>
        <img src="${user.photo}" width="50px" height="50px">
        <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
    </h3>
    <form:form method="POST" action="" cssClass="form" enctype="multipart/form-data" modelAttribute="user">
        <input type="hidden" name="_method" value="PUT">
        <form:input type="hidden" path="email" value="${user.email}"/>
        <form:input type="hidden" path="password" value="${user.password}"/>
        <form:input type="hidden" path="passwordConfirmation" value="${user.passwordConfirmation}"/>

        <p class="form-group">
            <form:label path="firstName">Nombre: </form:label>
            <form:input cssClass="form-control" path="firstName"/>
        </p>

        <p class="form-group">
            <form:label path="lastName">Apellido: </form:label>
            <form:input cssClass="form-control" path="lastName"/>
        </p>
        <p class="form-group">
            <form:label path="address.comuna.region">Region: </form:label>
            <form:select cssClass="form-control" path="address.comuna.region">
                <c:forEach var="region" items="${regiones}">
                    <form:option value="${region.id}"><c:out value="${region.nameRegion}"/> </form:option>
                </c:forEach>
            </form:select>
        </p>
        <p class="form-group">
            <form:label path="address.comuna">Comuna: </form:label>
            <form:select cssClass="form-control" path="address.comuna">
                <c:forEach var="comuna" items="${comunas}">
                    <form:option value="${comuna.id}"> <c:out value="${comuna.nameComuna}"/> </form:option>
                </c:forEach>
            </form:select>
        </p>
        <p class="form-group">
            <form:label path="address.nameCalle">Calle: </form:label>
            <form:input cssClass="form-control" path="address.nameCalle"/>
        </p>

        <p class="form-group">
            <form:label path="phone">Celular: </form:label>
            <form:input cssClass="form-control" path="phone"/>
        </p>

        <p class="form-group">
            <form:label path="rol">Rol: </form:label>
            <form:select cssClass="form-control" path="rol">
                <option disabled selected value="">Selecciona una</option>
                <form:option value="1">Prestar Servicios</form:option>
                <form:option value="2">Contratar Servicios</form:option>
            </form:select>
        </p>
        <p>
            <label>Foto de perfil:</label>
            <input type="file" accept="image/png, image/jpeg" name="file">
        </p>
        <input class="btn btn-warning" type="submit" value="Editar!"/>
    </form:form>
</div>
</body>
</html>