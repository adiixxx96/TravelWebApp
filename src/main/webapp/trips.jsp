<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"


    import="com.sanvalero.travelapp.domain.User"
%>

<%@ page import="com.sanvalero.travelapp.dao.Database" %>
<%@ page import="com.sanvalero.travelapp.dao.TripDao" %>
<%@ page import="com.sanvalero.travelapp.domain.Trip" %>
<%@ page import="com.sanvalero.travelapp.domain.Destination" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sanvalero.travelapp.domain.User" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<%
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
<h3>Nuestros viajes</h3>

<!-- Buscador de viajes -->
<div class="container-fluid" style="margin:0 auto; margin-bottom:30px ! important">
    <form class="d-flex" method="post" action="trips.jsp">
      <input class="form-control me-2" name="searchtext" id="searchtext" type="search" placeholder="Buscar viaje por destino" aria-label="Search">
      <a class="btn btn-warning" type="submit">Search</a>
    </form>
  </div>
<div class="row">

<%
    // Recoger el parámetro del buscador

    String searchtextOld = request.getParameter("searchtext");
    String searchtext = StringUtils.lowerCase(searchtextOld);

    Database database = new Database();
    TripDao tripDao = new TripDao(database.getConnection());

    // Si no hay nada en el buscador, acceder a la bbdd y recuperar todos los viajes
    if (searchtext == null) {
      try {
        List<Trip> trips = tripDao.findAll();
        for (Trip trip : trips) {
 %>
            <div class="col-sm-6" style="width:33% ! important; padding-bottom:20px ! important;">
                <div class="card text-center">
                  <div class="card-body">
                    <h5 class="card-title"><%=trip.getDestination().getName() %></h5>
                    <img src="images/trip<%= trip.getDestination().getId() %>.jpg" class="card-img-top" alt="imagen" style="margin-bottom:20px ! important; width:310px ! important; height:230px ! important">
                    <h6 class="card-text">Del <%=trip.getStartDate() %> al <%=trip.getEndDate() %></h6>
                    <h6 class="card-text"><%=trip.getPrice() %> €</h6>
                    <a href="booking.jsp?id=<%= trip.getId() %>" class="btn btn-warning">Reserva este viaje</a>
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
  } else {
  // Acceder a la bbdd y recuperar todos los viajes filtrados por el buscador

       try {
               List<Trip> trips = tripDao.findAll(searchtext);
               for (Trip trip : trips) {
        %>
                   <div class="col-sm-6" style="width:33% ! important; padding-bottom:20px ! important;">
                       <div class="card text-center">
                         <div class="card-body">
                           <h5 class="card-title"><%=trip.getDestination().getName() %></h5>
                           <img src="images/trip<%= trip.getDestination().getId() %>.jpg" class="card-img-top" alt="imagen" style="margin-bottom:20px ! important; width:310px ! important; height:230px ! important">
                           <h6 class="card-text">Del <%=trip.getStartDate() %> al <%=trip.getEndDate() %></h6>
                           <h6 class="card-text"><%=trip.getPrice() %> €</h6>
                           <a href="booking.jsp?id=<%= trip.getId() %>" class="btn btn-warning">Reserva este viaje</a>
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
         }
 %>
</div>
</section>
<jsp:include page="footer.jsp" />
