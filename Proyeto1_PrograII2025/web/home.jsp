<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Paseos Naturales CR</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background-image: url('img/lapa.jpg'); /* Fondo que hace que se vea atractivo */
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                color: white;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.7); /* Fondo oscuro para el navbar */
                border-bottom: 2px solid #FF6347; /* Línea naranja para darle contraste */
            }

            .navbar-nav .nav-link {
                color: #FFD700 !important; /* Color dorado para los enlaces */
                font-weight: bold;
            }

            .navbar-nav .nav-link:hover {
                color: #FF6347 !important; /* Color tomate al pasar el ratón */
            }

            .hero-section {
                background: rgba(0, 0, 0, 0.5); /* Fondo oscuro semitransparente */
                padding: 80px 0;
                text-align: center;
            }

            .hero-section h1 {
                font-size: 3.5rem;
                color: #FF6347; /* Color de texto atractivo */
            }

            .hero-section p {
                font-size: 1.2rem;
                color: #FFD700;
            }

            .card {
                background-color: rgba(0, 0, 0, 0.6);
                border-radius: 15px;
                margin-bottom: 30px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.6);
            }

            .card-img-top {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
            }

            .card-body {
                padding: 20px;
            }

            .card-title {
                font-size: 1.5rem;
                color: #FF6347;
            }

            .card-text {
                font-size: 1rem;
                color: #FFD700;
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

            .container {
                margin-top: 50px;
            }

        </style>
    </head>
    <body>

        <div class="hero-section">
            <h1>Paseos Naturales CR</h1>
            <p>Encuentra tu escapada ideal!</p>

            <% if (session.getAttribute("email") == null) { %>
            <a href="Login.html" class="btn btn-primary">Iniciar sesión</a>
            <a href="Registration.html" class="btn btn-primary">Registrarse</a>
            <% }%>
        </div>

        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="CatalogoPaseos.jsp">Paseos</a></li>
                    <li class="nav-item"><a class="nav-link" href="PublicarPaseo.jsp">Publicar paseo</a></li>
                    <li class="nav-item"><a class="nav-link" href="MisEventos.jsp">Mis publicaciones</a></li>
                    <li class="nav-item"><a class="nav-link" href="MisReservas.jsp">Mis reservas</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#myModal">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <h2 class="text-center mb-4">Consejos</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <img src="img/equipaje.jpeg" class="card-img-top" alt="Playa del Coco">
                        <div class="card-body">
                            <h5 class="card-title">Prepárate bien</h5>
                            <p class="card-text">Lleva lo esencial según el tipo de paseo (agua, protector solar, snacks, una chaqueta ligera y calzado cómodo.</p>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="img/mapa.jpg" class="card-img-top" alt="Baldi">
                        <div class="card-body">
                            <h5 class="card-title">Planifica la ruta</h5>
                            <p class="card-text">Investiga el lugar antes de ir, revisa el clima y ten una idea clara de los caminos o paradas interesantes.</p>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="img/Paseito.webp" class="card-img-top" alt="Monteverde">
                        <div class="card-body">
                            <h5 class="card-title">Disfruta el momento</h5>
                            <p class="card-text">Desconéctate un poco del teléfono, aprecia la naturaleza o el entorno, y diviértete sin prisas.</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para confirmar el cierre de sesión -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Cerrar sesión</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Estás seguro de que deseas cerrar sesión?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <a href="Logout.jsp" class="btn btn-danger">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
