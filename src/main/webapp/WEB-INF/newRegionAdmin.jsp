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
        <div class="col-12  border border-1 rounded">
            <form:errors path="region.*" cssClass="col"/>
            <form:form method="POST" action="" cssClass="form col" modelAttribute="region" >
                <p class="form-group col">
                    <form:label path="nameRegion">Nombre de la Region: </form:label>
                    <form:input cssClass="form-control" path="nameRegion"/>
                </p>
                <input class="btn btn-warning" type="submit" value="Create Region"/>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>

