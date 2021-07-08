<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt">
   <!-- CSS para retornar aparencia dos componentes bootstrap -->
   <!--  <link href="css/bootstrap-theme.min.css" rel="stylesheet"> -->      
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 20;">
              <a href="#" class="site_title"><span class="fa fa-desktop"></span><span> EndemicSyS</span></a>
            </div>
            <div class="clearfix"></div>
            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
				<img src="images/user.png" alt="..." class="img-circle profile_img">				
              </div>
              <div class="profile_info">
                <span>Bem-vindo,</span>
               <h2><c:out value="${sessionScope.nome}"/></h2>
                <span>Função</span>
                <h2><c:out value="${sessionScope.funcao}"/></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br />
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
               <div class="menu_section">
                <ul class="nav side-menu">
                <li><a href="inicio?acao=inicio"><i class="fa fa-home"></i> Início</a></li>
                </ul>
                <h3>Visualização</h3>                
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-globe"></i> Mapa <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="carregamapa">Mapa de focos </a></li>
                    </ul>
                  </li>                                
                </ul>
              </div>
              <div class="menu_section">
                <% if (session.getAttribute("funcao").equals("Administrador")) {
                 %>
                <h3>INFORMAÇÕES</h3>
                <ul class="nav side-menu">
                   <li><a><i class="fa fa-edit"></i>Cadastros<span class="fa fa-chevron-down"></span></a>
                   		<ul class="nav child_menu">                   
                    		<li><a href="funcionario">Funcionário</a></li>
                            <li><a href="visita">Visita</a></li>
                           	<li><a href="notificacao">Notificação</a></li>
                    	</ul> 
                    </li>                       
                   <li><a><i class="fa fa-search"></i>Busca<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="buscafuncionario">Funcionários</a></li>
                      <li><a href="buscavisita">Visitas</a></li>
                      <li><a href="buscanotificacao">Notificações</a></li>                      
                    </ul>
                   </li>
                   	<li><a><i class="fa fa-check-circle"></i>Parametros Auxiliares<span class="fa fa-chevron-down"></span></a>
                   		<ul class="nav child_menu">                   
                    		<li><a href="estagio">Estágio</a></li>
                            <li><a href="imovel">Tipo de Imovel</a></li>
                           	<li><a href="tratamento">Tratamento</a></li>
                           	<li><a href="tipofuncao">Função</a></li>
                    		<li><a href="cidade">Cidade</a></li>
                    		<li><a href="bairro">Bairro</a></li>
                    	</ul>
                    </li>
                    <% 
                    } else if (session.getAttribute("funcao").equals("Atendente")) {                    	
                        	  
                    %>
                     <h3>INFORMAÇÕES</h3>
               		 <ul class="nav side-menu">
                     <li><a><i class="fa fa-edit"></i>Cadastros <span class="fa fa-chevron-down"></span></a>
                     	<ul class="nav child_menu">
                           	<li><a href="notificacao">Notificação</a></li>
                    	</ul> 
                    </li>
                    <li><a><i class="fa fa-edit"></i>Busca <span class="fa fa-chevron-down"></span></a>
                     	<ul class="nav child_menu">
                           	<li><a href="buscanotificacao">Notificação</a></li>
                    	</ul> 
                    </li>
                     </ul>
                    <%
					} else if (session.getAttribute("funcao").equals("Agente")) {

              		%>
              		 <h3>INFORMAÇÕES</h3>
               		 <ul class="nav side-menu">
              		<li><a><i class="fa fa-edit"></i>Cadastros <span class="fa fa-chevron-down"></span></a>
                    	<ul class="nav child_menu">
                           	<li><a href="visita">Visita</a></li>
                   		</ul>
                    </li>
                    <li><a><i class="fa fa-edit"></i>Busca <span class="fa fa-chevron-down"></span></a>
                    	<ul class="nav child_menu">
                           	<li><a href="buscavisita">Visita</a></li>
                           	<li><a href="buscanotificacao">Notificação</a></li>
                   		</ul> 
                    </li>             		
                	</ul>                
                	<%
                    }
                    %>  
              </div>   
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Sair" href="inicio?acao=logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>
        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="btn btn-default btn-xs fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="#" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                    <img src="images/user.png" alt=""><c:out value="${sessionScope.nome}"/>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="inicio?acao=logout"><i class="fa fa-sign-out pull-right"></i>Sair</a></li>
                  </ul>
                </li>          
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->      
        
