<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Publicación</title>
</head>
<body>
<div class="container">
    <header>
        <nav class="navbar navbar-dark bg-dark p-2">
            <a class="link-light" href="/perfil/${user.id}"><img src="${user.photo}" width="50px" height="50px"> <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a>
            <a class="link-light" href="/">Inicio</a>
            <a class="link-light" href="/publicaciones/add">Crear Publicación</a>
            <a class="link-light" href="/publicaciones">Volver atrás</a>
            <a class="link-light" href="/logout">Cerrar Sesión</a>
        </nav>
    </header>
    <div class="row">
        <ul>
            <li>Autor: <c:out value="${publication.user.firstName} ${publication.user.lastName}"/> </li>
            <li>Título: <c:out value="${publication.title}"/> </li>
            <li>Descripción: <c:out value="${publication.description}"/> </li>
            <li>Precio: $<c:out value="${publication.price}"/> </li>
            <li>Categoría: <c:out value="${publication.category.name}"/> </li>
            <li>Celular: <c:out value="${publication.user.phone}"/> </li>
            <li>Anuncio creado el <fmt:formatDate value="${publication.createdAt}" pattern="dd 'de' MMMM 'de' yyyy"/></li>
        </ul>
    </div>
    <a target="_blank" href="${publication.photo_publication}"><img src="${publication.photo_publication}" height="200px" width="250px"></a>
    <h4>¿Quieres realizar una consulta?</h4>
    <form:errors path="message.*"/>
    <form:form action="/publicaciones/${publication.id}" method="post" modelAttribute="message">
        <form:input type="hidden" path="rol" value="1"/>
        <div class="col-2">
            <form:label for="message" class="visually-hidden" path="text"></form:label>
            <form:input type="text" class="form-control" id="message" path="text"/>
            <button type="submit" class="btn btn-primary mb-3">Enviar</button>
        </div>
    </form:form>
    <table>
        <thead>
        <tr>
            <th>ÚLTIMAS CONSULTAS</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${publication.messages}" var="messages">
            <c:if test="${messages.rol == 1}">
                <tr>
                    <th><c:out value="${messages.user.firstName}"/> <c:out value="${messages.user.lastName}"/> </th>
                </tr>
                <tr>
                    <td>
                        <c:if test="${user.id != publication.user.id}">
                            <c:out value="${messages.text}"/>
                            <p>
                                <c:out value="${messages.respuesta.text}"/>
                            </p>
                        </c:if>
                        <c:if test="${user.id == publication.user.id && messages.respuesta.id == null}">
                            <p><c:out value="${messages.text}"/></p>
                            <a href="/publicaciones/${messages.publication.id}/${messages.id}">responder</a>
                        </c:if>
                        <c:if test="${user.id == publication.user.id && messages.respuesta.id != null}">
                            <p><c:out value="${messages.text}"/></p>
                            <p>
                                <c:out value="${messages.respuesta.text}"/>
                            </p>
                        </c:if>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <c:if test="${user.id != publication.user.id}">
        <h3>Deje su Feedback</h3>
        <form:form method="POST" action="/publicaciones/${publication.id}/feedback" enctype="multipart/form-data" modelAttribute="feedback" >
            <p>
                <form:label path="rating">Puntuación</form:label>
                <form:input type="number" min="1" max="5" path="rating"/>
            </p>
            <p>
                <form:label path="comment">Comentario</form:label>
                <form:input path="comment"/>
            </p>
            <p class="col">
            <div class="mb-3">
                <label for="formFile" class="form-label">Subir una Foto</label>
                <input class="form-control" type="file" id="formFile" accept="image/png, image/jpeg" name="file">
            </div>
            <input class="btn btn-warning" type="submit" value="Publicar!"/>
            </p>
        </form:form>
        </c:if>
        <h2>Feedbacks</h2>
        <table>
            <tbody>
            <c:forEach items="${publication.feedback}" var="feedback">
                <tr>
                    <th><c:out value="${feedback.user.firstName}"/> <c:out value="${feedback.user.lastName}"/> </th>
                </tr>
                <tr>
                    <td>
                        <p><c:out value="${feedback.rating}"/>/5</p>
                        <p><c:out value="${feedback.comment}"/></p>
                        <img src="${feedback.photo_feedback}" width="200px" height="100px">
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</form>
</body>
</html>