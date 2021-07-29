<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link rel="stylesheet" href="/css/registration.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Registrarse</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <header>
        <nav class="navbar p-2">
            <a class="link-light" href="javascript: history.go(-1)">Volver atrás</a>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="col border border-secondary border-1 p-5 mr-3">
            <p><form:errors path="user.*"/></p>
            <h1>Registrando al socio</h1>
            <form:form method="POST" action="" cssClass="form" enctype="multipart/form-data" modelAttribute="user">

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
                    <form:input cssClass="form-control" path="address.nameCalle" placeholder="Ejemplo: nombre calle 123"/>
                </p>

                <p class="form-group">
                    <form:label path="phone">Celular: </form:label>
                    <form:input cssClass="form-control" path="phone"/>
                </p>
                <c:if test="${userList.size() != 0}">
                    <p class="form-group">
                        <form:label path="rol">Rol: </form:label>
                        <form:select cssClass="form-control" path="rol">
                            <option disabled selected value="">Selecciona una</option>
                            <form:option value="1">Prestar Servicios</form:option>
                            <form:option value="2">Contratar Servicios</form:option>
                        </form:select>
                    </p>
                </c:if>
                <c:if test="${userList.size() == 0}">
                    <p class="form-group">
                        <form:label path="rol">Rol: </form:label>
                        <form:select cssClass="form-control" path="rol">
                            <option disabled selected value="">Selecciona una</option>
                            <form:option value="1">Prestar Servicios</form:option>
                            <form:option value="2">Contratar Servicios</form:option>
                            <form:option value="3">Administrador</form:option>
                        </form:select>
                    </p>
                </c:if>
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
                <div class="mb-3">
                    <label for="formFile" class="form-label">Subir una Foto</label>
                    <input class="form-control" type="file" id="formFile" accept="image/png, image/jpeg" name="file">
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <input class="btn btn-light me-md-2" type="submit" value="Registrar!"/>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>


