<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/navbar.css">
    <title>Denunciar Comentario</title>
</head>
<body>
    <div>
        <header class="navbar p-2">
            <nav class="container">
                <c:if test="${user.photo == null}">
                    <img src="/archivos/default/default.png" width="100px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
                </c:if>
                <c:if test="${user.photo != null}">
                    <img src="${user.photo}" width="100px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
                </c:if>
                <c:if test="${user.rol == 3 }">
                    <a class="link-light" href="/admin">Administrar</a>
                </c:if>
                <a class="link-light" href="/">Inicio</a>
                <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
                <a class="link-light" href="javascript: history.go(-1)"> ◄ Volver atrás</a>
                <c:if test="${user.id != null }">
                    <a style="text-decoration: none" class="link-light" href="/logout">Cerrar Sesión</a>
                </c:if>
            </nav>
        </header>
        <h2>¿Por qué quiere denunciar este comentario?</h2>
        <form:form action="" modelAttribute="denuncia" method="post">
            <p>
                <form:select path="tipoDenuncia">
                    <form:option value="1">Contenido ofensivo</form:option>
                    <form:option value="2">Información personal</form:option>
                </form:select>
            </p>
            <p>
                <form:label path="detalles">Detalles de la denuncia</form:label>
                    <form:input type="text" path="detalles"/>
            </p>
            <input type="submit" value="Enviar">
        </form:form>
    </div>
</body>
</html>