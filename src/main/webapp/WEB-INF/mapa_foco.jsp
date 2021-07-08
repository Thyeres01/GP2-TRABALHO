<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="nome" value="${sessionScope.nome}"/>
<c:choose>
<c:when test="${not empty nome}">

<!DOCTYPE html>
<html lang="pt">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link href="vendors/font-awesome/css/font-awesome.min.css" 	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="css/custom.min.css" rel="stylesheet">
<!-- Mapa Style -->
<style>


/* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
#map {
	height: 326px;
	width: 100%;
	align-content: center
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<c:import url="menu.jsp" />
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					<br />
					<div class="row">
						<div class="col-lg-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<!-- Mapa-->
									<h2>Mapa<small>Parametros de Busca </small></h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
								<div class="clearfix"></div>
								</div>
								<div class="x_content">	
								<form class="form-horizontal form-label-left"
								 data-toggle="validator" method="post" action="carregamapa">
								 
									<div class="form-group  col-lg-3 col-xs-12">
											<label>Bairro </label> <select name="txtpesquisa1"
												title="Selecione uma opção"
												class="form-control input-md selectpicker"
												data-live-search="true">
												<c:forEach var="combobairro" items="${listabairro}">
													<option>${combobairro.nome_bairro}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Cidade </label> <select name="txtpesquisa2"
												title="Selecione uma opção"
												class="form-control input-md selectpicker"
												>
												<c:forEach var="combocidade" items="${listacidade}">
													<option>${combocidade.nome_cidade}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group  col-lg-2 col-xs-12">
											<label>Tipo de Imovel </label> <select name="txtpesquisa3"
												title="Selecione uma opção"
												class="form-control input-md selectpicker"
												>
												<c:forEach var="combotipoimovel" items="${listaimovel}">
													<option>${combotipoimovel.nome_tpimovel}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group  col-lg-2 col-xs-12">
											<label>Estagio</label> <select name="txtpesquisa4"
												title="Selecione uma opção"
												class="form-control input-md selectpicker"
												>
												<c:forEach var="comboestagio" items="${listaestagio}">
													<option>${comboestagio.nome_estagio}</option>
												</c:forEach>
											</select>
										</div>
										
										<div class="form-group  col-lg-2 col-xs-12">
											<label>Situação do Imovel </label>
											<select name="txtpesquisa5"
												title="Selecione uma opção"
												class="form-control input-md selectpicker">												
												<option value="Visitado">Visitado</option>
												<option value="Fechado">Fechado</option>												
												<option value="Recusado">Recusado</option>
																								
											</select>
										</div>
																										
										<div class="form-group  col-lg-2 col-xs-12">										
										<button type="submit" class="btn btn-info"
											data-container="body" data-toggle="popover"
											data-placement="bottom" title="Visualizar no Mapa">
											<i class="fa fa-globe"></i>  Visualizar
										</button>
									</div>											
									</div>
								</form>									
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="row">
					<!-- Mapa  -->				
						<div class="col-lg-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<!-- Mapa-->
									<h2> Mapa <small>Local dos Focaos</small></h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">															
								<!-- Iniciando o mapa -->

								<div id="map"></div>
								<script>
										function initMap() {

											var map = new google.maps.Map(
													document.getElementById('map'),
													{
														zoom : 13,
														center : locations[0],
													});
											var labels = '+';
											// Adicione alguns marcadores ao mapa.
											// Nota: O código usa o método JavaScript Array.prototype.map () para
											// cria uma matriz de marcadores com base em um array de "locais".
											// O método map () aqui não tem nada a ver com a API do Google Maps.
											var markers = locations.map(function(location, i)
													{
														return new google.maps.Marker(
															{
																icon: 'images/icon.png',
																position : location,
																label : labels[i
																		% labels.length]
															});
													});

											// Adicione um marcador de cluster para gerenciar os marcadores.
											var markerCluster = new MarkerClusterer(
													map,
													markers,
													{
														imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
													});
										}

										//pontos /// trocar pelos objetos da lista
										<%@page import="model.VisitaDAO"%>
										<%@page	import="model.Visita"%>
										<%@page	import="java.util.List"%>
										<%@page	import="java.util.ArrayList"%>
											
										<%		request.setCharacterEncoding("UTF8");
												VisitaDAO visitaDAO = new VisitaDAO();
												Visita visita = new Visita();
												List<Visita> listavisita = new ArrayList<Visita>();
												String textopesquisa1 = request.getParameter("txtpesquisa1");
												String textopesquisa2 = request.getParameter("txtpesquisa2");
												String textopesquisa3 = request.getParameter("txtpesquisa3");
												String textopesquisa4 = request.getParameter("txtpesquisa4");
												String textopesquisa5 = request.getParameter("txtpesquisa5");
												listavisita = visitaDAO.listarmapa(textopesquisa1, textopesquisa2, textopesquisa3, textopesquisa4, textopesquisa5);
												
										%>
												var locations = [ 
												<%
													for (Visita v : listavisita) {												
												//System.out.println(v.getLatitude() + "," + v.getLongitude() + "},{");%>
													{
														lat:<%=v.getLatitude()%>,
														lng:<%=v.getLongitude()%>
													},
												<%}%>
										]	
											function tamanho(){
													document.getElementById("reg").innerHTML = locations.lenght/2;	
											}
												
									</script>
								<script
									src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
								</script>
								<script async defer
									src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDMW1J5J0TVAdNSO0CCSutqo29mKSKQ5A&callback=initMap">
								</script>
								</div>
							</div>
						</div>				
														<p id = "reg"></p>							
							
					 <!--  Grafico em Barras 
						  <div class="col-md-6 col-sm-12 col-xs-12">
			                <div class="x_panel">
			                  <div class="x_title">
			                    <h2>Bar graph <small>Sessions</small></h2>
			                    <ul class="nav navbar-right panel_toolbox">
			                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
			                      </li>			                      
			                      <li><a class="close-link"><i class="fa fa-close"></i></a>
			                      </li>
			                    </ul>
			                    <div class="clearfix"></div>
			                  </div>
			                  <div class="x_content">
			                    <canvas id="mybarChart"></canvas>
			                  </div>
			                </div>
             			 </div>
             			Grafico em Pizza
	             		<div class="col-md-6 col-sm-6 col-xs-12">
			                <div class="x_panel">
			                  <div class="x_title">
			                    <h2>Donut Graph <small>Sessions</small></h2>
			                    <ul class="nav navbar-right panel_toolbox">
			                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
			                      </li>
			                      	<li><a class="close-link"><i class="fa fa-close"></i></a>
			                      </li>
			                    </ul>
			                    <div class="clearfix"></div>
			                  </div>
			                  <div class="x_content">
			                    <canvas id="canvasDoughnut"></canvas>
			                  </div>
			                </div>
	             		 </div>	
					  
					  -->					  
					
	             		 <!-- Grafico em Linhas	              
		              <div class="col-md-12 col-sm-12 col-xs-12">
		                <div class="x_panel">
		                  <div class="x_title">
		                    <h2>Line graph<small>Sessions</small></h2>
		                    <ul class="nav navbar-right panel_toolbox">
		                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
		                      </li>		                     
		                      <li><a class="close-link"><i class="fa fa-close"></i></a>
		                      </li>
		                    </ul>
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                    <canvas id="lineChart"></canvas>
		                  </div>
	                	</div>
	              	</div> -->
	              	
            	</div>            
			</div>
		</div>
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
	<!-- Chartjs
	<script src="js/chart.min.js"></script> -->
		<c:import url="rodape.jsp" />	
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:forward page="index.jsp"></jsp:forward>
</c:otherwise>
</c:choose>

