<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="nome" value="${sessionScope.nome}"/>
<c:choose>
<c:when test="${not empty nome}">
<!DOCTYPE html>
<html lang="pt">
  <head>
    <meta http-equiv="Content-Type">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Sistema de Controle de Endemias</title>
    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap select -->
  	<link href="css/bootstrap-select.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">    
    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">	 
    <!-- Logo do sistema -->
    <style>
       .imgcenter {          
            margin: 20%;
            text-align:center;  
        }           
    </style>
  
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      <c:import url="menu.jsp"/>                  
        <!-- page content -->
        <div class="right_col" role="main">
		  <div class="row">
            <div class="page-title">
              <div class="imgcenter" >
                <h3 ></h3>
                    <img src="images/logosis.png" class="img-responsive img-circled" width="500px"/>
                     <!-- <img src="images/logosis.png" class="img-responsive img-thumbnail"/> --> 
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Trabalho de Programação Web <a href="https://github.com/dougfalves/UFG-PW-TRABALHO">Github</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
		</div>
	</div>

 <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Bootstrap select -->
    <script src="js/bootstrap-select.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script> 
    <!-- bootstrap-VALIDATOR -->
    <script src="js/validator.min.js"></script>
	
  </body>
</html>
</c:when>
<c:otherwise>
	<jsp:forward page="index.jsp"></jsp:forward>
</c:otherwise>
</c:choose>
