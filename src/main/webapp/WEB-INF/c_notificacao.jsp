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
										Notificações <small>Endemic Sys</small>
									</h2>
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
										data-toggle="validator" method="post" action="buscanotificacao">										
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
										<div class="form-group  col-lg-4 col-xs-12">
											<label>Bairro </label> <select name="txtpesquisa1"
												title="Selecione uma opção"
												class="form-control input-md selectpicker"
												data-live-search="true">
												<c:forEach var="combobairro" items="${listabairro}">
													<option>${combobairro.nome_bairro}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group  col-lg-4 col-xs-12">
											<label>Cidade </label> <select name="txtpesquisa2"
												title="Selecione uma opção"
												class="form-control input-md selectpicker"
												data-live-search="true">
												<c:forEach var="combocidade" items="${listacidade}">
													<option>${combocidade.nome_cidade}</option>
												</c:forEach>
											</select>
										</div>

										<div class="form-group  col-lg-4 col-xs-12">
											<label>Tipo de Imovel </label> <select name="txtpesquisa3"
												title="Selecione uma opção"
												class="form-control input-md selectpicker"
												data-live-search="true">
												<c:forEach var="combotipoimovel" items="${listaimovel}">
													<option>${combotipoimovel.nome_tpimovel}</option>
												</c:forEach>
											</select>
										</div>
										<!--
										
											<input id="txtpesquisa4" name="txtpesquisa4" type="checkbox" checked="checked" data-size="small"
											data-on-text="Visitados" data-off-text="A Visitar">
																						
											<input type="checkbox" id="txtpesquisa4" name="txtpesquisa4" class="flat">
											<label>Verificado</label>
											<input id="txtpesquisa4" name="txtpesquisa4" data-size="small" unchecked data-toggle="toggle" data-on="Verificado" data-off="Não Verificado" 
											data-onstyle="primary" type="checkbox">	
																																	
										 -->																				
										<div class="x_content">
											
											<div class="pull-right">
												<input id="txtpesquisa4" name="txtpesquisa4" type="checkbox" checked="checked" data-size="normal"
												data-on-text="Sim" data-off-text="Não">
												<div class="help">Visitados</div>
												
											</div>
											<p class="text-muted font-13 m-b-30">
												<%if (session.getAttribute("funcao").equals("Atendente") || session.getAttribute("funcao").equals("Administrador")){%>
												<a href="notificacao">
													<button type="button" class="btn btn-success"
														data-container="body" data-toggle="popover"
														data-placement="bottom" title="Incluir Nova Notificação">
														<i class="fa fa-plus-circle"></i>
													</button>
												</a>
												<%}%> 
												<a href="buscanotificacao">
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
												<label> </label>
												
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
			                      <li><a class="close-link"><i class="fa fa-close"></i></a>
			                      </li>
			                    </ul>
			                    <div class="clearfix"></div>
			                  </div>
			                  <div class="x_content">																			
											<div>
												<table id="table"
													class="table footable toggle-circle-filled table-striped  table-hover"
													data-sorting="true" data-show-toggle="true">
													<thead>
														<tr>
															<!-- <th data-breakpoints="xs">Status</th>   -->
															<th data-breakpoints="xs">Data da Notificação</th>
															<th data-breakpoints="xs">Data da Visita</th>
															<th>Cidade</th>
															<th data-breakpoints="xs">Bairro</th>
															<th data-breakpoints="all">Tipo de imovel</th>
															<th data-breakpoints="all">Rua</th>
															<th data-breakpoints="all">Quadra</th>
															<th data-breakpoints="all">Lote</th>
															<th data-breakpoints="all">Numero</th>
															<th data-breakpoints="all">Descrição da Notificação</th>
															<th>Ações</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="notificacao" items="${listanotificacao}">
															<tr>
																<!--<td>
																<input type="checkbox" id="check" class="flat">
																</td>-->
																
																<td><fmt:formatDate
																		value="${notificacao.data_notificacao}" type="both"
																		pattern="dd/MM/yyyy HH:mm" dateStyle="full" /></td>
																<td><fmt:formatDate
																		value="${notificacao.data_visita}" type="both"
																		pattern="dd/MM/yyyy HH:mm" dateStyle="full" /></td>
																<td>${notificacao.cidade}</td>
																<td>${notificacao.bairro}</td>
																<td>${notificacao.tp_imovel}</td>
																<td>${notificacao.rua}</td>
																<td>${notificacao.quadra}</td>
																<td>${notificacao.lote	}</td>
																<td>${notificacao.numero}</td>
																<td>${notificacao.desc_notificacao}</td>
																<td><div class="btn-group">
																		<button type="button"
																			class="btn dropdown-toggle btn btn-info btn-sm"
																			data-toggle="dropdown">
																			Opções <span class="caret"></span>
																		</button>
																		<ul class="dropdown-menu">																																																												
																				
																				 <%if (session.getAttribute("funcao").equals("Atendente") || session.getAttribute("funcao").equals("Administrador")){%>
																					 <li><a		
																					 href="buscanotificacao?acao=Consultar&idnotificacao=${notificacao.idnotificacao}"><span
																					class="glyphicon glyphicon-edit"></span> Editar</a></li>			
																				 <%}%>
																				
																				 <%if (session.getAttribute("funcao").equals("Agente") || session.getAttribute("funcao").equals("Administrador")){%>
																					 <li><a		
																					 href="envianotificacao?acao=Verificar&idnotificacao=${notificacao.idnotificacao}"><span
																					class="glyphicon glyphicon-edit"></span> Verificar</a></li>			
																				 <%}%>
																			 	
																			 	<%if (session.getAttribute("funcao").equals("Atendente") || session.getAttribute("funcao").equals("Administrador")){%>
													 
																					 <li><a
																						onclick="confirmaexclusao(${notificacao.idnotificacao})"><span
																						class="glyphicon glyphicon-remove-sign"></span>	Excluir</a></li>
																																											
																				<%}%>
																				
																		</ul>
																	</div></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>			                  </div>
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
	<!--Icheck-->
	<script src="vendors/iCheck/icheck.min.js"></script>
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

		// Função de Exclusão
		    function confirmaexclusao(id) {
		    	BootstrapDialog.confirm({
		    		title: 'Confirmação',
		            type: BootstrapDialog.TYPE_PRIMARY,	
		            size: BootstrapDialog.SIZE_SMALL,
		            message: 'Deseja remover o registro?',
		            btnCancelLabel: 'Cancelar',                
		            callback: function(resposta){
		            	 if (resposta) {
				   	          window.location.href = "buscanotificacao?acao=Excluir&idnotificacao="+id;
		    	     	}   	
		            }        		           
		   		});
		   	}	
		// Switxh
		$("[name='txtpesquisa4']").bootstrapSwitch();
		</script>
	<c:import url="rodape.jsp" />
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:forward page="index.jsp"></jsp:forward>
</c:otherwise>
</c:choose>
