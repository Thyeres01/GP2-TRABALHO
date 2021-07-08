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

 	<!-- iCheck -->
	<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap select -->
  	<link href="css/bootstrap-select.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">    
    <!-- bootstrap-daterangepicker -->
    <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="vendors/switchery/switchery.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
    <!-- Switch -->
    <link href="vendors/bootstrap-switch-master/dist/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
    	       
     
  </head>
  <c:choose>         
         <c:when test="${empty visita.latitude && empty visita.longitude}">
     		<body onload="getLocation()" class="nav-md">       
         </c:when>
         <c:otherwise>
            <body class="nav-md">
         </c:otherwise>
  </c:choose>
    <div class="container body">
      <div class="main_container">
  		<c:import url="menu.jsp" /> 
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
           <div class="row tile_count">
          </div>
          <!-- /top tiles -->

          <div class="row">             
          <br />		    
              <div class="row">			  
                <!-- Start to do list -->
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Visita <small>Dados do Imovel</small></h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                   <form class="form-horizontal form-label-left" data-toggle="validator" method="post" action="visita">				 
                            <p>Atenção aos campos requeridos<code>*</code></p>
                                    <!-- <span class="section">Dados do Agente</span>-->		
                                    			  
	                           <!--IDbanco Input-->
	                              <div class="form-group">
	                                    <div class="col-md-2 col-xs-12">
	                                        <input  type="hidden" readonly="readonly" type="text" id="idvisita" name="idvisita" value="${visita.idvisita}" class="form-control input-md">
	                                    </div>
	                              </div>
                               <!--IDnotificação-->
	                              <div class="form-group">
	                                    <div class="col-md-2 col-xs-12">
	                                        <input  type="hidden" readonly="readonly" type="text" id="idnotificacao" name="idnotificacao" value="${visita.idnotificacao}" class="form-control input-md">
	                                    </div>
	                              </div>                                 
                               <!--Situação Input-->                                										
									<div class="form-group">
									<label class="control-label col-md-3"></label>
									<div class="col-lg-3 col-xs-12">																		
					                      <p>					                        
					                       <c:if test = "${visita.status==null}">
					                        <input type="radio" class="flat" name="status" readonly="readonly" id="recusado" value="Recusado" required /> Recusado
					                        <input type="radio" class="flat" name="status" readonly="readonly" id="fechado" value="Fechado" /> Fechado
					                        <input type="radio" class="flat" name="status" readonly="readonly" id="visitado" value="Visitado" /> Visitado					                      
					                       </c:if>
					                       <c:if test = "${visita.status!=null}">
					                        <c:if test = "${visita.status=='Recusado'}">
					                        	<input type="radio" class="flat" name="status" id="recusado" checked value="Recusado" required /> Recusado
					                        </c:if>
					                        <c:if test = "${visita.status=='Fechado'}">
					                        	<input type="radio" class="flat" name="status" id="fechado" checked value="Fechado" /> Fechado
					                        </c:if>
					                        <c:if test = "${visita.status=='Visitado'}">
					                        	<input type="radio" class="flat" name="status" id="visitado" checked value="Visitado" /> Visitado
					                        </c:if>					                      
					                       </c:if>
					                       </p>
											<div class="help-block with-errors"></div>
										</div>
									</div>
                                 
                          <!--Nome Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="agente">Agente <span class="required">*</span></label>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="text"   id="agente" readonly="readonly" name="agente" value="${visita.agente}" placeholder="ex: Joao da Silva" required="required" class="form-control input-md">                                        
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                          <!--data Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="data_visita">Data da visita <span class="required">*</span></label>
                                      <div class="col-lg-2 col-xs-12">
                                      <c:if test = "${visita.data_visita!=null}">
                                      		<input type="text" id="data_visita" readonly="readonly" name="data_visita" value="<fmt:formatDate value="${visita.data_visita}" pattern="dd/MM/yyyy HH:mm"/>" required="required" class="form-control input-md">                                        
                                      </c:if>
                                      <c:if test = "${visita.data_visita==null}">
                                    		<input type="text" id="data_visita" readonly="readonly" name="data_visita" value="${data_visita}"  required="required" class="form-control input-md">
                                      </c:if>
                                      	<div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                                    
                        <!--Rua Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="rua">Rua <span class="required">*</span></label>
                                      <div class="col-lg-5 col-xs-12">
                                        <input type="text" id="rua" name="rua" value="${visita.rua}"required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>
                          <!--Quadra Lote Numero Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3" for="quadra">Quadra <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="quadra" name="quadra" value="${visita.quadra}" required="required" class="form-control input-md">                                                                                
                                        <div class="help-block with-errors"></div>
                                      </div>
                                      <label class="control-label col-md-1" for="lote">Lote <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="lote" name="lote" value="${visita.lote}" required="required" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                      <label class="control-label col-md-1" for="numero">Nº <span class="required">*</span></label>
                                      <div class="col-lg-1 col-xs-12">
                                        <input type="text" id="numero" name="numero" value="${visita.numero}" required="required" class="form-control input-md" 
                                        data-error="Preencha este campo">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div> 
                                 <!--Complemento Input-->
                                    <div class="form-group">
                                      <label class="control-label col-md-3">Complemento</label>
                                      <div class="col-lg-3 col-xs-12">
                                        <input type="text" id="complemento" name="complemento" value="${visita.complemento}" class="form-control input-md">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>           
                                <!--Cidade select-->
		                          <div class="form-group">
		                          <label class="control-label col-md-3" for="cidade">Cidade <span class="required">*</span></label>
		                            <div class="col-lg-3 col-xs-12">
		                            <select required data-size="5" id="cidade" name="cidade" title="Selecione item" class="form-control input-md selectpicker" data-live-search="true">
		                              <c:if test = "${not empty visita.cidade}">											
		                                <option selected="selected">${visita.cidade}</option>
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
										<select required data-size="5" id="bairro" name="bairro"
											title="Selecione item"
											class="form-control input-md selectpicker"
											data-live-search="true">
											 <c:if test = "${not empty visita.bairro}">											
                              					 	<option selected="selected">${visita.bairro}</option>
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
		                          <label class="control-label col-md-3" for="tipo">Tipo do Imovel <span class="required">*</span></label>
		                            <div class="col-lg-3 col-xs-12">
		                            <select required data-size="5" id="tp_imovel" name="tp_imovel"  title="Selecione item" class="form-control input-md selectpicker">
		                             <c:if test = "${not empty visita.tp_imovel}">											
		                                <option selected="selected">${visita.tp_imovel}</option>
		                              </c:if>                               
		                              <c:forEach var="combotipoimovel" items="${listaimovel}">      
								     	<option>${combotipoimovel.nome_tpimovel}</option>      
									  </c:forEach>
		                            </select>
		                            <div class="help-block with-errors"></div>
		                            </div>
		                          </div>		                   
                        <!--Coordenadas-->                                                                       
                                    <div class="form-group">                                    
                                      <!-- <label class="control-label col-md-3">Coordenadas <span class="required">*</span></label>  -->
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="hidden" id="latitude"  readonly="readonly" name="latitude" value="${visita.latitude}" required="required" class="form-control input-md">
                                      </div>
                                      <div class="col-lg-2 col-xs-12">
                                        <input type="hidden" id="longitude"  readonly="readonly" name="longitude" value="${visita.longitude}" required="required" class="form-control input-md">
                                      </div>                
                                     </div>                                          
	                                 <div class="form-group">
                                    	<label class="control-label col-md-3"></label>
                                      	<div class="col-lg-6 col-xs-12">
                                        <h4><p id="msgerro"></p></h4>                                      				
										</div>      				    														
									</div>										
					                          
                          <div class="x_title">
		                      <h2>Visita<small>Dados da Visita</small></h2>
		                      <ul class="nav navbar-right panel_toolbox">		                       		                        
		                      </ul>
		                      <div class="clearfix"></div>		                      
		                   </div>
		                   <br>		                   
                           <!--Switcher
                   				 	 <div class="form-group">
                     				 	 <label class="control-label col-md-3"> Foco de Infestação                           					
                        				 </label>
                        				 <div class="col-lg-3 col-xs-12">
                        					  <input type="checkbox" class="js-switch" /> 
                        				  </div>
                       				 </div>
                         		     <div class="ln_solid"></div>-->                                    
                        
                        <!--Estagio select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="estagio">Estagio do Ciclo </label>
                            <div class="col-lg-3 col-xs-12">
                            <select multiple data-size="5" data-actions-box="true"  id="estagio" name="estagio" title="Selecione item(s)" class="form-control input-md selectpicker">
                              <c:if test = "${not empty visita.estagio}">
                              	<option selected="selected">${visita.estagio}</option>
    		    			  </c:if>	
                              <c:forEach var="comboestagio" items="${listaestagio}">      
						     	<option>${comboestagio.nome_estagio}</option>      
							  </c:forEach>							  
                            </select>
                            </div>
                          </div>
                          <!--Coleta-->
                          <div class="form-group">                          
                          <label class="control-label col-md-3" for="quant_larvicida">Coleta de Amostras</label>
                            <div class="col-lg-1 col-xs-12">
                             <input type="tel" id="n_ini" name="n_ini" value="${visita.n_ini}" class="form-control input-md">                            
                             <div class="help">Nº Inicial</div>
                            </div>
                            <label class="control-label col-md-1"></label>
                             <div class="col-lg-1 col-xs-12">                              
                             <input type="tel" id="n_fim" name="n_fim" value="${visita.n_fim}" class="form-control input-md">
                             <div class="help">Nº Final</div>                             
                            </div>
                            <label class="control-label col-md-1"></label>
                             <div class="col-lg-1 col-xs-12">                              
                             <input type="tel" id="n_tubitos" name="n_tubitos" value="${visita.n_tubitos}" class="form-control input-md">
                             <div class="help">Quantidade de Tubitos</div>                             
                            </div>
                          </div>
                          <!--Tratamento select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="tp_larvicida">Tratamento Local </label>
                            <div class="col-lg-3 col-xs-12">
                            <select multiple data-size="5"  id="tp_larvicida" name="tp_larvicida" title="Selecione item(s)" class="form-control input-md selectpicker">
                              <c:if test = "${not empty visita.tp_larvicida}">											
                                <option selected="selected">${visita.tp_larvicida}</option>
                              </c:if>
                              <c:forEach var="combotratamento" items="${listatratamento}">      
						     	<option data-subtext="${combotratamento.tp_tratamento}">${combotratamento.nome_tratamento}</option>     
							  </c:forEach>
                            </select>
                            </div>
                          </div>
                             <!--Quantidade Larvicida select-->
                          <div class="form-group">
                          <label class="control-label col-md-3" for="quant_larvicida">Quantidade Usada (g)</label>
                            <div class="col-lg-1 col-xs-12">
                             <input type="tel" id="qt_larv1" name="qt_larv1" value="${visita.qt_larv1}" class="form-control input-md">
                             <div class="help">Larvicida 1</div>
                             </div>
                             <label class="control-label col-md-1"></label>                                                    
                             <div class="col-lg-1 col-xs-12">
                             <input type="tel" id="qt_larv2" name="qt_larv2" value="${visita.qt_larv2}" class="form-control input-md">
                             <div class="help">Larvicida 2</div>                             
                            </div>
                          </div>
                          <!--Quantidade Adulticida select-->
                          <div class="form-group">                          
                          <label class="control-label col-md-3" for="quant_larvicida">Quantidade Usada (carga)</label>
                            <div class="col-lg-1 col-xs-12">
                             <input type="tel" id="qt_adult1" name="qt_adult1" value="${visita.qt_adult1}" class="form-control input-md">                            
                             <div class="help">Adulticida 1</div>
                            </div>
                            <label class="control-label col-md-1"></label>
                             <div class="col-lg-1 col-xs-12">                              
                             <input type="tel" id="qt_adult2" name="qt_adult2" value="${visita.qt_adult2}" class="form-control input-md">
                             <div class="help">Adulticida 2</div>                             
                            </div>
                          </div>
                         <!-- Focos tratadosDepositos -->    
                          <div class="form-group">
                          <label class="control-label col-md-3" for="quant_larvicida">Focos tratados</label>
                            <div class="col-lg-1 col-xs-12">
                             <input type="tel" id="qt_focostratados" name="qt_focostratados" value="${visita.qt_focostratados}" class="form-control input-md">
                             <div class="help">Total</div>                             
                             
                             </div>                             
                          </div> 
			  			 <!-- Depositos -->
  							<div class="form-group">
                               <label class="control-label col-md-3">Depositos(s) </label>
                            </div>
                            <!--item 1--> 
                            
                            <div class="form-group">
                               <label class="control-label col-md-3"></label>                            
                               <div class="col-lg-2 col-xs-6">
	                   				<c:if test = "${visita.dp1==1}">
	                   					<input id="c1" name="c1" type="checkbox" data-size="normal" checked data-on-text="Sim" data-off-text="Não">                          
	                                </c:if>
	                                <c:if test = "${visita.dp1==0}">
	                                 	<input id="c1" name="c1" type="checkbox" data-size="normal" data-on-text="Sim" data-off-text="Não">                          
	                                </c:if> 
                                 <div class="help">Caixa d'Água</div>                                    
                               </div>
								<div class="col-lg-1">                                
	  								<input id="qt1" name="qt1" type="tel" size="5" value="${visita.qt1}" class="form-control input-md">
	  							
                                 	<div class="help">Quantidade</div>
                               </div>
                             </div>
							<!--item 2-->	
                             <div class="form-group">
                              <label class="control-label col-md-3"></label>
	                              	 <div class="col-lg-2 col-xs-6">
	                   				<c:if test = "${visita.dp2==1}">                   				
	                   					<input id="c2" name="c2" type="checkbox" data-size="normal" checked data-on-text="Sim" data-off-text="Não">                          
	                   				</c:if>
	                   				<c:if test = "${visita.dp2==0}">
	                   				<input id="c2" name="c2" type="checkbox" data-size="normal" data-on-text="Sim" data-off-text="Não">
	                   				</c:if>
                                 <div class="help">Pequenos Depositos imoveis</div>                                        
                                 
                               </div>
                               <div class="col-lg-1">
	  								<input id="qt2" name="qt2" type="tel" size="5" value="${visita.qt2}" class="form-control input-md">
                                 	<div class="help">Quantidade</div>
                               </div>                                                                                                
                             </div>
                             	<!--item 3-->
                              <div class="form-group">
                              <label class="control-label col-md-3"></label>
                              	 <div class="col-lg-2 col-xs-6">
                   					<c:if test = "${visita.dp3==1}">
                   						<input id="c3" name="c3" type="checkbox" data-size="normal" checked data-on-text="Sim" data-off-text="Não">
                   					</c:if>                   				
                   					<c:if test = "${visita.dp3==0}">
                   						<input id="c3" name="c3" type="checkbox" data-size="normal" data-on-text="Sim" data-off-text="Não">
                   					</c:if>                   						                          
                                	 <div class="help">Outros depositos de armazenamento de água</div>
                               </div>
                               <div class="col-lg-1">
	  								<input id="qt3" name="qt3" type="tel" size="5" value="${visita.qt3}" class="form-control input-md">
                                 	<div class="help">Quantidade</div>
                               </div>                                                                                                
                             </div>  
                             	<!--item 4-->
                               <div class="form-group">
                              <label class="control-label col-md-3"></label>
                              	 <div class="col-lg-2 col-xs-6">
                   					<c:if test = "${visita.dp4==1}">
										<input id="c4" name="c4" type="checkbox" data-size="normal" checked data-on-text="Sim" data-off-text="Não">
                   					</c:if>
                   					<c:if test = "${visita.dp4==0}">
	                   					<input id="c4" name="c4" type="checkbox" data-size="normal" data-on-text="Sim" data-off-text="Não">                   					
                   					</c:if>                   					                          
                                	 <div class="help">Pneus e Outros Mat. Rodantes</div>
                               </div>
                               <div class="col-lg-1">
	  								<input id="qt4" name="qt4" type="tel" size="5" value="${visita.qt4}" class="form-control input-md">
                                 	<div class="help">Quantidade</div>
                               </div>                                                                                                
                             </div> 
                             	<!--item 5-->
                               <div class="form-group">
                              <label class="control-label col-md-3"></label>
                              	 <div class="col-lg-2 col-xs-6">
	                              	 <c:if test = "${visita.dp5==1}">
	                              	 	<input id="c5" name="c5" type="checkbox" data-size="normal" checked data-on-text="Sim" data-off-text="Não">
	                              	 </c:if>
	                              	 <c:if test = "${visita.dp5==0}">
	                              	 	<input id="c5" name="c5" type="checkbox" data-size="normal" data-on-text="Sim" data-off-text="Não">
	                              	 </c:if>                      
                               	 	<div class="help">Depositos Fixos</div>   
                               </div>
                               <div class="col-lg-1">
	  								<input id="qt5" name="qt5" type="tel" size="5" value="${visita.qt5}" class="form-control input-md">
                                 	<div class="help">Quantidade</div>
                               </div>                                                                                                
                             </div> 
                             	<!--item 6-->
                               <div class="form-group">
                              <label class="control-label col-md-3"></label>
                              	 <div class="col-lg-2 col-xs-6">
                   					<c:if test = "${visita.dp6==1}">
                   						<input id="c6" name="c6" type="checkbox" data-size="normal" checked data-on-text="Sim" data-off-text="Não">
                   					</c:if>
                  					<c:if test = "${visita.dp6==0}">
                  						<input id="c6" name="c6" type="checkbox" data-size="normal" data-on-text="Sim" data-off-text="Não">
                   					</c:if>                   
                                	<div class="help">Depositos Naturais</div>  
                               </div>
                               <div class="col-lg-1">
	  								<input id="qt6" name="qt6" type="tel" size="5" value="${visita.qt6}" class="form-control input-md">
                                 	<div class="help">Quantidade</div>
                               </div>                                                                                                
                             </div> 
                             	<!--item 7-->
                               <div class="form-group">
                              <label class="control-label col-md-3"></label>
                              	 <div class="col-lg-2 col-xs-6">
                   					<c:if test = "${visita.dp7==1}">
                   						<input id="c7" name="c7" type="checkbox" data-size="normal" checked data-on-text="Sim" data-off-text="Não">                          
                  					</c:if>
                   					<c:if test = "${visita.dp7==0}">
	                   					<input id="c7" name="c7" type="checkbox" data-size="normal" data-on-text="Sim" data-off-text="Não">                          
		           					</c:if>                   					
                                	 <div class="help">Lixo (recipientes plasticos, latas, entulhos)</div> 
                               </div>
                               <div class="col-lg-1">
	  								<input id="qt7" name="qt7" type="tel" size="5" value="${visita.qt7}" class="form-control input-md">
                                 	<div class="help">Quantidade</div>
                               </div>                                                                                                
                             </div> 

  						  <!--
  						  <p><input type="checkbox" name="check-categoria" onclick="document.getElementById('categoria').disabled = !this.checked;"> Categoria:</p>
  						  <p><input type="text" name="categoria" id="categoria" size="40" disabled="disabled"> </p>
  						   -->
  						    						  
                              
                        <!--Botões-->    
                            <div class="ln_solid"></div>
                            <div class="form-group">
                              <div class="col-md-6 col-md-offset-3">
                                <!-- <button id="send" type="submit" class="btn btn-info" data-toggle="modal" data-target="#confirma">Gravar</button> -->
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
    </div>
    <!-- jQuery -->
    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Bootstrap select -->
    <script src="js/bootstrap-select.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="vendors/moment/min/moment.min.js"></script>
    <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-VALIDATOR -->
    <script src="js/validator.min.js"></script>
    <!-- Switchery -->
    <script src="vendors/switchery/switchery.min.js"></script>
    <!-- Switch -->
	<script src="vendors/bootstrap-switch-master/dist/js/bootstrap-switch.min.js"></script>
	<!--Icheck-->
	<script src="vendors/iCheck/icheck.min.js"></script>
    <script type="text/javascript">
   	/* $(function() {
        $('input[name="data_visita"]').daterangepicker({
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
 	// Switch
	$("[name='c1']").bootstrapSwitch();
	$("[name='c2']").bootstrapSwitch();
	$("[name='c3']").bootstrapSwitch();
	$("[name='c4']").bootstrapSwitch();
	$("[name='c5']").bootstrapSwitch();
	$("[name='c6']").bootstrapSwitch();
	$("[name='c7']").bootstrapSwitch();
	
    </script>
    
    <script>
		
    	var lat = document.getElementById("latitude");
		var log = document.getElementById("longitude");
		var exibe_erro = document.getElementById("msgerro");

		
		function getLocation() {
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(capturaPosicao,mostraErro);		        
		    }
		}
		
		function capturaPosicao(position) {
		    lat.value = position.coords.latitude;
		    log.value = position.coords.longitude;
		    //log.innerHTML = position.coords.longitude;
		}

		function mostraErro(error) {
		    switch(error.code) {
		        case error.PERMISSION_DENIED:
		        	exibe_erro.innerHTML = "Usuário negou requisição para Geolocalização. Recarregue a página."
		            break;
		        case error.POSITION_UNAVAILABLE:
		        	exibe_erro.innerHTML = "Informação da localizaão está indisponivel."
		            break;
		        case error.TIMEOUT:
		        	exibe_erro.innerHTML = "Requisição para capturar posição excedeu tempo limite."
		            break;
		        case error.UNKNOWN_ERROR:
		        	exibe_erro.innerHTML = "Requisição de Geolocalização gerou erro desconhecido."
		            break;
		    }
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
