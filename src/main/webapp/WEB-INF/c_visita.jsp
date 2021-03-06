<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap select -->
<link href="css/bootstrap-select.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="build/css/custom.min.css" rel="stylesheet">
<!-- Footable -->
<link href="css/footable.standalone.min.css" rel="stylesheet">
<!-- BootstrapDialog -->
<link href="css/bootstrap-dialog.min.css" rel="stylesheet">
<!-- Switch -->
<link href="vendors/bootstrap-switch-master/dist/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">

<!--
<link href="css/footable.core.css" rel="stylesheet">
<link href="css/footable.standalone.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/2.0.3/css/footable.metro.css" rel="stylesheet">
-->
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
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Visitas <small>Endemic Sys</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>									
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="row">
												<c:if test="${not empty message}">
													<div class="col-lg-12 col-xs-12">
														<c:if test="${fn:contains(message, 'Erro')}">
															<div class="alert alert-danger fade in">
																<a href="#" class="close" data-dismiss="alert">&times;</a>
																<p>${message}</p>
															</div>
														</c:if>
														<c:if test="${fn:contains(message, 'pesquisa')}">
															<div class="alert alert-warning fade in">
																<a href="#" class="close" data-dismiss="alert">&times;</a>
																<p>${message}</p>
															</div>

															</c:if>
															<c:if test="${fn:contains(message, 'Sucesso')}">
																<div class="alert alert-info fade in">
																	<a href="#" class="close" data-dismiss="alert">&times;</a>
																	<p>${message}</p>
																</div>	
														</c:if>
													</div>
												</c:if>
										</div>	
									<form class="form-horizontal form-label-left"
										data-toggle="validator" method="post" action="buscavisita">
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Cidade </label> <select name="txtpesquisa3"
												title="Selecione uma op????o"
												class="form-control input-md selectpicker">
												<c:forEach var="combocidade" items="${listacidade}">
													<option>${combocidade.nome_cidade}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Bairro </label> <select name="txtpesquisa2"
												title="Selecione uma op????o"
												class="form-control input-md selectpicker"
												data-live-search="true">
												<c:forEach var="combobairro" items="${listabairro}">
													<option>${combobairro.nome_bairro}</option>
												</c:forEach>
											</select>
										</div>	
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Rua </label> <input type="text" name="txtpesquisa6"
												class="form-control input-md">
										</div>
										<div class="form-group  col-lg-1 col-xs-12">
											<label>Quadra </label> <input type="text" name="txtpesquisa7"
												class="form-control input-md">
										</div>
										<div class="form-group  col-lg-1 col-xs-12">
											<label>Lote </label> <input type="text" name="txtpesquisa8"
												class="form-control input-md">
										</div>
										<div class="form-group  col-lg-1 col-xs-12">
											<label>N?? </label> <input type="text" name="txtpesquisa9"
												class="form-control input-md">
										</div>								
										
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Tipo de Imovel </label> <select name="txtpesquisa4"
												title="Selecione uma op????o"
												class="form-control input-md selectpicker">
												<c:forEach var="combotipoimovel" items="${listaimovel}">
													<option>${combotipoimovel.nome_tpimovel}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Estagio</label> <select name="txtpesquisa5"
												title="Selecione uma op????o"
												class="form-control input-md selectpicker">
												<option>N??o encontrado</option>												
												<c:forEach var="comboestagio" items="${listaestagio}">
													<option>${comboestagio.nome_estagio}</option>
												</c:forEach>
											</select>
										</div>										
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Situa????o do Imovel </label>
											<select name="txtpesquisa10"
												title="Selecione uma op????o"
												class="form-control input-md selectpicker">												
												<option value="Visitado">Visitado</option>
												<option value="Fechado">Fechado</option>												
												<option value="Recusado">Recusado</option>
																								
											</select>
										</div>
										<div class="form-group  col-lg-3 col-xs-12">
											<label>Agente </label> <input type="text" name="txtpesquisa1"
												class="form-control input-md">
										</div>										
										<div class="x_content">
																																																	
											<p class="text-muted font-13 m-b-30">
												<a href="visita">
													<button type="button" class="btn btn-success"
														data-container="body" data-toggle="popover"
														data-placement="bottom" title="Incluir Nova Visita">
														<i class="fa fa-plus-circle"></i>
													</button>
												</a> <a href="buscavisita">
													<button type="button" class="btn btn-primary"
														data-container="body" data-toggle="popover"
														data-placement="bottom" title="Limpar Listagem">
														<i class="fa fa-refresh"></i>
													</button>
												</a>
												<button type="submit" class="btn btn-info"
													data-container="body" data-toggle="popover"
													data-placement="bottom" title="Buscar">
													<i class="fa fa-search"></i>
												</button>
											</p>
										</div>
									</form>
								
								</div>
							</div>
						</div>
						
						 <div class="col-md-12 col-sm-12 col-xs-12">
			                <div class="x_panel">
			                  <div class="x_title">
			                    <small>Registros encontrados</small>
			                    <ul class="nav navbar-right panel_toolbox">
			                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
			                      </li>	
			                    </ul>
			                    <div class="clearfix"></div>
			                  </div>
			                  <div class="x_content">
			                  <div>
												<!--<div class="ln_solid"></div>  -->
												<table
													class="table footable toggle-circle-filled table-striped  table-hover"
													data-sorting="true" data-show-toggle="true">
													<thead>
														<tr>
																													
															<th data-breakpoints="xs">Data da Visita</th>
															<th data-breakpoints="xs">Situa????o</th>
															<th>Cidade</th>
															<th data-breakpoints="xs">Bairro</th>
															<th data-breakpoints="all">Rua</th>
															<th data-breakpoints="all">Quadra</th>
															<th data-breakpoints="all">Lote</th>															
															<th data-breakpoints="all">Tipo de Imovel</th>
															<th data-breakpoints="all">Estagio</th>
															<th data-breakpoints="all">Agente</th>															
															<th>A????es</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="visita" items="${listavisita}">
															<tr>
																																															
																<td><fmt:formatDate value="${visita.data_visita}"
																		type="both" pattern="dd/MM/yyyy HH:mm"
																		dateStyle="full" /></td>
																<td>${visita.status}</td>
																<td>${visita.cidade}</td>
																<td>${visita.bairro}</td>
																<td>${visita.rua}</td>
																<td>${visita.quadra}</td>
																<td>${visita.lote}</td>
																<td>${visita.tp_imovel}</td>
																<td>${visita.estagio}</td>																																																
																<td>${visita.agente}</td>																	

																<td><div class="btn-group">
																		<button type="button"
																			class="btn dropdown-toggle btn btn-info btn-sm"
																			data-toggle="dropdown">
																			Op????es <span class="caret"></span>
																		</button>
																		<ul class="dropdown-menu">
																			<li><a
																				href="buscavisita?acao=Consultar&idvisita=${visita.idvisita}"><span
																					class="glyphicon glyphicon-edit"></span> Editar</a></li>
																			<li><a
																				onclick="confirmaexclusao(${visita.idvisita})"><span
																					class="glyphicon glyphicon-remove-sign"></span>
																					Excluir</a></li>
																			<!--<li><a data-target="#visualizar"
																				data-toggle="modal"><span
																					class="glyphicon glyphicon-globe"></span>
																					Visualizar no Mapa</a></li>  -->
																		</ul>
																	</div></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
				                  </div>
			                </div>
             			 </div>
						
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
	<!-- Footable-->
	<script src="vendors/moment/min/moment.min.js"></script>
	<script src="js/footable.js"></script>
	<!-- Bootstrap Dialog -->
	<script src="js/bootstrap-dialog.min.js"></script>
	<!-- Slider -->
	<script src="vendors/bootstrap-switch-master/dist/js/bootstrap-switch.min.js"></script>

	<script type="text/javascript">
	// Instanciar Footable
		$(document).ready(function () {
		//$(function () {
			$('.footable').footable({			
				"paging": {
					"enabled": true,											
					"position": "center",
					"limit": 1,
					"size": 8,
					"countFormat": "Registros {PF} a {PL} de {TR} resultados"
				}
			});
		});
		
	// Fun????o de Exclus??o
    function confirmaexclusao(id) {		
        BootstrapDialog.confirm({
        		title: 'Confirma????o',
                type: BootstrapDialog.TYPE_PRIMARY,	
                size: BootstrapDialog.SIZE_SMALL,
                message: 'Deseja remover o registro',
                btnCancelLabel: 'Cancelar',                
                callback: function(resposta){
	            	 if (resposta) {
	    	     	    window.location.href = "buscavisita?acao=Excluir&idvisita="+id;
	    	     	}   	
                }        		           
       	});
    }
    	     
    </script>
	<c:import url="rodape.jsp" />
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:forward page="index.jsp"></jsp:forward>
</c:otherwise>
</c:choose>
