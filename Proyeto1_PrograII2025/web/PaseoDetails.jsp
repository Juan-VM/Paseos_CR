
<%@page import="app.model.pckg.Event"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<%
    String email = (String) session.getAttribute("email");

    if (email == null) {
        request.setAttribute("errorMensage", "La sesion esta inactiva, debes iniciar sesion.");
        RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
        rd.forward(request, response);
    }

    int userId = (int) session.getAttribute("userId");
    String idString = request.getParameter("id");
    idString = idString.trim();
    int eventId = Integer.parseInt(idString);

    DbHelper dbh = new DbHelper();
    ResultSet rs = dbh.getEvent(eventId);

    if (!(rs.next())) {
        request.setAttribute("errorMensage", "El rs esta vacio.");
        RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
        rd.forward(request, response);
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>

        <div class="p-5 bg-primary text-white text-center">
            <h1>Paseos Naturales CR ☼</h1>
            <p>Encuentra tu evento ideal!</p> 
        </div>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Home.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="CatalogoPaseos.jsp">Detalles del paseo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="PublicarPaseo.jsp">Publicar paseo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MisEventos.jsp">Mis paseos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Historial.jsp">Historial</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="" data-bs-toggle="modal" data-bs-target="#myModal">Cerrar sesion</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cerrar sesion</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        Estas seguro de que deseas cerrar sesion?
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
                        <a href="Logout.jsp" class="btn btn-danger">Aceptar</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mb-5 shadow-lg mx-auto mt-5" style="max-width: 500px; border-radius: 10px; overflow: hidden;">
            <div class="card-header bg-success text-white">
                <h1 class="card-title text-center" style="font-size: 2rem; font-weight: bold; letter-spacing: 1px;"><%=rs.getString("e_name")%></h1>
                <img src="<%=rs.getString("e_photo")%>" class="card-img-top" alt="Evento Imagen" style="max-height: 250px; object-fit: cover; border-radius: 10px                   10px 0 0;" />
            </div>

            <div class="card-body p-4">
                <p class="card-text"><i class="fas fa-info-circle" style="color: #5c6bc0;"></i> <b>Descripción:</b> <%=rs.getString("e_description")%></p>
                <p class="card-text"><i class="fas fa-calendar-day" style="color: #ff7043;"></i> <b>Fecha:</b> <%=rs.getString("e_date")%></p>
                <p class="card-text"><i class="fas fa-map-marker-alt" style="color: #26a69a;"></i> <b>Ubicación:</b> <%=rs.getString("e_ubication")%></p>
                <p class="card-text"><i class="fas fa-ticket-alt" style="color: #ffca28;"></i> <b>Entradas disponibles:</b> <%=rs.getInt("e_tickets")%></p>
            </div>

            <div class="card-footer d-flex justify-content-between align-items-center p-3" style="background-color: #f8f9fa; border-top: 1px solid #ddd;">
                <a href="#" class="btn btn-success btn-lg w-45" style="border-radius: 20px; padding: 12px 20px; font-size: 1rem;"><i class="fas fa-check-circle"                    ></i><b>Reservar</b></a>
                        <% if (userId == rs.getInt("e_userId")) { %>
                <a href="#" class="btn btn-warning btn-lg w-45" style="border-radius: 20px; padding: 12px 20px; font-size: 1rem;"><i class="fas fa-edit"></i>                       <b>Editar</b></a>
                <% }%>
                <a href="CatalogoPaseos.jsp" class="btn btn-danger btn-lg w-45" style="border-radius: 20px; padding: 12px 20px; font-size: 1rem;"><i class="fas fa-times-circle"                     ></i> <b>Cerrar</b></a>
            </div>
        </div>
    </body>
</html>
