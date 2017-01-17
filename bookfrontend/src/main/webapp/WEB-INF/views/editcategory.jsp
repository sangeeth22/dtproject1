<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Table</title>
</head>
<body>
<div class="bg-content">
 <div class="container">
<form:form action="editCategory" method="POST" commandName="category">
<div  background="#D0C0D0" align="Center">
<h3 style="color:white;">Edit Category</h3>
<br/>
<br/>
  Category ID:<form:input type="text" path="categoryId" readonly="true" />
  <br/>
  <br/>
  Category Name:<form:input type="text" path="categoryName"  />
  <br/>
 <br/>
  Category Description:<form:input type="text" path="categoryDesc" />
 <br>
<br/>
	<input type="Submit" value="Update category"/>
	</div>
</form:form>
</div>
</div>


</body>
</html>