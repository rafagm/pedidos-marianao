<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

		<%-- TODO finish order form with address fields --%>
		<div class="container">

			<div class="row">
				<form id="order" class="form-horizontal"
					action="/orders/users/orders/newOrder/finishOrder" method="post"
					modelAttribute="order">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>
									<span class="glyphicon glyphicon-th-large"></span>
									<spring:message code="finishOrder.order" />
								</h4>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-5">
										<h5>
											<span class="glyphicon glyphicon-user"></span>
											<spring:message code="finishOrder.client.data" />
										</h5>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="firstName">
												<spring:message code="finishOrder.first.name" />
											</label>
											<div class="col-sm-8">
												<p class="form-control-static">John</p>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="firstName">
												<spring:message code="finishOrder.last.name" />
											</label>
											<div class="col-sm-8">
												<p class="form-control-static">Doe</p>
											</div>
										</div>
										<h5>
											<span class="glyphicon glyphicon-envelope"></span>
											<spring:message code="finishOrder.shipment.data" />
										</h5>
										<div class="form-group">
											<div class="form-group">
												<label for="deliveryAddress.recipientName"
													class="col-sm-3 control-label"><spring:message
														code="finishOrder.recipient" /></label>
												<div class="col-sm-8">

													<input id="recipientName"
														name="deliveryAddress.recipientName" class="form-control"
														placeholder="<spring:message code="finishOrder.recipient.placeholder"/>"
														type="text" value="" />
												</div>
											</div>
											<div class="form-group">
												<label for="deliveryAddress.address"
													class="col-sm-3 control-label"> <spring:message
														code="finishOrder.address" />
												</label>
												<div class="col-sm-8">

													<input id="address" name="deliveryAddress.address"
														class="form-control"
														placeholder="<spring:message code="finishOrder.address.placeholder"/>"
														type="text" value="" />
												</div>
											</div>
											<div class="form-group">
												<label for="deliveryAddress.zipCode"
													class="col-sm-3 control-label"> <spring:message
														code="finishOrder.zip.code" />
												</label>
												<div class="col-sm-8">

													<input id="zipCode" name="deliveryAddress.zipCode"
														class="form-control" name="Zip code"
														placeholder="<spring:message code="finishOrder.zip.code.placeholder"/>"
														type="text" value="" />
												</div>
											</div>
											<div class="form-group">
												<label for="deliveryAddress.city"
													class="col-sm-3 control-label"><spring:message
														code="finishOrder.city" /></label>
												<div class="col-sm-8">

													<input id="city" name="deliveryAddress.city"
														class="form-control" name="deliveryAddress.city"
														placeholder="<spring:message code="finishOrder.city.placeholder"/>"
														type="text" value="" />
												</div>
											</div>
											<div class="form-group">

												<label for="deliveryAddress.state"
													class="col-sm-3 control-label"><spring:message
														code="finishOrder.state.province" /> </label>
												<div class="col-sm-8">

													<input id="state" name="deliveryAddress.state"
														class="form-control"
														placeholder="<spring:message code="finishOrder.state.province.placeholder"/>"
														type="text" value="" />
												</div>
											</div>
											<div class="form-group">
												<label for="deliveryAddress.country"
													class="col-sm-3 control-label"> <spring:message
														code="finishOrder.country" />
												</label>
												<div class="col-sm-8">

													<input id="country" name="deliveryAddress.country"
														class="form-control"
														placeholder="<spring:message code="finishOrder.country.placeholder"/>"
														type="text" value="" />
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-7">
										<h5>
											<span class="glyphicon glyphicon-list"></span>
											<spring:message code="finishOrder.items" />
										</h5>
										<div class="table-responsive">
											<table
												class="table table-striped table-bordered table-condensed">
												<thead>
													<tr>
														<th>Referencia</th>
														<th><spring:message code="finishOrder.items" /></th>
														<th><spring:message code="finishOrder.price" /></th>
														<th><label for="totalQuantity"><spring:message
																	code="finishOrder.quantity" /></label></th>
														<th><spring:message code="finishOrder.amount" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${order.getItems()}" var="items">
														<tr>
															<td>${items.key.reference}</td>
															<td>${items.key.name}</td>
															<td>${items.key.price}<spring:message
																	code="currency.symbol" /></td>
															<td>${items.value}</td>
															<td><fmt:formatNumber type="number"
																	maxFractionDigits="2"
																	value="${items.key.price * items.value}" /> <spring:message
																	code="currency.symbol" /></td>
														</tr>
													</c:forEach>

													<tr>
														<th colspan="3" style="text-align: right">Total</th>
														<th><label for="totalQuantity">${order.getTotalQuantity()}</label></th>
														<th><fmt:formatNumber type="number"
																	maxFractionDigits="2"
																	value="${order.getTotalAmount()}" /><spring:message
																code="currency.symbol" />
														</th>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="panel-footer">
								<button type="submit" id="btnAdd"
									class="btn btn-default btn-block">
									<span class="glyphicon glyphicon-credit-card"></span>
									<spring:message code="finishOrder.purchase" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>