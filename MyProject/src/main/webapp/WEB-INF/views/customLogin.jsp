<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>MomenTing</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/vendors/images/favicon2.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/vendors/images/favicon2.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
	<!-- CSS -->
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/mycss.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/style.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script>

	
</head>
<body class="login-page">
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-moment">Login</h2>
						</div>
						<form class="user" method="post" action="${pageContext.request.contextPath}/login">
                              <div class="form-group">
                                  <input type="text" class="form-control form-control-user"
                                      id="exampleInputEmail" aria-describedby="emailHelp" name="username"
                                      placeholder="User ID">
                              </div>
                              <div class="form-group">
                                  <input type="password" class="form-control form-control-user" name="password"
                                      id="exampleInputPassword" placeholder="Password">
                              </div>
                              <div class="form-group">
                                  <div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input border-moment" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">Remember</label>
									</div>
                              </div>
                              <button class="btn btn-moment btn-user btn-block mb-3">
                                  Login
                              </button>
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                         </form>
                         <a class="btn btn-outline-moment btn-block" href="${pageContext.request.contextPath}/member/register">Register</a>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function() {
				var result = "${result}";
				if(result !=''){
					alert(result);
					return;
				}
				
			})
		</script>
	</div>
	<!-- js -->
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>