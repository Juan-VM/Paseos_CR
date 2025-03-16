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
        <style>
            /* Fondo con la imagen Jaguar..jpg */
            body {
                background-image: url('img/Jaguar.jpg'); /* Asegúrate de tener la imagen en la ruta correcta */
                background-size: cover;
                background-position: center;
                color: white;
                font-family: 'Arial', sans-serif;
            }

            /* Estilos del Navbar */
            .navbar {
                background-color: rgba(0, 0, 0, 0.7);
            }

            /* Estilos de los botones personalizados */
            .btn-custom {
                font-weight: bold;
                font-size: 1.2rem;
                padding: 15px;
                background-color: #007bff;
                color: white;
                border-radius: 5px;
                text-transform: uppercase;
            }

            .btn-custom:hover {
                background-color: #0056b3;
                transition: background-color 0.3s ease;
            }

            .hero-section {
                background: rgba(0, 0, 0, 0.6);
                padding: 100px 0;
                text-align: center;
            }

            .hero-section h1 {
                font-size: 3.5rem;
                color: #FF6347;
                font-weight: bold;
            }

            .hero-section p {
                font-size: 1.2rem;
                color: #FFD700;
            }

            .modal-content {
                background-color: #333;
                color: white;
            }

            .modal-header {
                border-bottom: 2px solid #FF6347;
            }

            .modal-footer .btn-danger {
                background-color: #FF6347;
                border-color: #FF6347;
            }

            .modal-footer .btn-secondary {
                background-color: #FFD700;
                border-color: #FFD700;
            }

            /* Estilo para la tarjeta */
            .card {
                background-color: rgba(0, 0, 0, 0.6);
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.7);
                margin-bottom: 30px;
                padding: 20px;
            }

            .card-title {
                color: #FF6347;
                font-size: 1.5rem;
            }

            .card-text {
                color: #FFD700;
            }

            /* Estilo del formulario */
            .form-control {
                background-color: rgba(255, 255, 255, 0.8);
                border-radius: 10px;
                border: 1px solid #FF6347;
                color: black;
            }

            .btn-primary {
                background-color: #FF6347;
                border-color: #FF6347;
                font-weight: bold;
                border-radius: 10px;
            }

            .btn-primary:hover {
                background-color: #FFD700;
                border-color: #FFD700;
            }

            .container {
                margin-top: 50px;
            }

            /* Cambio de color a blanco para los títulos del formulario */
            .form-label {
                color: white !important;
            }
        </style>
    </head>
    <body>

        <!-- Sección Hero -->
        <div class="hero-section">
            <h1>Publicar paseo</h1>
            <p>Complete los datos</p>
        </div>

        <!-- Barra de navegación -->
        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">

                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CatalogoPaseos.jsp">Paseos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="PublicarPaseo.jsp">Publicar paseo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MisReservas.jsp">Mis reservas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="" data-bs-toggle="modal" data-bs-target="#myModal">Cerrar sesión</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Modal para confirmar cierre de sesión -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cerrar sesión</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        ¿Estás seguro de que deseas cerrar sesión?
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
                        <a href="Logout.jsp" class="btn btn-danger">Aceptar</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Formulario para publicar paseo -->
        <div class="container mt-5 mb-5">
            <div class="d-flex justify-content-center align-items-center">
                <div class="card shadow-lg p-4 rounded" style="max-width: 500px; width: 100%;">
                    <h4 class="text-center text-primary mb-3"><b>Publicar paseo</b></h4>
                    <form action="CreateEventLogic.jsp">
                        <div class="mb-3">
                            <label for="txtName" class="form-label"><i class="fas fa-pen"></i> <b>Nombre del paseo</b></label>
                            <input type="text" class="form-control" name="txtName" id="txtName" placeholder="Ingresa el nombre del paseo" required>
                        </div>

                        <div class="mb-3">
                            <label for="txtDescription" class="form-label"><i class="fas fa-info-circle"></i> <b>Descripción del paseo</b></label>
                            <textarea class="form-control" name="txtDescription" id="txtDescription" placeholder="Ingresa la descripción del paseo" rows="4" maxlength="200" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="txtDate" class="form-label"><i class="fas fa-calendar-alt"></i> <b>Fecha del paseo</b></label>
                            <input type="date" class="form-control" name="txtDate" id="txtDate" placeholder="Ingresa la fecha del paseo" required>
                        </div>

                        <div class="mb-3">
                            <label for="txtUbication" class="form-label"><i class="fas fa-map-marker-alt"></i> <b>Ubicación del paseo</b></label>
                            <input type="text" class="form-control" name="txtUbication" id="txtUbication" placeholder="Ingresa la ubicación del paseo" required>
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

    </body>
</html>
