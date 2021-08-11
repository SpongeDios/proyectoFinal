<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link rel="stylesheet" href="/css/editUser.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Editar Foto Perfil</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
    <header class="navbar p-2">
        <nav class="container">
            <a class="link-light" href="/">Inicio</a>
            <c:if test="${user.rol == 3 }">
                <a class="link-light" href="/admin">Administrar</a>
            </c:if>
            <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
            <a class="link-light" href="/perfil/${user.id}/estadoCuenta">Deshabilitar Cuenta</a>
            <a style="text-decoration: none" class="link-light" href="javascript: history.go(-1)"><i class="bi bi-arrow-left-circle"></i> Volver atrás</a>
            <c:if test="${user.id != null }">
                <a style="text-decoration: none" class="link-light" href="/logout">Cerrar Sesión</a>
            </c:if>
        </nav>
    </header>
    <div class="container">
        <div class="col mt-5 text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            <h3 class="fs-2">
                <img src="/${user.photo}" width="50px" height="50px">
                <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
            </h3>
        </div>
        <c:out value="${error}"/>
        <form action="" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <input class="form-control" type="file" id="formFile" accept="image/png, image/jpeg" name="file">
            </div>
            <input type="submit" value="Subir Img!">
        </form>
    </div>
</body>
</html>
