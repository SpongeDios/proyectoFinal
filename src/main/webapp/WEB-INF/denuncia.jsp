<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link rel="stylesheet" href="/css/allPublicaciones.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="/js/backbutton.js"></script>
    <title>Denunciar Comentario</title>
</head>
<body>
<header class="navbar p-2">
    <nav class="container">
        <c:if test="${user.photo == null}">
            <a style="text-decoration: none" class="link-light" href="/perfil/${user.id}"><img src="/archivos/default/default.png" width="100px" height="50px"> <c:out value="${user.firstName} ${user.lastName}" /> </a>
        </c:if>
        <c:if test="${user.photo != null}">
            <a style="text-decoration: none" class="link-light" href="/perfil/${user.id}"><img src="${user.photo}" width="100px" height="50px"> <c:out value="${user.firstName} ${user.lastName}"/> </a>
        </c:if>
        <c:if test="${user.rol == 3 }">
            <a style="text-decoration: none" class="link-light" href="/admin">Administrar</a>
        </c:if>
        <a style="text-decoration: none" class="link-light" href="/">Inicio</a>
        <a style="text-decoration: none" class="link-light" href="/publicaciones/add">Crear Publicación</a>
        <a style="text-decoration: none" class="link-light" href="javascript: history.go(-1)"><i class="bi bi-arrow-left-circle"></i> Volver atrás</a>
        <c:if test="${user.id != null }">
            <a style="text-decoration: none" class="link-light" href="/logout">Cerrar Sesión</a>
        </c:if>
    </nav>
</header>
    <div class="col mb-5 mt-5 text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        <h3 class="fs-2">
            <h2 style="color: white">¿Por qué quiere denunciar este comentario?</h2>
        </h3>
    </div>
        <div class="container">
            <div class="row mt-5 mb-5">
                <div class="col-2"></div>
                <div class="col-8">
                    <form:form action="" modelAttribute="denuncia" method="post">
                        <p>
                            <form:label path="detalles">Elige una opción</form:label>
                            <form:select path="tipoDenuncia">
                                <form:option value="1">Contenido Ofensivo</form:option>
                                <form:option value="2">Información personal</form:option>
                            </form:select>
                        </p>
                        <p>
                            <form:label path="detalles">Detalles de la denuncia</form:label>
                            <form:input type="text" path="detalles"/>
                        </p>
                        <input class="btn tbn-danger" type="submit" value="Enviar">
                    </form:form>
                </div>
                <div class="col-2"></div>
            </div>
        </div>
</body>
</html>