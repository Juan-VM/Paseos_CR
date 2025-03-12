
<%@page import="app.model.pckg.Event"%>
<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publish event</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" defer></script>
    </head>
    <body>
        <%
            DbHelper dbh = new DbHelper();
            int userId = (int) session.getAttribute("userId");
            String name = request.getParameter("txtName");
            String description = request.getParameter("txtDescription");
            String date = request.getParameter("txtDate");
            String photo = "img/paseo.jpg";
            String ubic = request.getParameter("txtUbication");
            int tickets = Integer.parseInt(request.getParameter("txtTickets"));

            Event event = new Event(userId, name, description, date, photo, ubic, tickets);

            if (dbh.saveEvent(event)) {

        %>
        <div class="container mt-5 d-flex justify-content-center">
            <div class="card shadow-sm p-3" style="max-width: 400px; width: 100%;">
                <div class="card-body">
                    <h4 class="card-title text-primary"><i class="fas fa-exclamation-circle"></i> ¡Paseo publicado!</h4>

                    <p class="card-text">
                        Tu paseo se ha publicado con exito.
                    </p>
                    <a href="Home.html" class="btn btn-primary w-100"><i class="fas fa-check"></i> Aceptar</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="container mt-5 d-flex justify-content-center">
            <div class="card shadow-sm p-3" style="max-width: 400px; width: 100%;">
                <div class="card-body">
                    <h4 class="card-title text-danger"><i class="fas fa-exclamation-circle"></i> ¡Error!</h4>

                    <p class="card-text">
                        Ocurrio un error al publicar el paseo. Intentalo de nuevo...
                    </p>
                    <a href="PublicarPaseo.jsp" class="btn btn-primary w-100"><i class="fas fa-check"></i> Aceptar</a>
                </div>
            </div>
        </div>
        <%}%>
    </body>
</html>
