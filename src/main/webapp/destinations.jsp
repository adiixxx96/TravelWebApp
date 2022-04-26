<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"


    import="com.sanvalero.travelapp.domain.User"
%>

<%@ page import="com.sanvalero.travelapp.dao.Database" %>
<%@ page import="com.sanvalero.travelapp.dao.DestinationDao" %>
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
    <title>Destinations</title>
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

<section class="contenedor">
<h3>Nuestros destinos</h3>

<!-- Buscador de destinos -->
<div class="container-fluid" style="margin:0 auto; margin-bottom:30px ! important">
    <form class="d-flex" method="post" action="destinations.jsp">
      <input class="form-control me-2" name="searchtext" id="searchtext" type="search" placeholder="Buscar destino por país o área" aria-label="Search">
      <a class="btn btn-warning" type="submit">Buscar</a>
    </form>
  </div>
<div class="row">

<%
    // Recoger el parámetro del buscador
    String searchtextOld = request.getParameter("searchtext");
    String searchtext = StringUtils.lowerCase(searchtextOld);


    Database database = new Database();
    DestinationDao destinationDao = new DestinationDao(database.getConnection());

    // Si no hay nada en el buscador, acceder a la bbdd y recuperar todos los destinos
    if (searchtext == null) {
        try {
            List<Destination> destinations = destinationDao.findAll();
            for (Destination destination : destinations) {
    %>
                <div class="card text-center" style="margin-bottom:20px ! important">
                  <div class="card-body">
                    <h5 class="card-title"><%=destination.getName() %></h5>
                    <p class="card-text"><%=destination.getArea() %></p>
                    <a href="#" class="btn btn-warning">Ver itinerario</a>
                  </div>
                  <div class="card-footer text-muted">Puntuación media de nuestros viajeros: <%=destination.getScore() %></div>
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
    // Acceder a la bbdd y recuperar todos los destinos filtrados por el buscador
    try {
        List<Destination> destinations = destinationDao.findAll(searchtext);
        for (Destination destination : destinations) {
%>
            <div class="card text-center" style="margin-bottom:20px ! important">
              <div class="card-body">
                <h5 class="card-title"><%=destination.getName() %></h5>
                <p class="card-text"><%=destination.getArea() %></p>
                <a href="#" class="btn btn-warning">Ver itinerario</a>
              </div>
              <div class="card-footer text-muted">Puntuación media de nuestros viajeros: <%=destination.getScore() %></div>
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