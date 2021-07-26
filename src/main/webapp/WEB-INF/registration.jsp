<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="/js/form.js" ></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Registrarse</title>
</head>
<body>
<div class="container">
    <header>
        <a class="btn btn-link" href="/">Volver a Inicio</a>
    </header>

    <div class="row">
        <div class="col border border-secondary border-1 p-5 mr-3">

            <p><form:errors path="user.*"/></p>
            <h1>Registrando al socio</h1>
            <form:form method="POST" action="" cssClass="form" enctype="multipart/form-data" modelAttribute="user">

                <p class="form-group">
                    <form:label path="firstName">Nombre: </form:label>
                    <form:input cssClass="form-control" path="firstName"/>
                </p>

                <p class="form-group">
                    <form:label path="lastName">Apellido: </form:label>
                    <form:input cssClass="form-control" path="lastName"/>
                </p>


<%--                <p class="form-group">--%>
<%--                    <label for="region">Region: </label>--%>
<%--                    <select name="region" id="region">--%>
<%--                        <c:forEach var="region" items="${regiones}">--%>
<%--                            <option value="${region.id}"> <c:out value="${region.nameRegion}"/> </option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>
<%--                </p>&ndash;%&gt;--%>

               <p class="form-group">
                   <form:label path="address.comuna.region">Region: </form:label>
                   <form:select cssClass="form-control" path="address.comuna.region">
                       <c:forEach var="region" items="${regiones}">
                           <form:option value="${region.id}"><c:out value="${region.nameRegion}"/> </form:option>
                       </c:forEach>
                   </form:select>
                </p>

<%--                <p class="form-group">--%>
<%--                    <label for="comuna">Comuna:</label>--%>
<%--                    <select name="comuna" id="comuna">--%>
<%--                        <c:forEach var="comuna" items="${comunas}">--%>
<%--                            <option value="${comuna.id}"> <c:out value="${comuna.nameComuna}"/> </option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>
<%--                </p>--%>

                <p class="form-group">
                    <form:label path="address.comuna">Comuna: </form:label>
                    <form:select cssClass="form-control" path="address.comuna">
                        <c:forEach var="comuna" items="${comunas}">
                            <form:option value="${comuna.id}"> <c:out value="${comuna.nameComuna}"/> </form:option>
                        </c:forEach>
                    </form:select>
                </p>

<%--                <p class="form-group">--%>
<%--                    <label for="calle">Calle</label>--%>
<%--                    <input type="text" id="calle" name="calle"/>--%>
<%--                </p>--%>

                <p class="form-group">
                    <form:label path="address.nameCalle">Calle: </form:label>
                    <form:input cssClass="form-control" path="address.nameCalle"/>
                </p>

                <p class="form-group">
                    <form:label path="phone">Celular: </form:label>
                    <form:input cssClass="form-control" path="phone"/>
                </p>

                <p class="form-group">
                    <form:label path="rol">Rol: </form:label>
                    <form:select cssClass="form-control" path="rol">
                        <option disabled selected value="">Selecciona una</option>
                        <form:option value="1">Prestar Servicios</form:option>
                        <form:option value="2">Contratar Servicios</form:option>
                    </form:select>
                </p>

                <p>
                    <form:label path="email">Email:</form:label>
                    <form:input cssClass="form-control" type="email" path="email"/>
                </p>
                <p>
                    <form:label path="password">Contraseña:</form:label>
                    <form:password cssClass="form-control" path="password"/>
                </p>
                <p>
                    <form:label path="passwordConfirmation">Confirmar contraseña:</form:label>
                    <form:password cssClass="form-control" path="passwordConfirmation"/>
                </p>
                <p>
                    <label>Foto de perfil:</label>
                    <input type="file" accept="image/png, image/jpeg" name="file">
                </p>
                <input class="btn btn-warning" type="submit" value="Registrar!"/>
            </form:form>
        </div>
    </div>

