<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<%@ page import="com.sanvalero.travelapp.dao.Database" %>
<%@ page import="com.sanvalero.travelapp.dao.TripDao" %>
<%@ page import="com.sanvalero.travelapp.domain.Trip" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sanvalero.travelapp.domain.User" %>
<%@ page import="java.util.Optional" %>

<%
    //Comprobamos login de usuario
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html lang="es">
<head>
    <title>Viajes</title>
    <meta charset="UTF-8">
    <!--"estilos bootstrap"--><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--"estilos customizados"--><link rel="stylesheet" href="css/ada.css">
    <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
  </head>

<body>
<jsp:include page="header.jsp" />
</header>

<section class="contenedor">
<h3>Confirmación de reserva</h3>

<!--Buscamos el viaje que quiere reservar el usuario-->

<%
    String tripId = request.getParameter("id");
    Database database = new Database();
    TripDao tripDao = new TripDao(database.getConnection());
    Trip trip = null;
    try {
        Optional<Trip> optionalTrip = tripDao.findById(Integer.parseInt(tripId));
        trip = optionalTrip.get();
 %>
                <div class="card text-center" style="width:50% ! important; margin-left:auto ! important; margin-right:auto ! important">
                  <div class="card-body">
                    <img src="images/trip<%=trip.getDestination().getId() %>.jpg" class="card-img-top" alt="imagen" style="margin-bottom:20px ! important; width:400px ! important; height:250px ! important">
                    <h5 class="card-title">Destino: <%=trip.getDestination().getName() %></h5>
                    <h6 class="card-text" style="margin-top:15px ! important;">Fecha de salida: <%=trip.getStartDate() %></h6>
                    <h6 class="card-text">Fecha de llegada: <%=trip.getEndDate() %></h6>
                    <h6 class="card-text" style="margin-bottom:20px ! important; margin-top:15px ! important">Precio: <%=trip.getPrice() %> €</h6>
                    <a href="add-booking?idTrip=<%= trip.getId() %>" class="btn btn-warning" style="margin-right:20px ! important">Confirmar</a>
                    <a type="button" class="btn btn-link" href="trips.jsp" role="button" style="margin-left:20px ! important">Cancelar</a>
                  </div>
                </div>
 <%
  } catch (SQLException sqle) {
 %>
           <div class="alert alert-danger" role="alert">
              Error conectando con la base de datos
           </div>
 <%
   }
 %>
</div>
</section>
<jsp:include page="footer.jsp" />
