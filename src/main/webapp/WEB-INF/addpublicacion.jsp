<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link rel="stylesheet" href="/css/addPublicacion.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Añadir Publicación</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <header>
        <nav class="navbar p-2">
            <a class="link-light" href="/perfil/${user.id}"><img src="${user.photo}" width="50px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a>
            <c:if test="${user.rol == 3 }">
                <a class="link-light" href="/admin">Administrar</a>
            </c:if>
            <a class="link-light" href="/">Inicio</a>
            <a class="link-light" href="javascript: history.go(-1)">Volver atrás</a>
            <a class="link-light" href="/logout">Cerrar Sesión</a>
        </nav>
    </header>
    <div class="row mt-5">
    <h1>Añadir Publicación</h1>
        <div class="col">
            <span style="color: red;"><form:errors path="publication.*"/></span>
            <form:form method="POST" action="" cssClass="form col border border-1 rounded p-4" enctype="multipart/form-data" modelAttribute="publication" >
                <p class="form-group col">
                    <form:label path="title">Título: </form:label>
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
                    <form:label path="type_publication">Tipo de publicación:</form:label>
                    <form:select cssClass="form-control" path="type_publication">
                        <form:option value="1">Quiero contratar a una persona</form:option>
                        <form:option value="2">Quiero trabajar</form:option>
                    </form:select>
                </p>
                <p class="col">
                    <form:label path="category">Categoría:</form:label>
                    <form:select path="category">
                        <c:forEach items="${categories}" var="category">
                            <form:option value="${category.id}"><c:out value="${category.name}"/></form:option>
                        </c:forEach>
                    </form:select>
                </p>
                <p class="col">
                <div class="mb-3">
                    <label for="formFile" class="form-label">Subir una Foto</label>
                <input class="form-control" type="file" id="formFile" accept="image/png, image/jpeg" name="file">
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <input class="btn btn-light me-md-2" type="submit" value="Publicar!"/>
                </div>
                </p>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>