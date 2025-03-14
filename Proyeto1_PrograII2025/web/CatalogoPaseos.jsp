
<%@page import="java.sql.ResultSet"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="app.model.pckg.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DbHelper dbh = new DbHelper();
    ResultSet rs = dbh.getEvents();
    ArrayList<Event> events = new ArrayList<Event>();

    while (rs.next()) {
        Event event = new Event(
                rs.getInt("e_id"),
                rs.getInt("e_userId"),
                rs.getString("e_name"),
                rs.getString("e_description"),
                rs.getString("e_date"),
                rs.getString("e_photo"),
                rs.getString("e_ubication"),
                rs.getInt("e_tickets"));
        events.add(event);
    }
%>
<!DOCTYPE html>
<html lang="es">
    <html>
        <head>
            <title>Inicio Sesion</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <link href="WEB-INF/css.css" rel="stylesheet" type="text/css"/>
            <link href="styles.css" rel="stylesheet" type="text/css"/>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            <style>
                .btn-custom {
                    font-weight: bold;
                    font-size: 1.5rem;
                    padding: 15px;
                }
            </style>
        </head>
        <body>

            <%
                String email = (String) session.getAttribute("email");
                if (email == null) {
                    request.setAttribute("errorMensage", "La sesion esta inactiva, debes iniciar sesion.");
                    RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
                    rd.forward(request, response);
                }
            %>
            <div class="p-5 bg-primary text-white text-center">
                <h1>Paseos CR</h1>
                <p>Encuentra tu paseo ideal!</p> 
            </div>

            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <div class="container-fluid">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="Home.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="CatalogoPaseos.jsp">Paseos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PublicarPaseo.jsp">Publicar paseos</a>
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

            <div class="text-center">
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <%
                            for (Event event : events) {
                        %>
                        <div class="col-auto mb-5">
                            <div class="card shadow-sm" style="width:20rem;height:25rem">
                                <img src="<%=event.getPhoto()%>" class="card-img-top" />
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title"><%=event.getName()%></h5>
                                    <p class="card-text">Descripcion: <%=event.getDescription()%></p>
                                    <div class="mt-auto">
                                        <a href="PaseoDetails.jsp?id=<%=event.getId()%>" class="btn btn-primary w-100"><b>Ver detalles</b></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>

        </body>
    </html>