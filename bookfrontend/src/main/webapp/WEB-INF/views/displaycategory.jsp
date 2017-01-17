<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>category</title>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script>
  var prod = ${list};
  angular.module('repeatSample',[]).controller('CategoryController', function($scope)
   {
          $scope.Category=prod
   
          $scope.sort = function(keyname)
          {
              $scope.sortKey = keyname;   //set the sortKey to the param passed
              $scope.reverse = !$scope.reverse; //if true make it false and vice versa
          }
              
    });
</script>
</head>
<body>
  <div class="container" color="#000;">
  <form:form commandName="displaycategory">
  <div class="span12" style="text-align: justify; font-size: large; color:black;">
  <div ng-app="repeatSample" ng-controller="CategoryController">
  <br/><br/>
  <div style="color:black;"  class="row">
Search:<input type=text placeholder="Search" ng-model="searchText"/>
  </div>
  <div style="color:black;"  id="headin2" align="justify"><strong> <h4 align="center">CATEGORY DETAILS </h4></strong></div>
  <table width=\"100%\" border=\"0\" id=\"tab\" align="center">
  <tr>
    <th style="color:black;" id=\"td1\"> CATEGORY ID	</th>
    <th style="color:black;" id=\"td2\"> CATEGORY NAME	</th>
    <th style="color:black;" id=\"td3\"> DESCRIPTION	</th>
    <th style="color:black;" id=\"td4\"> EDIT	</th>
    <th style="color:black;" id=\"td5\"> DELETE	</th>
 </tr>
 <tr class="success" ng-repeat="cat in Category | filter:searchText">
 	<td style="text-align: justify; font-size: large; color:black;">{{cat.categoryId}}</td>
 	<td style="text-align: justify; font-size: large; color:black;">{{cat.categoryName}}</td>
 	<td style="text-align: justify; font-size: large; color:black;">{{cat.categoryDesc}}</td>
 	<td><a href="editCategory?Id={{cat.categoryId}}">Edit</a></td>
	<td><a href="delCategory?Id={{cat.categoryId}}">Delete</a></td></tr>
 </table>
</div>
</div>
</form:form>
</div>
</body>
</html>

