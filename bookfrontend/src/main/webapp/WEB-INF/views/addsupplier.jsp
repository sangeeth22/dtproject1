<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<title>Supplier Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<jsp:include page="admin.jsp"></jsp:include>

<h1>
	Add a Supplier
</h1>

<c:url var="addAction" value="/supplier/add" ></c:url>



<form:form action="${addAction}" modelAttribute="supplier">



<table>
	<c:if test="${!empty supplier.name}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="name">
				<spring:message text="Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
			<form:errors path="name"></form:errors>
		</td> 
	</tr>	
	<tr>
		<td>
			<form:label path="description">
				<spring:message text="Description"/>
			</form:label>
		</td>
		<td>
			<form:input path="description" />
			<form:errors path="description"/>
		</td>
	</tr>
	
	
	<tr>
		<td colspan="2">
			<c:if test="${!empty supplier.name}">
				<input type="submit"
					value="<spring:message text="Edit supplier"/>" />
			</c:if>
			<c:if test="${empty supplier.name}">
				<input type="submit"
					value="<spring:message text="Add supplier"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Supplier List</h3>
<c:if test="${!empty listSupplier}">
	<table class="tg">
	<tr>
		<th width="80">Supplier ID</th>
		<th width="120">Supplier Name</th>
		<th width="120">Supplier description</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listSupplier}" var="supplier">
		<tr>
			<td>${supplier.id}</td>
			<td>${supplier.name}</td>
			<td>${supplier.description}</td>
			<td><a href="<c:url value='/editid2/${supplier.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/removeid2/${supplier.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>