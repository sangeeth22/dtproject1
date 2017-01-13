<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
       
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     
           <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid" style="background-color:crimson;color:black;height:80px;">
  <center><h2>WELCOME ADMIN</h2></center>
</div>
       
	<div class="cat">
	<h1>Categories</h1>

	<c:url var="addAction" value="/addcategory"></c:url>

	<form:form action="${addAction}" commandName="category">
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
	</div>
	<br>
	<h3>Categories List</h3>
	<c:if test="${!empty categoryList}">
	<table class="tg">
	<tr>
		<th width="80">Category ID</th>
		<th width="120">Category Name</th>
		<th width="120">Category description</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${categoryList}" var="category">
		<tr>
			<td>${category.id}</td>
			<td>${category.name}</td>
			<td>${category.description}</td>
			<td><a href="<c:url value='/editcategory/${category.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/removeid/${category.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>