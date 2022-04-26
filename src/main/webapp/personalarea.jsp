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
    <title>Área personal</title>
    <meta charset="UTF-8">
    <!--"estilos bootstrap"--><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/ada.css">
    <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
  </head>

  <body>
  <jsp:include page="header.jsp" />
  </header>

<!-- Datos del usuario logueado -->
<main class="contenedor">
  <h3>Área personal</h3>
       <form>
         <fieldset disabled>
           <legend>Datos de usuario</legend>
           <div class="mb-3">
             <label for="name" class="form-label">Nombre</label>
             <input type="text" id="name" class="form-control" value="<%= currentUser.getName() %>">
           </div>
            <div class="mb-3">
              <label for="username" class="form-label">Usuario</label>
              <input type="text" id="username" class="form-control" value="<%= currentUser.getUsername() %>">
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Contraseña</label>
              <input type="password" id="password" class="form-control" value="<%= currentUser.getPassword() %>">
            </div>

         </fieldset>
            <!-- Acceso a editar usuario -->
            <a href="edituser.jsp" class="btn btn-secondary">Editar datos de usuario</a>

            <!-- Borra el usuario y sus reservas asociadas de la bbdd -->
            <a href="delete-user?username=<%= currentUser.getUsername() %>" class="btn btn-danger">Borrar cuenta</a>
            <div class="alert alert-danger d-flex align-items-center" role="alert" style="margin-top:20px ! important; width:550px ! important">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg>
               <div>Si borras tu cuenta se cancelarán todas tus reservas</div>
            </div>
       </form>
    </section>

  <div class="container">
   <h3 style="text-align:left">Mis reservas</h3>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

        <%
            // Acceder a la base de datos y recuperar la información de reservas asociadas al usuario
            Database database = new Database();
            BookingDao bookingDao = new BookingDao(database.getConnection());
            try {
                List<Booking> bookings = bookingDao.findAll(currentUser);
                for (Booking booking : bookings) {
         %>

          <div class="col">
            <div class="card shadow-sm">
              <img src="images/trip<%=booking.getTrip().getDestination().getId() %>.jpg" class="card-img-top" alt="imagen" style="margin-bottom:20px ! important; width:100% ! important; height:250px ! important">
              <div class="card-body">
                <h5 class="card-text"><%=booking.getTrip().getDestination().getName() %></h5>
                <h6 class="card-text">Del <%=booking.getTrip().getStartDate() %> al <%=booking.getTrip().getEndDate() %></h6>
                <p class="text-muted" style"font-size:12px ! important">Nº reserva: <%=booking.getCode() %></p>
                <div class="d-flex justify-content-between align-items-center">
                    <small class="text-muted" style="font-size:12px ! important">Fecha reserva: <%=booking.getBookingDate() %></small>
                    <a href="delete-booking?code=<%= booking.getCode() %>" class="btn btn-sm btn-danger">Cancelar</a>
                </div>
              </div>
            </div>
          </div>
          <%
                 }
            } catch (SQLException sqle) {
           %>
                     <div class="alert alert-danger" role="alert">
                        Error conectando con la base de datos
                     </div>
           <%
             }
           %>
         </div>
        </div>
       </div>
      </main>
    <jsp:include page="footer.jsp" />

