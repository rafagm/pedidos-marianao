<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="sections/head.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Orders</title>
<style>
.form-control-error {
	border-color: #a94442;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075)
}

.form-control-error:focus {
	border-color: #843534;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483
}

.input-group-addon-error {
	color: #a94442;
	background-color: #f2dede;
	border-color: #a94442
}

.control-label-error {
	color: #a94442
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="sections/header.jsp" />
		<%-- TODO if user has ROLE_ADMIN -> Show all orders of all users and let change state and delivery date --%>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="container">
				<table
					class="table table-striped table-bordered table-condensed table-responsive small">
					<thead>
						<tr>

							<th><spring:message code="orders.client"/></th>
							<th><spring:message code="orders.reference" /></th>
							<th><spring:message code="orders.deliveryAddress" /></th>
							<th><spring:message code="orders.startDate" /></th>
							<th><spring:message code="orders.state" /></th>
							<th><spring:message code="orders.deliveryDate" /></th>
							<th><spring:message code="orders.details" /></th>
							
						</tr>
					</thead>
					<tbody>
						
						<c:if test="${not empty orders}">
							<c:forEach items="${orders}" var="order">
								<tr>
									<td>${order.getReference()}</td>
									<td>${order.getDeliveryAdress()}</td>
									<td>${order.getStartDate()}</td>
									<td>${order.getDeliveryDate()}</td>
									<td>${order.getState()}</td>
								</tr>	
							</c:forEach>
						</c:if>
						
						<tr>

							<td colspan="7"><spring:message code="orders.admin.no.orders" /></td>

						</tr>

					</tbody>
				</table>
			</div>
		</sec:authorize>
		<%-- TODO if user has ROLE_USER -> Show all orders of the user --%>
		<sec:authorize access="hasRole('ROLE_USER')">
			<div class="container">
				<table
					class="table table-striped table-bordered table-condensed table-responsive small">
					<thead>
						<tr>

							<th><spring:message code="orders.client" /></th>
							<th><spring:message code="orders.reference" /></th>
							<th><spring:message code="orders.deliveryAddress" /></th>
							<th><spring:message code="orders.startDate" /></th>
							<th><spring:message code="orders.state" /></th>
							<th><spring:message code="orders.deliveryDate" /></th>
							<th><spring:message code="orders.details" /></th>
							
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty orders}">
							<c:forEach items="${orders}" var="order">
								<tr>
									<td>${order.getReference()}</td>
									<td>${order.getDeliveryAdress()}</td>
									<td>${order.getStartDate()}</td>
									<td>${order.getDeliveryDate()}</td>
									<td>${order.getState()}</td>
								</tr>	
							</c:forEach>
						</c:if>

						<tr>
							<td colspan="6"><spring:message code="orders.user.no.orders" /></td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</sec:authorize>
	</div>
</body>
</html>
