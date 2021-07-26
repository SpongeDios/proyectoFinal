<%--
  Created by IntelliJ IDEA.
  User: Zhyng
  Date: 26/07/2021
  Time: 2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <c:out value="${message.text}"/>
        <form:form method="post" action="/publicaciones/${message.publication.id}/${message.id}/responder" modelAttribute="respuesta">
            <form:input type="hidden" path="rol" value="2"/>
            <form:label path="text">Responder</form:label>
            <form:input path="text"/>
            <input type="submit">
        </form:form>
    </div>
</body>
</html>
