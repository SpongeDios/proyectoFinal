<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Editar Perfil</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <header>
        <nav class="navbar p-2">
            <a class="link-light" href="/">Inicio</a>
            <c:if test="${user.rol == 3 }">
                <a class="link-light" href="/admin">Administrar</a>
            </c:if>
            <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
            <a class="link-light" href="javascript: history.go(-1)">Volver atrás</a>
            <a class="link-light" href="/perfil/${user.id}/estadoCuenta">Deshabilitar cuenta</a>
            <a class="link-light" href="/logout">Cerrar Sesión</a>
        </nav>
    </header>
    <br>
    <h3>
        <img src="${user.photo}" width="50px" height="50px">
        <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
    </h3>
    <span style="color: red;"><form:errors path="user.*"/></span>
    <form:form method="POST" action="" cssClass="form col p-4 border border-1 rounded" enctype="multipart/form-data" modelAttribute="user">
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
            <form:label path="address.comuna.region">Región: </form:label>
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
        <p class="col">
        <div class="mb-3">
            <label for="formFile" class="form-label">Subir una Foto</label>
            <input class="form-control" type="file" id="formFile" accept="image/png, image/jpeg" name="file">
        </div>
        <input class="btn btn-warning" type="submit" value="Editar!"/>
        </p>
    </form:form>
</div>
</body>
</html>