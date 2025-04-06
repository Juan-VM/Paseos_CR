<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.servlet.http.*, javax.servlet.*"%>





<%
    HttpSession sesion = request.getSession();
    String usuario = (String) sesion.getAttribute("usuario");
    
    
    
    int id = Integer.parseInt( request.getParameter("id"));
    
    DbHelper db = new DbHelper();
    ResultSet rs = db.getUser(id);
    


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
                background-image: url('img/Jaguar.jpg');
                background-size: cover;
                background-position: center;
                color: white;
                font-family: 'Arial', sans-serif;
            }

            .navbar {
                background-color: rgba(0, 0, 0, 0.7);
            }

            .navbar-nav .nav-link {
                font-size: 1.1rem;
                font-weight: bold;
            }

            .navbar-nav .nav-link:hover {
                color: #FFD700; /* Color dorado al pasar el mouse */
            }

            /* Nuevo estilo para el enlace "Cerrar sesión" */
            .navbar-nav .nav-link[data-bs-target="#myModal"] {
                color: red !important;
                font-weight: bold;
            }

            .navbar-nav .nav-link[data-bs-target="#myModal"]:hover {
                color: darkred !important;
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
                background-color: rgba(0, 0, 0, 0.8);
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.7);
                padding: 20px;
            }

            .form-control {
                background-color: #FFFFFF; /* Fondo blanco */
                border-radius: 10px;
                border: 1px solid #FF6347;
                color: black;
            }

            .form-label {
                color: white !important; /* Blanco puro */
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
        </style>
    
</head>

<body>
    
    <%
       while (rs.next()) { 
        %>
   
       <div class="container mt-5 mb-5">
           
            <div class="d-flex justify-content-center align-items-center">
                
                <div class="card shadow-lg p-4 rounded" style="max-width: 500px; width: 100%;">
                    
                    <h4 class="text-center text-primary mb-3"><b>Perfil</b></h4>
                    
                    <form action="ActualizarPerfil.jsp">
                        
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-pen"></i> <b>Nombre de Usuario</b></label>
                            <input type="text" class="form-control" name="txtName" value="<%=rs.getString("user_name")%>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-info-circle"></i> <b>email</b></label>
                            <input type="email" class="form-control" name="txtemail" value="<%=rs.getString("email")%>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-calendar-alt"></i> <b>Contraseña</b></label>
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