<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <div class="left-side-bar">
		<div class="brand-logo">
			<a href="${pageContext.request.contextPath}/main">
				<img class="img-size" src="${pageContext.request.contextPath}/resources/vendors/images/mylogo2.png" alt="">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-house-1"></span><span class="mtext">Home</span>
						</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/main">Everyone's moment</a></li>
							<li><a href="${pageContext.request.contextPath}/myboard">My moment</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>