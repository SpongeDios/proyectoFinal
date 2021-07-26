<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Publicacion</title>
</head>
<body>
<header>
    <a class="btn btn-link" href="/">Inicio</a>
    <a class="btn btn-link" href="/publicaciones">Volver atrás</a>
    <a class="btn btn-link" href="/logout">Cerrar Sesión</a>
</header>
<div class="container">
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
    <form:form action="/publicaciones/${publication.id}" method="post" modelAttribute="message">
        <form:input type="hidden" path="rol" value="1"/>
        <form:label path="text"></form:label>
        <form:input path="text"/>
        <input type="submit">
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
                                    <c:out value="${messages.respuesta.text}"/>
                                </c:if>
                                <c:if test="${user.id == publication.user.id}">
                                    <p><c:out value="${messages.text}"/></p>
                                    <p><c:out value="${messages.respuesta.text}"/></p>
                                    <a href="/publicaciones/${messages.publication.id}/${messages.id}">responder</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
</div>
</body>
</html>