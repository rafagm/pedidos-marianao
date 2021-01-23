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
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<span class="glyphicon glyphicon-shopping-cart"></span>
							<spring:message code="newOrder.selected.items" />
							<a href="/orders/users/orders/newOrder/clearItems"
								class="btn btn-default btn-sm"> <span
								class="glyphicon glyphicon-remove"></span> <spring:message
									code="newOrder.clear" />
							</a>
						</h4>
					</div>
					<div class="panel-body">
						<c:forEach items="${order.getItems()}" var="items">
							<div class="media">
								<div class="media-left media-top">
									<img
										src="${pageContext.request.contextPath}/images/${items.key.image}"
										class="media-object" style="width: 60px">
								</div>
								<div class="media-body">
									<h4 class="media-heading">
										${items.key.name} <small>x ${items.value} = <fmt:formatNumber
												type="number" maxFractionDigits="2"
												value="${items.key.price * items.value}" />
											<spring:message code="currency.symbol" /></small>
									</h4>
									<p>${items.key.description}</p>
								</div>
								<div class="media-right media-top">

									<a href="newOrder/increaseItem?reference=${items.key.reference}">
										<span class="glyphicon glyphicon-plus-sign"></span>
									</a>
									<a href="newOrder/decreaseItem?reference=${items.key.reference}">
										<span class="glyphicon glyphicon-minus-sign"></span>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<span class="glyphicon glyphicon-list"></span>
							<spring:message code="newOrder.items" />
						</h4>
					</div>
					<div class="panel-body">
						<c:forEach items="${items}" var="item">
							<div class="media">
								<div class="media-left media-top">
									<img
										src="${pageContext.request.contextPath}/images/${item.image}"
										class="media-object" style="width: 60px">
								</div>
								<div class="media-body">
									<h4 class="media-heading">
										${item.name} <small> ${item.price} <spring:message
												code="currency.symbol" /></small>
									</h4>
									<p>${item.description}</p>
								</div>
								<div class="media-right media-top">

									<a href="newOrder/increaseItem?reference=${item.reference}">
										<span class="glyphicon glyphicon-plus-sign"></span>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>