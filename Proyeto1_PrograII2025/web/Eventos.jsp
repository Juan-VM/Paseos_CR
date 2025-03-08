
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Vehículos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="css/site.css" rel="stylesheet" type="text/css"/>
</head>
<body class="bg-light">

<div class="top-bar d-none d-xl-block">
    <div class="container d-flex justify-content-between">
        <ul class="list-inline mb-0">
            <li class="list-inline-item"><a href="mailto:contact@priceautoscr.com">contact@priceautoscr.com</a></li>
            <li class="list-inline-item">Lun - Vie: 7:30am - 5:00pm</li>
            <li class="list-inline-item">Ok 34, Provincia De Puntarenas, Costa Rica</li>
        </ul>
        <a class="btn btn-warning btn-sm" href="/contact">📅 Book A Virtual Tour</a>
    </div>
</div>

<!-- Menú principal -->
<div class="header-main">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-2 col-auto">
                <a class="navbar-brand" href="/">
                    <img src="https://www.priceautoscr.com/PriceAuto/assets/media/general/logo.png" alt="Price Auto Sales">
                </a>
            </div>
            <div class="col-lg-auto col">
                <div class="header-contacts d-none d-md-block">
                    <span>📞 Call Us Today: <a href="tel:+50627794545">+506 2779 4545</a></span>
                </div>
            </div>
            <div class="col-lg d-none d-lg-block">
                <nav class="navbar navbar-expand-md justify-content-end">
                    <ul class="navbar-nav">
                        <li class="nav-item active"><a class="nav-link" href="menu.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/inventory">Inventory</a></li>
                        <li class="nav-item"><a class="nav-link" href="/about">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Services</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/contact">Schedule Appointment</a>
                            </div>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="/dealers">Locations</a></li>
                        <li class="nav-item"><a class="nav-link" href="/contact">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<hr>

<div class="text-center">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <c:forEach var="car" items="${cars}">
                <div class="col-md-4 mb-3">
                    <div class="card shadow-sm" style="width:18rem;height:25rem">
                        <img src="<c:out value="${car.Photo}"/>"/>
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${car.Brand}"/> <c:out value="${car.Model}"/></h5>
                            <p class="card-text">Engine: <c:out value="${car.Engine}"/></p>
                            <a href="#" class="btn btn-primary">Ver detalles</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
