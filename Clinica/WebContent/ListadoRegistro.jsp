<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
         <%@ page import="java.sql.*" %>
         <%@ page import="java.util.ArrayList"%>
<%@page import=" java.util.List" %>
<%@page import="Modelo.Registro" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinica Dental del Sur</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
   <link href="assets/css/listar.css" rel="stylesheet">
</head>

<body>
 <!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
         <i class="icofont-envelope"></i> <a href="mailto:contact@example.com">clinicadentaldelsur@gmail.com</a>
        <i class="icofont-phone"></i>(054) 509-735
        <i class="icofont-google-map"></i> Avenida Ej&eacute;rcito,803 - int. 01, Cayma, Arequipa
      </div>
      <div class="social-links">
        <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
        <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
        <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
        <a href="#" class="skype"><i class="icofont-skype"></i></a>
        <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
      </div>
    </div>
  </div>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.html">Clinica Dental del Sur</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      

      <a href="index.jsp" class="appointment-btn scrollto">Cerrar Sesion</a>

    </div>
  </header><!-- End Header -->
    <br>
    <br>

   
	<div class="contenido">
	
			<h1>Listado de clientes</h1>
			
			<table class="table table-bordered table-hover">
				<thead>			
					<tr>
						
						<th scope="col" class="text-center">Nombre</th>
						<th scope="col" class="text-center">Apellido</th>
						<th scope="col" class="text-center">Correo</th>
						<th scope="col" class="text-center">Telefono</th>
						<th scope="col"class="text-center">Especialidad</th>
						<th scope="col" class="text-center">Fecha</th>
						<th scope="col"class="text-center">Hora</th>
						
					</tr>
				</thead>
				<jsp:useBean class="Modelo.RegistroDAOImp" id="registroDAO"></jsp:useBean>
				
				<c:forEach items="${registroDAO.ListadoRegistro()}" var="registro">
					<tr>
						
						<td>${registro.nombre}</td>
						<td>${registro.apellido}</td>
						<td>${registro.correo}</td>
						<td>${registro.telefono}</td>
						<td>${registro.especialidad.especialidad}</td>
						<td>${registro.fecha}</td>
						<td>${registro.atencion.hora}</td>
						
						
					
					</tr>
				</c:forEach>
				
			</table>
			
		</div>
		 
     <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="assets/vendor/counterup/counterup.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>