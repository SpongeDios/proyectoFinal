<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link rel="stylesheet" href="/css/respuesta.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Responder</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<script src="/static/js/backbutton.js"></script>
    <div class="container">
        <header>
            <nav class="navbar p-2">
                <a class="link-light" href="/perfil/${user.id}"><img src="${user.photo}" width="50px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a>
                <c:if test="${user.rol == 3 }">
                    <a class="link-light" href="/admin">Administrar</a>
                </c:if>
                <a class="link-light" href="/">Inicio</a>
                <a class="link-light" href="/publicaciones">Publicaciones</a>
                <a class="link-light" href="javascript: history.go(-1)"> ◄ Volver atrás</a>
                <a class="link-light" href="/logout">Cerrar Sesión</a>
            </nav>
        </header>
        <h1>¿Qué deseas responder a este mensaje?</h1>
        <h2>-> <c:out value="${message.text}"/></h2>
        <span style="color: red;"><form:errors path="respuesta.*"/></span>
        <form:form method="post" action="/publicaciones/${message.publication.id}/${message.id}/responder" modelAttribute="respuesta">
            <form:input type="hidden" path="rol" value="2"/>
            <div class="col-2">
                <form:label for="message" class="visually-hidden" path="text">Responder</form:label>
                <form:input type="text" class="form-control" id="message" path="text"/>
                <button type="submit" class="btn btn-primary mb-3">Enviar</button>
            </div>
        </form:form>
    </div>
</body>
</html>

