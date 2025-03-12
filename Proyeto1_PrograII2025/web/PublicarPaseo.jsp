
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page import="app.model.pckg.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DbHelper dbh = new DbHelper();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publicar Evento</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
                        <a class="nav-link " href="Home.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CatálogoPaseos.jsp">Paseos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="PublicarEvento.jsp">Publicar paseos</a>
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

        <div class="container mt-5">
            <div class="d-flex justify-content-center align-items-center">
                <div class="card shadow-lg p-4 rounded" style="max-width: 500px; width: 100%;">
                    <h4 class="text-center text-primary mb-3"> <b>Publicar paseo</b> </h4>
                    <form action="CreateEventLogic.jsp">

                        <div class="mb-3">
                            <label for="txtName" class="form-label"><i class="fas fa-pen"></i> <b>Nombre del paseo</b></label>
                            <input type="text" class="form-control" name="txtName" id="txtName" placeholder="Ingresa el nombre del paseo" required>
                        </div>


                        <div class="mb-3">
                            <label for="txtDescription" class="form-label"><i class="fas fa-info-circle"></i> <b>Descripcion del paseo</b></label>
                            <input type="text" class="form-control" name="txtDescription" id="txtDescription" placeholder="Ingresa la descripcion del paseo" required>
                        </div>


                        <div class="mb-3">
                            <label for="txtDate" class="form-label"><i class="fas fa-calendar-alt"></i> <b>Fecha del paseo</b></label>
                            <input type="date" class="form-control" name="txtDate" id="txtDate" placeholder="Ingresa la fecha del paseo" required>
                        </div>


                        <div class="mb-3">
                            <label for="txtUbication" class="form-label"><i class="fas fa-map-marker-alt"></i> <b>Ubicacion del paseo</b></label>
                            <input type="text" class="form-control" name="txtUbication" id="txtUbication" placeholder="Ingresa la ubicacion del paseo" required>
                        </div>


                        <div class="mb-3">
                            <label for="txtTickets" class="form-label"><i class="fas fa-ticket-alt"></i> <b>Entradas disponibles</b></label>
                            <input type="number" class="form-control" name="txtTickets" id="txtTickets" placeholder="Ingresa las entradas disponibles" min="1" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Publicar</button>
                    </form>
                </div>
            </div>
        </div>


        <div class="mt-5 p-4 bg-dark text-white text-center">
            <p>vacacionescr@gmail.com</p>
            <p>WhatsApp: +506 0102 0304</p>
            <p>@Derechos reservados</p>
        </div>
    </body>
</html>
