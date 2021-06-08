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
								<h2 class="text-center mt-3">비밀번호 확인</h2>
							</div>
							<div class="card-body">
								<form method="post" action="/member/passchk">
									<div class="form-group">
										<label for="userpw">Password</label>
										<input class="userpw form-control form-control-lg" type="text" name="userpw" id="userpw">
									</div>
									 <button class="updateBtn btn btn-warning btn-block">
                                		Go to User info update
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