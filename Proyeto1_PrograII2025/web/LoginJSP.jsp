
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String email = request.getParameter("txtEmail");
            String pswd = request.getParameter("txtPwd");

            if (email.equals("juan@gmail.com") && pswd.equals("123")) {
                RequestDispatcher rd = request.getRequestDispatcher("Home.html");
                rd.forward(request, response);
            }else{
                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.forward(request, response);
            }
        %>
    </body>
</html>
