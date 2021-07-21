<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Registrarse</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col border border-secondary border-1 p-5 mr-3">

            <p><form:errors path="user.*"/></p>
            <h1>Registrando al socio</h1>
            <form:form method="POST" action="" cssClass="form" modelAttribute="user">

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
                    <form:input cssClass="form-control" path="address.comuna.region.nameRegion"/>
                </p>

                <p class="form-group">
                    <form:label path="address.comuna">Comuna: </form:label>
                    <form:input cssClass="form-control" path="address.comuna.nameComuna"/>
                </p>

                <p class="form-group">
                    <form:label path="address.nameCalle">calle: </form:label>
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
                    <form:label path="email">Email:</form:label>
                    <form:input cssClass="form-control" type="email" path="email"/>
                </p>
                <p>
                    <form:label path="password">Contraseña:</form:label>
                    <form:password cssClass="form-control" path="password"/>
                </p>
                <p>
                    <form:label path="passwordConfirmation">Confirmar contraseña:</form:label>
                    <form:password cssClass="form-control" path="passwordConfirmation"/>
                </p>
                <input class="btn btn-warning" type="submit" value="Register!"/>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>

