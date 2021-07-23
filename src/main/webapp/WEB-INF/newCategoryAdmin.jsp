<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <form:errors path="category.*"/>
            <form:form method="POST" action="" cssClass="form col border border-1 rounded" modelAttribute="category" >
                <p class="form-group col">
                    <form:label path="name">Nombre: </form:label>
                    <form:input cssClass="form-control" path="name"/>
                </p>
                <input class="btn btn-warning" type="submit" value="Create Category"/>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>

