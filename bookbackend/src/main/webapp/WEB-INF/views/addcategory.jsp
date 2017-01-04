<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<title>Category Page</title>
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
	Add a Category
</h1>

<c:url var="addAction" value="/category/add" ></c:url>



<form:form action="${addAction}" modelAttribute="category">



<table>
	<c:if test="${!empty category.name}">
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
			<c:if test="${!empty category.name}">
				<input type="submit"
					value="<spring:message text="Edit category"/>" />
			</c:if>
			<c:if test="${empty category.name}">
				<input type="submit"
					value="<spring:message text="Add category"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Category List</h3>
<c:if test="${!empty listCategory}">
	<table class="tg">
	<tr>
		<th width="80">Category ID</th>
		<th width="120">Category Name</th>
		<th width="120">Category description</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listCategory}" var="category">
		<tr>
			<td>${category.id}</td>
			<td>${category.name}</td>
			<td>${category.description}</td>
			<td><a href="<c:url value='/editid1/${category.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/removeid1/${category.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>