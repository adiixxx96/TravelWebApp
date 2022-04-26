<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<%@ page import="com.sanvalero.travelapp.dao.Database" %>
<%@ page import="com.sanvalero.travelapp.dao.TripDao" %>
<%@ page import="com.sanvalero.travelapp.domain.Trip" %>
<%@ page import="com.sanvalero.travelapp.domain.Destination" %>
<%@ page import="com.sanvalero.travelapp.dao.BookingDao" %>
<%@ page import="com.sanvalero.travelapp.domain.Booking" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sanvalero.travelapp.domain.User" %>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html lang="es">
<head>
    <title>Modificar usuario</title>
    <meta charset="UTF-8">
    <!--"estilos bootstrap"--><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/ada.css">
    <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </head>

  <body>

  <!--ajax para procesar el formulario y enviarlo al servlet-->
  <script type="text/javascript">
          $(document).ready(function() {
              $("form").on("submit", function(event) {
                  event.preventDefault();
                  var formValue = $(this).serialize();
                  $.post("edit-user", formValue, function(data) {
                      $("#result").html(data);
                  });
              });
          });
      </script>
  <jsp:include page="header.jsp" />
  </header>

<!-- Traemos los datos del usuario y permitimos modificarlos-->
<main class="contenedor"><br>
       <form>
         <fieldset>
           <legend>Datos a editar</legend>
           <div class="mb-3">
             <label for="name" class="form-label">Nombre</label>
             <input type="text" name="name" class="form-control" value="<%= currentUser.getName() %>">
           </div>
            <div class="mb-3">
              <label for="username" class="form-label">Usuario</label>
              <input type="text" name="username" class="form-control" value="<%= currentUser.getUsername() %>">
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Contraseña</label>
              <input type="password" name="password" class="form-control" value="<%= currentUser.getPassword() %>">
            </div>
         </fieldset>
            <button type="submit" class="btn btn-warning">Guardar</button>
            <a href="personalarea.jsp" class="btn btn-link">Cancelar</a>
       </form>
       <div id="result"></div>
    </main>
    <jsp:include page="footer.jsp" />
