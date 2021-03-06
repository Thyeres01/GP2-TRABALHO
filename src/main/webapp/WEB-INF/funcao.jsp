<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn"%>

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
<link href="css/custom.min.css" rel="stylesheet">
<!-- Footable -->
<link href="css/footable.standalone.min.css" rel="stylesheet">
<!-- BootstrapDialog -->
<link href="css/bootstrap-dialog.min.css" rel="stylesheet">
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<c:import url="menu.jsp" />
			<!-- page content -->
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="row tile_count"></div>
				<!-- /top tiles -->
				<div class="row">
					<br />
					<div class="row">
						<!-- Start to do list -->
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Função</h2>
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
										data-toggle="validator" method="post" action="tipofuncao">
										<p>
											Atenção aos campos requeridos
											<code>*</code>
										</p>
										<!--IDbanco Input-->
										<div class="form-group">
											<div class="col-md-2 col-xs-12">
												<input type="hidden" readonly type="text" 
												id="idfuncao" name="idfuncao" value="${funcoes.idfuncao}" 												 
												class="form-control input-md">
											</div>
										</div>
										<!--Funcao Input-->
										<div class="form-group">
											<label class="control-label col-md-3">Nome
												<span class="required">*</span>
											</label>
											<div class="col-lg-6 col-xs-12">
												<input type="text" id="nome_funcao" name="nome_funcao"
													 placeholder="ex: Agente" value="${funcoes.nome_funcao}" 
													required="required" class="form-control input-md">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<!--Botões-->
										<div class="form-group">
											<div class="col-md-6 col-md-offset-3">
												<button id="send" type="submit" class="btn btn-info">Gravar</button>
												<button type="reset" class="btn btn-warning">Limpar</button>
											</div>
										</div>
										<c:if test="${not empty message}">
										<label class="control-label col-md-3"></label>
											<div class="col-lg-6 col-xs-12">
											<c:if test="${fn:containsIgnoreCase(message, 'Erro')}">
													<div class="alert alert-danger fade in">
													<a href="#" class="close" data-dismiss="alert">&times;</a>
														<p>${message}</p>
													</div>
											</c:if>
											<c:if test="${fn:containsIgnoreCase(message, 'Sucesso')}">
													<div class="alert alert-info fade in">
													<a href="#" class="close" data-dismiss="alert">&times;</a>
														<p>${message}</p>
													</div>
											</c:if>
											</div>
										</c:if>
									</form>
								</div>
							</div>
						</div>

						<!-- Busca Funcao -->
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Funcões Cadastradas</h2>
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
										data-toggle="validator" method="get" action="buscatipofuncao">
										<div class="form-group">
											<label class="control-label col-md-3"></label>
											<div class="input-group col-lg-6 col-xs-12">
												<input type="text" name="txtpesquisa1"
													class="form-control input-md" placeholder="Buscar Função">
												<div class="input-group-btn">
														<button type="submit" class="btn btn-primary"
															data-container="body" data-toggle="popover"
															data-placement="bottom" title="Buscar">
															<i class="fa fa-search"></i>
														</button>
												</div>
											</div>
										</div>
										<div>
											<table id="table"
												class="table footable toggle-circle-filled table-striped  table-hover"
												data-sorting="true" data-show-toggle="true">
												<thead>
													<tr>
														<th>Função</th>
														<th>Ações</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="funcoes" items="${listafuncoes}">
														<tr>
															<td>${funcoes.nome_funcao}</td>
															<td>
																<div class="btn-group">
																	<button type="submit"
																		class="btn dropdown-toggle btn btn-info btn-sm"
																		data-toggle="dropdown">
																		Opções <span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<li><a
																			href="buscatipofuncao?acao=Consultar&idfuncao=${funcoes.idfuncao}"><span
																				class="glyphicon glyphicon-edit"></span> Editar</a></li>
																		<li><a
																			onclick="confirmaexclusao(${funcoes.idfuncao})"><span
																				class="glyphicon glyphicon-remove-sign"></span>
																				Excluir</a></li>
																	</ul>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</form>
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
		<!-- bootstrap-VALIDATOR -->
		<script src="js/validator.min.js"></script>
		<!-- Footable-->
		<script src="vendors/moment/min/moment.min.js"></script>
		<script src="js/footable.js"></script>
		<!-- Bootstrap Dialog -->
		<script src="js/bootstrap-dialog.min.js"></script>
		<script>
  
	//Instanciar Footable
		$(document).ready(function () {
		//$(function () {
			$('.footable').footable({			
				"paging": {
					"enabled": true,											
					"position": "left",
					"limit": 3,
					"size": 8,
					"countFormat": "Registros {PF} a {PL} de {TR} resultados"
				}
			});
		});
	    function confirmaexclusao(id) {
	    	BootstrapDialog.confirm({
	    		title: 'Confirmação',
	            type: BootstrapDialog.TYPE_PRIMARY,	
	            size: BootstrapDialog.SIZE_SMALL,
	            message: 'Deseja remover o registro?',
	            btnCancelLabel: 'Cancelar',                
	            callback: function(resposta){
	            	 if (resposta) {
	   	   	          window.location.href = "buscatipofuncao?acao=Excluir&idfuncao="+id;
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