<%--registration bootstrap--%>
<%--    <a class="nav-link" href="#" data-toggle="modal" data-target="#RegistrationModal">REGISTRATION</a>
    <div class="modal fade" id="RegistrationModal" role="dialog">
        <div class="temp-custom-modal-wrap">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content temp-custom-modal-content">
                    <button type="button" class="close temp-custom-close-button" data-dismiss="modal">&times;</button>
                    <div class="modal-body temp-custom-modal-body">
                        <div class="temp-login-form-wrapper">
                            <div class="row custom-row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 temp-form-column-wrap-image">
                                    <div class="temp-reg-column-wrap-image">
                                        <div class="temp-form-inner-wrapper">
                                            <h2>Sign Up</h2>
                                            <p>If user doesn't have there account then, Create your account by filling the given entries.</p>
                                            <p class="temp-heading-for-icon temp-reg-para">Login with social media</p>
                                            <div class="temp-anchor-wrap temp-reg-anchor-wrap">
                                                <a href="#" class=" temp-anchor text-left">
                        <span class="temp-social-icon-wrap">
                          <i class="fa fa-facebook" aria-hidden="true"></i>
                        </span>
                                                    <span>Sign in with facebook</span>
                                                </a>
                                                <a href="#" class="temp-anchor temp-icon-color text-left">
                        <span class="temp-social-icon-wrap">
                          <i class="fa fa-google" aria-hidden="true"></i>
                        </span>
                                                    <span>Sign in with google</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="temp-form-column-wrap">
                                        <h2>Register</h2>
                                        <form>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input  class="temp_input_field" type="text" >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">First name</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input class="temp_input_field" type="text" >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">Email</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input class="temp_input_field" type="password"  >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">Password</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input class="temp_input_field" type="password" >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">Confirm password</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input  class="temp_input_field" type="text" >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">Phone number</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <label class="radio-inline temp-custom-radio-button">
                                                                    <input type="radio" name="gender" id="femaleRadio" value="Female">Female
                                                                    <span class="temp-radio-checkmark"></span>
                                                                </label>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <label class="radio-inline temp-custom-radio-button">
                                                                    <input type="radio" name="gender" id="maleRadio" value="Male">Male
                                                                    <span class="temp-radio-checkmark"></span>
                                                                </label>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label class="radio-inline temp-custom-radio-button">
                                                                    <input type="radio" name="gender" id="uncknownRadio" value="Unknown">Unknown
                                                                    <span class="temp-radio-checkmark"></span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="temp-login-button-wrap">
                                                        <button class="btn btn-info temp-form-button" type="button">Register</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>--%><%--    <a class="nav-link" href="#" data-toggle="modal" data-target="#RegistrationModal">REGISTRATION</a>
    <div class="modal fade" id="RegistrationModal" role="dialog">
        <div class="temp-custom-modal-wrap">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content temp-custom-modal-content">
                    <button type="button" class="close temp-custom-close-button" data-dismiss="modal">&times;</button>
                    <div class="modal-body temp-custom-modal-body">
                        <div class="temp-login-form-wrapper">
                            <div class="row custom-row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 temp-form-column-wrap-image">
                                    <div class="temp-reg-column-wrap-image">
                                        <div class="temp-form-inner-wrapper">
                                            <h2>Sign Up</h2>
                                            <p>If user doesn't have there account then, Create your account by filling the given entries.</p>
                                            <p class="temp-heading-for-icon temp-reg-para">Login with social media</p>
                                            <div class="temp-anchor-wrap temp-reg-anchor-wrap">
                                                <a href="#" class=" temp-anchor text-left">
                        <span class="temp-social-icon-wrap">
                          <i class="fa fa-facebook" aria-hidden="true"></i>
                        </span>
                                                    <span>Sign in with facebook</span>
                                                </a>
                                                <a href="#" class="temp-anchor temp-icon-color text-left">
                        <span class="temp-social-icon-wrap">
                          <i class="fa fa-google" aria-hidden="true"></i>
                        </span>
                                                    <span>Sign in with google</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="temp-form-column-wrap">
                                        <h2>Register</h2>
                                        <form>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input  class="temp_input_field" type="text" >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">First name</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input class="temp_input_field" type="text" >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">Email</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input class="temp_input_field" type="password"  >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">Password</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input class="temp_input_field" type="password" >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">Confirm password</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                          <span class="temp-span-wrap temp-span-input-label-wrap">
                            <input  class="temp_input_field" type="text" >
                            <label class="temp_input_label">
                              <span class="temp_input_label-content">Phone number</span>
                            </label>
                          </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <label class="radio-inline temp-custom-radio-button">
                                                                    <input type="radio" name="gender" id="femaleRadio" value="Female">Female
                                                                    <span class="temp-radio-checkmark"></span>
                                                                </label>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <label class="radio-inline temp-custom-radio-button">
                                                                    <input type="radio" name="gender" id="maleRadio" value="Male">Male
                                                                    <span class="temp-radio-checkmark"></span>
                                                                </label>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label class="radio-inline temp-custom-radio-button">
                                                                    <input type="radio" name="gender" id="uncknownRadio" value="Unknown">Unknown
                                                                    <span class="temp-radio-checkmark"></span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="temp-login-button-wrap">
                                                        <button class="btn btn-info temp-form-button" type="button">Register</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>--%>

