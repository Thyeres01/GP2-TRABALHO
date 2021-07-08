<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<!-- bootstrap-daterangepicker -->
<link href="vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="css/custom.min.css" rel="stylesheet">

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
									<h2>Notificação</h2>
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
										data-toggle="validator" method="post" action="notificacao">
										<p>
											Atenção aos campos requeridos
											<code>*</code>
										</p>
										<!-- <span class="section">Dados do Agente</span>-->
										<!--IDbanco Input-->
										<div class="form-group">
											<div class="col-md-2 col-xs-12">
												<input type="hidden" readonly="readonly" type="text"
													id="idnotificacao" name="idnotificacao"
													value="${notificacao.idnotificacao}"
													class="form-control input-md">
											</div>
										</div>
										<!--Data_notificacao Input-->
										<div class="form-group">
											<label class="control-label col-md-3" for="data">Data
												da Denúncia <span class="required">*</span>
											</label>
											<div class="col-lg-2 col-xs-12">
												<c:if test = "${notificacao.data_notificacao!=null}">
                                      				<input type="text"id="data_notificacao" name="data_notificacao" readonly="readonly" value="<fmt:formatDate value="${notificacao.data_notificacao}" pattern="dd/MM/yyyy HH:mm"/>" required="required" class="form-control input-md">                                        
                                      			</c:if>
                                      			<c:if test = "${notificacao.data_notificacao==null}">
                                    				<input type="text" id="data_notificacao" name="data_notificacao" readonly="readonly" value="${data_notificacao}"  required="required" class="form-control input-md">
                                    			</c:if>
												<!-- <input type="text" id="data_notificacao" name="data_notificacao"
													value="<fmt:formatDate value="${notificacao.data_notificacao}" pattern="dd/MM/yyyy HH:mm:ss"/>"
													required="required" class="form-control input-md">
													<div class="help-block with-errors"></div>
												 -->
											</div>
										</div>									
										<!--Rua Input-->
										<div class="form-group">
											<label class="control-label col-md-3" for="rua">Rua <span
												class="required">*</span></label>
											<div class="col-lg-5 col-xs-12">
												<input type="text" id="rua" name="rua" required="required"
													class="form-control input-md" value="${notificacao.rua}">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<!--Quadra Lote Numero Input-->
										<div class="form-group">
											<label class="control-label col-md-3" for="quadra">Quadra
											<span class="required">*</span></label>
											<div class="col-lg-1 col-xs-12">
												<input type="text" id="quadra" name="quadra" required="required"
													class="form-control input-md" value="${notificacao.quadra}">
													<div class="help-block with-errors"></div>
											</div>
											<label class="control-label col-md-1" for="lote">Lote
											<span class="required">*</span></label>
											<div class="col-lg-1 col-xs-12">
												<input type="text" id="lote" name="lote" required="required"
													class="form-control input-md" value="${notificacao.lote}">
													<div class="help-block with-errors"></div>
											</div>
											<label class="control-label col-md-1" for="numero">Nº
											<span class="required">*</span></label>
											<div class="col-lg-1 col-xs-12">
												<input type="text" id="numero" name="numero" required="required"
													class="form-control input-md" value="${notificacao.numero}">
													<div class="help-block with-errors"></div>
											</div>
										</div>
										 <!--Complemento Input-->
	                                    <div class="form-group">
	                                      <label class="control-label col-md-3">Complemento</label>
	                                      <div class="col-lg-3 col-xs-12">
	                                        <input type="text" id="complemento" name="complemento" value="${notificacao.complemento}" class="form-control input-md">
	                                        <div class="help-block with-errors"></div>
	                                      </div>
	                                    </div>     
											<!--Cidade select-->
										<div class="form-group">
											<label class="control-label col-md-3" for="cidade">Cidade
												<span class="required">*</span>
											</label>
											<div class="col-lg-3 col-xs-12">
												<select required id="cidade" name="cidade"
													title="Selecione item"
													class="form-control input-md selectpicker"
													data-live-search="true">
													 <c:if test = "${not empty notificacao.cidade}">											
                                					 	<option selected="selected">${notificacao.cidade}</option>
                              						 </c:if>										
													 <c:forEach var="combocidade" items="${listacidade}">      
						      							<option>${combocidade.nome_cidade}</option>      
													 </c:forEach> 
												</select>
												<div class="help-block with-errors"></div>
											</div>
										</div> 
										<!--Bairro Input-->										
											<div class="form-group">
											<label class="control-label col-md-3" for="bairro">Bairro
												<span class="required">*</span>
											</label>
											<div class="col-lg-3 col-xs-12">
												<select required id="bairro" name="bairro"
													title="Selecione item"
													class="form-control input-md selectpicker"
													data-live-search="true">
													 <c:if test = "${not empty notificacao.bairro}">											
                                					 	<option selected="selected">${notificacao.bairro}</option>
                              						 </c:if>										
													 <c:forEach var="combobairro" items="${listabairro}">      
						      							<option>${combobairro.nome_bairro}</option>      
													 </c:forEach> 
												</select>
												<div class="help-block with-errors"></div>
											</div>
										</div>																				
									                   			
										<!--Tipo_Imovel select-->
										<div class="form-group">
											<label class="control-label col-md-3" for="imovel">Tipo
												do Imovel <span class="required">*</span>
											</label>
											<div class="col-lg-3 col-xs-12">
												<select required id="tp_imovel" name="tp_imovel"
													title="Selecione item"
													class="form-control input-md selectpicker"
													data-live-search="true">
													<c:if test = "${not empty notificacao.tp_imovel}">											
                                						<option selected="selected">${notificacao.tp_imovel}</option>
                              						</c:if>
													<c:forEach var="combotipoimovel" items="${listaimovel}">      
						      							<option>${combotipoimovel.nome_tpimovel}</option>      
													</c:forEach> 
												</select>
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<!--Descrição Input-->

										<div class="form-group">
											<label class="control-label col-md-3" for="notificacao">Descrição
												da Notificação
											</label>
											<div class="col-lg-6 col-xs-12">
												<textarea id="desc_notificacao" name="desc_notificacao"
													class="form-control">${notificacao.desc_notificacao}</textarea>
												<div class="help-block with-errors"></div>
											</div>
										</div>

										<!--Botões-->
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-md-offset-3">
												<button id="send" type="submit" class="btn btn-info">Gravar</button>
												<button type="reset" class="btn btn-warning">Limpar</button>
											</div>
										</div>
									</form>
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
    <!-- FastClick -->
    <script src="vendors/fastclick/lib/fastclick.js"></script> 
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
     <!-- bootstrap-VALIDATOR -->
    <script src="js/validator.min.js"></script>
    <script>	 
       /* $(function() {
        $('input[name="data_notificacao"]').daterangepicker({            
	    singleDatePicker: true,
            singleDatePicker: true,
            timePicker: true,
            timePickerIncrement: 1,
            showMeridian:false,
            timePicker24Hour:true,
            locale: {
                format: 'DD/MM/YYYY HH:mm'
            }
        });
    });*/
    </script>
	<c:import url="rodape.jsp" />
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:forward page="index.jsp"></jsp:forward>
</c:otherwise>
</c:choose>
