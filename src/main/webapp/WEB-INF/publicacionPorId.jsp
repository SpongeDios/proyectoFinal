<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link href="/css/publicacionPorId.css" rel="stylesheet">
    <link rel="shortcut icon" href="/archivos/logos/iconoSuperMaestro.png" type="image/x'icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Publicación</title>
    <script src="/js/backbutton.js"></script>
</head>
<body>
<div class="container">
    <header>
        <nav class="navbar p-2">
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
            <a class="link-light" href="javascript: history.go(-1)">◄ Volver atrás</a>
            <a class="link-light" href="/logout">Cerrar Sesión</a>
        </nav>
    </header>
        <div class="row ">
            <div class="col">
                <ul class="list-group">
                    <li class="list-group-item">Nombre: <c:out value="${publication.user.firstName} ${publication.user.lastName}"/> </li>
                    <li class="list-group-item">Título: <c:out value="${publication.title}"/> </li>
                    <li class="list-group-item">Descripción: <c:out value="${publication.description}"/> </li>
                    <li class="list-group-item">Precio: $<c:out value="${publication.price}"/> </li>
                    <li class="list-group-item">Categoría: <c:out value="${publication.category.name}"/> </li>
                    <li class="list-group-item"> Celular: <img src="/archivos/logos/iconoWhatsapp.png" width="20px"> <c:out value="${publication.user.phone}"/> </li>
                    <li class="list-group-item">Rating usuario: <c:out value="${ratingF}"/>
                    </li>
                    <li class="list-group-item">Anuncio creado el <fmt:formatDate value="${publication.createdAt}" pattern="dd 'de' MMMM 'de' yyyy"/></li>
                </ul>
            </div>
            <div class="col mx-4 imagen">
                <a target="_blank" href="${publication.photo_publication}">

                    <c:if test="${publication.photo_publication == null}">
                        <img src="/archivos/default/default.png" height="320px" width="500px">
                    </c:if>
                    <c:if test="${publication.photo_publication != null}">
                        <img src="${publication.photo_publication}" height="320px" width="500px"/>
                    </c:if>
                </a>
            </div>
        </div>
        <div class="container-fluid mt-3">
            <c:if test="${user.id != publication.user.id && user != null}">
            <h4>¿Quieres realizar una consulta?</h4>
            <form:errors path="message.*"/>
            <form:form action="/publicaciones/${publication.id}" method="post" modelAttribute="message">
            <form:input type="hidden" path="rol" value="1"/>
            <div class="col-3">
                <form:label for="message" class="visually-hidden" path="text"></form:label>
                <form:input type="text" class="form-control" id="message" path="text"/>
                <button type="submit" class="btn btn-primary mb-3">Enviar</button>
                </form:form>
            </div>
            </c:if>
        </div>
    <table>
        <thead>
        <h2>Últimas consultas</h2>
        </thead>
        <tbody>
        <table class="table table-primary table-striped">
        <c:forEach items="${publication.messages}" var="messages">
            <c:if test="${messages.rol == 1}">
                <tr>
                    <th><c:out value="${messages.user.firstName}"/> <c:out value="${messages.user.lastName}"/> </th>
                </tr>
                <tr>
                    <td>
                        <c:if test="${user.id != publication.user.id}">
                            <p>

                                <span style="color: red;"> Pregunta: </span> <c:out value="${messages.text}"/>
                                <a href="/denuncia/${messages.id}">Denunciar</a>
                            </p>
                            <p>
                                <span style="color: white;"> Respuesta: </span> <c:out value="${messages.respuesta.text}"/>
                            </p>
                        </c:if>
                        <c:if test="${user.id == publication.user.id && messages.respuesta.id == null}">
                            <div class="d-flex justify-content-between">
                                <p>
                                    <c:out value="${messages.text}"/>
                                    <a href="/denuncia/${messages.id}">Denunciar</a>
                                </p>
                            <a class="btn btn-warning" href="/publicaciones/${messages.publication.id}/${messages.id}">responder</a>
                            </div>
                        </c:if>
                        <c:if test="${user.id == publication.user.id && messages.respuesta.id != null}">
                            <p>

                                <span style="color: red;"> Pregunta: </span><c:out value="${messages.text}"/>
                                <a href="/denuncia/${messages.id}">Denunciar</a>
                            </p>
                            <p>
                                <span style="color: white;"> Respuesta: </span> <c:out value="${messages.respuesta.text}"/>
                            </p>
                        </c:if>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <div class="feedback">
        <c:if test="${user.id != publication.user.id && user != null}">
        <h3>Dejar Feedback</h3>
        <form:form method="POST" action="/publicaciones/${publication.id}/feedback" enctype="multipart/form-data" modelAttribute="feedback" >
            <div class="rating">
                <input type="radio" name="rating" value="5" id="5">
                <label for="5">☆</label>
                <input type="radio" name="rating" value="4" id="4">
                <label for="4">☆</label>
                <input type="radio" name="rating" value="3" id="3">
                <label for="3">☆</label>
                <input type="radio" name="rating" value="2" id="2">
                <label for="2">☆</label>
                <input type="radio" name="rating" value="1" id="1">
                <label for="1">☆</label>
            </div>
            <p>
            <div class="form-floating">
                <form:textarea path="comment" class="form-control" id="floatingTextarea"></form:textarea>
                <form:label for="floatingTextarea" path="comment">Comentario</form:label>
            </div>
            </p>
            <p class="col">
            <div class="mb-3">
                <label for="formFile" class="form-label">Subir una Foto</label>
                <input class="form-control" type="file" id="formFile" accept="image/png, image/jpeg" name="file">
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <input class="btn btn-dark me-md-2" type="submit" value="Publicar!"/>
            </div>
            </p>
        </form:form>
        </c:if>
        <h2>Feedbacks</h2>
        <table class="table table-success table-striped">
            <tbody>
            <c:forEach items="${publication.feedback}" var="feedback">
                <tr>
                    <th><c:out value="${feedback.user.firstName}"/> <c:out value="${feedback.user.lastName}"/> </th>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex justify-content-between">
                            <p>
                                <span style="color: #152838;"> Puntuación: </span> <c:out value="${feedback.rating}"/>/5
                            </p>
                            <p>
                                <span style="color: #152838;"> Comentario: </span> <c:out value="${feedback.comment}"/>
                            </p>
                            <img src="${feedback.photo_feedback}" width="200px" height="100px">
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    </table>
</div>
</form>
</body>
</html>