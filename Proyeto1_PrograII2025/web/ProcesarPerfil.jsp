<%@page import="app.dataBase.pckg.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String email = request.getParameter("email");
    String nombre = request.getParameter("nombre");
    String telefono = request.getParameter("telefono");

    DbHelper dbh = new DbHelper();
    boolean actualizado = dbh.ActualizarPerfil(email, nombre, pwd, id);

    if (actualizado) {
        response.sendRedirect("perfil.html");
    } else {
        request.setAttribute("errorMensage", "Error al actualizar el perfil.");
        RequestDispatcher rd = request.getRequestDispatcher("ErrorHandler.jsp");
        rd.forward(request, response);
    }
%>

