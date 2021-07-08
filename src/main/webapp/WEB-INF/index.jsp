<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="build/css/custom.min.css" rel="stylesheet">

<!-- login -->
<style>
#formlogin {
	background-color: #DCDCDC;
	padding: 0px 10px 0px 10px;
	border: 1px solid #d0d0d0;
	border-radius: 7px;
	text-align: center;
}
</style>

</head>

<body class="login">

	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form" id="formlogin">
				<section class="login_content">
					<form method="post" action="inicio">
						<div>
							<img src="images/logosis.png" width="280px" />
						</div>
						<br />
						<!--<h1>Sistema de Endemias</h1>-->
						<div>
							<input type="text" name="login" class="form-control"
								placeholder="Matrícula" required="" />
						</div>
						<div>
							<input type="password" name="senha" class="form-control"
								placeholder="Senha" required="" />
						</div>
						<div>
							<button id="send" type="submit" class="btn btn-info btn-sm submit">Logar</button>
							<!--<a class="reset_pass" href="#">Esqueceu sua senha?</a>   -->
						</div>

						<div class="clearfix"></div>
						<div class="separator">
							<div>
								<p>
									Sistema de Controle de Endemias - Versão 0.01beta
								</p>
							</div>
							<div class="clearfix"></div>
							<br />
						</div>
						<c:if test="${not empty message}">
							<div>
								<c:if test="${fn:contains(message, 'Falha')}">
									<div class="alert alert-danger fade in">
										<p>${message}</p>
									</div>
								</c:if>
							</div>
						</c:if>
					</form>
				</section>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
