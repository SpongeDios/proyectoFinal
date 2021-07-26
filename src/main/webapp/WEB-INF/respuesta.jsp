<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Responder</title>
</head>
<body>
    <div class="container">
        <header>
            <a class="btn btn-link" href="/">Inicio</a>
            <a class="btn btn-link" href="/publicaciones/">Publicaciones</a>
            <a class="btn btn-link" href="/logout">Cerrar Sesión</a>
        </header>
        <h1>¿Qué desear responder a este mensaje?</h1>
        <h2>-> <c:out value="${message.text}"/></h2>
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

