<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />
<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="card-box pd-20 height-100-p mb-30">
				<div class="row align-items-center">
					<div class="col-md-4">
						<img src="/resources/vendors/images/banner-img.png" alt="">
					</div>
					<div class="col-md-8">
						<h4 class="font-20 weight-500 mb-10 text-capitalize">
							Welcome back <div class="weight-600 font-30 text-blue">Johnny Brown!</div>
						</h4>
						<p class="font-18 max-width-600">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde hic non repellendus debitis iure, doloremque assumenda. Autem modi, corrupti, nobis ea iure fugiat, veniam non quaerat mollitia animi error corporis.</p>
					</div>
				</div>
			</div>
			<c:forEach items="${list}" var="board">
			<div class="card-box mb-30">
				<div class="card-header py-3 post-heading">
					<h5 class="m-0 font-weight-bold"><c:out value="${board.writer}" /></h5>
					<h6 class="m-0 font-weight-bold"><fmt:formatDate value="${board.regdate}" /></h6>
				</div>
				<div class="card-body">
     				<h4 class="card-title"><c:out value="${board.title}" /></h4>
      				<p class="card-text"><c:out value="${board.content}" /></p>
    			</div>
			</div>
			</c:forEach>
		</div>
	</div>
<jsp:include page="../includes/footer.jsp" />	

