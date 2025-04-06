<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.http.*, javax.servlet.*"%>





<%
    HttpSession sesion = request.getSession();
    String usuario = (String) sesion.getAttribute("usuario");

    int id2 = (int) session.getAttribute("userId");

    DbHelper db = new DbHelper();
    ResultSet rs = db.getUser(id2);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Perfil de Usuario</title>
        <link rel="stylesheet" href="styles.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-image: url('img/agua.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                color: white;
                font-family: 'Arial', sans-serif;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.75);
            }

            .navbar-nav .nav-link {
                font-size: 1.1rem;
                font-weight: bold;
                transition: color 0.3s;
            }

            .navbar-nav .nav-link:hover {
                color: #40E0D0; /* Turquesa */
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"] {
                color: #FF4C4C !important;
                font-weight: bold;
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"]:hover {
                color: #CC0000 !important;
            }

            .hero-section {
                background: rgba(0, 0, 0, 0.6);
                padding: 45px 0; /* Reducido */
                text-align: center;
            }

            .hero-section h1 {
                font-size: 3rem; /* Tamaño ajustado */
                color: #FFFFFF; /* Blanco puro */
                font-weight: bold;
            }

            .hero-section p {
                font-size: 1.2rem;
                color: #FFFFFF; /* Blanco puro */
            }

            .card {
                background-color: rgba(255, 255, 255, 0.95);
                border-radius: 20px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.6);
                padding: 25px;
                color: #000;
            }

            .form-control {
                border-radius: 10px;
                border: 1px solid #20B2AA;
                background-color: #f7f7f7;
            }

            .form-label {
                color: #000;
                font-weight: bold;
            }

            .btn-primary {
                background-color: #20B2AA;
                border-color: #20B2AA;
                font-weight: bold;
                border-radius: 10px;
            }

            .btn-primary:hover {
                background-color: #40E0D0;
                border-color: #40E0D0;
            }

            .text-primary {
                color: #20B2AA !important;
            }
        </style>

    </head>

    <body>

        <div class="hero-section">
            <h1>Editar perfil</h1>
            <p>Complete los datos</p>
        </div>

        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="perfil.jsp?id=<%=id2%>">Perfil</a></li>
                    <li class="nav-item"><a class="nav-link" href="CatalogoPaseos.jsp">Paseos</a></li>
                    <li class="nav-item"><a class="nav-link" href="PublicarPaseo.jsp">Publicar paseo</a></li>
                    <li class="nav-item"><a class="nav-link" href="MisReservas.jsp">Mis reservas</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#myModal">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>

        <%        while (rs.next()) {
        %>

        <div class="container mt-5 mb-5">

            <div class="d-flex justify-content-center align-items-center">

                <div class="card shadow-lg p-4 rounded" style="max-width: 500px; width: 100%;">

                    <h4 class="text-center text-primary mb-3"><b>Perfil</b></h4>

                    <form action="ActualizarPerfil.jsp">

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-user"></i> <b>Nombre de Usuario</b></label>
                            <input type="text" class="form-control" name="txtName" value="<%=rs.getString("user_name")%>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-envelope"></i> <b>Email</b></label>
                            <input type="email" class="form-control" name="txtemail" value="<%=rs.getString("email")%>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-lock"></i> <b>Contraseña</b></label>
                            <input type="password" class="form-control" name="txtpwd" value="<%=rs.getString("pwd")%>" required>
                        </div>

                        <input type="hidden" id="id" name="id" value="<%=rs.getString("id")%>" readonly/>

                        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Actualizar</button>

                        <!-- Añadir navegacion -->

                    </form>
                </div>
            </div>
        </div> 






        <%}%>
    </body>

</html>