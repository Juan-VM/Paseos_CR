
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
                rs.getString("e_name"),
                rs.getString("e_description"),
                rs.getString("e_date"),
                rs.getString("e_photo"),
                rs.getString("e_ubication"),
                rs.getInt("e_tickets"));
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
                            <a class="nav-link active" href="Eventos.jsp">Paseos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PublicarEvento.jsp">Publicar paseos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MisEventos.jsp">Mis paseos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Historial.jsp">Historial</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">Cerrar sesion</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="text-center">
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <%
                            for (Event event : events) {
                        %>
                        <div class="col-md-4 mb-3">
                            <div class="card shadow-sm" style="width:18rem;height:25rem">
                                <img src="<%=event.getPhoto()%>" />
                                <div class="card-body">
                                    <h5 class="card-title"><%= %> <%= %> <%= %></h5>
                                    <p class="card-text">Engine: <%= %></p>
                                    <a href="carDetails.jsp?id=<%= %>" class="btn btn-primary">See details</a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>


            <div class="eventos-container">
                <div class="evento-card">
                    <img src="img/playcoco.jpeg" class="rounded" alt="playacoco"/>
                    <h3>Evento 1</h3>
                    <p>Detalles del evento 1...</p>
                    <button>Más Info</button>
                </div>

                <div class="evento-card">
                    <img src="img/playcoco.jpeg" class="rounded" alt="playacoco"/>
                    <h3>Evento 2</h3>
                    <p>Detalles del evento 2...</p>
                    <button>Más Info</button>
                </div>

                <div class="evento-card">
                    <img src="img/playcoco.jpeg" class="rounded" alt="playacoco"/>
                    <h3>Evento 3</h3>
                    <p>Detalles del evento 3...</p>
                    <button>Más Info</button>
                </div>

                <div class="evento-card">
                    <img src="img/playcoco.jpeg" class="rounded" alt="playacoco"/>
                    <h3>Evento 4</h3>
                    <p>Detalles del evento 4...</p>
                    <button>Más Info</button>
                </div>
            </div>

            <div class="mt-5 p-4 bg-dark text-white text-center">
                <p>vacacionescr@gmail.com</p>
                <p>WhatsApp: +506 0102 0304</p>
                <p>@Derechos reservados</p>
            </div>
        </body>
    </html>