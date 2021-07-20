<%--
  Created by IntelliJ IDEA.
  User: Hector
  Date: 20-07-2021
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Registration</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col border border-secondary border-1 p-5 mr-3">

            <p><form:errors path="user.*"/></p>
            <h1>Registrando al socio</h1>
            <form:form method="POST" action="/" cssClass="form" modelAttribute="user">

                <p class="form-group">
                    <form:label path="firstName">first Name: </form:label>
                    <form:input cssClass="form-control" path="firstName"/>
                </p>

                <p class="form-group">
                    <form:label path="lastName">Last Name: </form:label>
                    <form:input cssClass="form-control" path="lastName"/>
                </p>

                <p>
                    <form:label path="email">Email:</form:label>
                    <form:input cssClass="form-control" type="email" path="email"/>
                </p>
                <p>
                    <form:label path="password">Password:</form:label>
                    <form:password cssClass="form-control" path="password"/>
                </p>
                <p>
                    <form:label path="passwordConfirmation">Password Confirmation:</form:label>
                    <form:password cssClass="form-control" path="passwordConfirmation"/>
                </p>
                <input class="btn btn-warning" type="submit" value="Register!"/>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>

