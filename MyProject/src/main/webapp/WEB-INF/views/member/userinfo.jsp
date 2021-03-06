<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />
	<div class="mobile-menu-overlay"></div>
	
	<div class="main-container">
		<div class="userinfi-wrap d-flex align-items-center flex-wrap justify-content-center">
			<div class="container">
				<div class="row align-items-center">
					<div class="col">
						<div class="card card-box">
							<div class="card-title">
								<h2 class="text-center text-moment mt-3">User info</h2>
							</div>
							<div class="card-body">
								<form method="post" action="${pageContext.request.contextPath}/member/update">
									<div class="form-group">
										<label for="userid">User id</label>
										<input class="userid form-control form-control-lg" type="text" name="userid" id="userid" readonly value="${userinfo.userid}">
									</div>
									<div class="form-group">
										<label for="userName">User name</label>
										<input class="userName form-control form-control-lg" type="text" name="userName" id="userName" value="${userinfo.userName}">
									</div>
									<div class="form-group">
										<label for="phonenumber">Phone number</label>
										<input class="phonenumber form-control form-control-lg" type="text" name="phonenumber" id="phonenumber" value="${userinfo.phonenumber}">
									</div>
									 <button class="updateBtn btn btn-moment btn-block">
                                		Update information
                             		 </button>
									 <button data-oper="delete" class="deleteBtn btn btn-outline-moment btn-block" formaction="delete">
                                		Good Bye We hope to see you again
                             		 </button>
                             		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../includes/footer.jsp" />