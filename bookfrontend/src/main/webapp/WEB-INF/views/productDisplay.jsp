<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<title>${category.name}</title>
<style>
body {
	background-image: url("");
	background-repeat: no-repeat;
	background-size:200%;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h2 style="text-align:center;">Product Discription</h2>
<!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">BOOK STORE</p>
                <div class="list-group">
                    <a href="kids book" class="list-group-item">Kids</a>
                    <a href="youngsters and teens book" class="list-group-item">Youngsters and Teens</a>
                    <a href="text book" class="list-group-item">Text Book</a>
                </div>
            </div>
   <div class="col-md-9">;

                
                <div class="row">
                

<div ng-app = "addToCartApp" ng-controller="addToCartCtrl"> 

<h1 style="text-align:center;">${product.name }</h1>
	<div style="margin-left:5px">
<img src="E:\productimage\/${product.id}.jpg"  width ="300" height="300"/>
						<p>Name:${product.name }</p>
							<h4>Price:RS.${product.price}</h4>
							
							<p>Description:${product.description }</p>
							
					
					<c:if test="${empty SuccessMessage}">
					<a href="login"><button class="btn btn-primary">login to add to cart
											</button></a>
					</c:if>	
					<c:if test="${not empty SuccessMessage}">	
									<button class="btn btn-primary"
										   ng-click="addItemToCart('${product.id}')"><span
												class="glyphicon glyphicon-shopping-cart"></span>Add to cart
											</button>
							</c:if>
				
						
							<p>15 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span>
								 <span class="glyphicon glyphicon-star"></span>
								  <span	class="glyphicon glyphicon-star"></span>
								   <span class="glyphicon glyphicon-star"></span>
									 <span class="glyphicon glyphicon-star"></span>
							</p>
						
					

</div>
</div>
	
			

<a href="categoryback"><button type="button" class="btn btn-primary" >back to categories</button></a>
 <script>
 

 var cartApp = angular.module ("addToCartApp", []);

 cartApp.controller("addToCartCtrl", function ($scope, $http){
 	
 	 /*
      * retrieveCart method is used to get all cart items at the starting of the application
      */
     $scope.retrieveCart = function (cartId) {
         $scope.cartId = cartId;
         $scope.refreshCartItems(cartId);
     };
     
     
     /*
      * removeItemFromCart method is used to remove a item from the cart
      */
     $scope.removeItemFromCart = function (id) {
         $http.put('http://localhost:8080/bookfrontend/removeItem/'+id).success(function (data) {
             $scope.refreshCartItems();
         });
     };

 	 /*
      * addItemToCart method is used to add items into the cart
      */
     $scope.addItemToCart = function (id) {
         $http.put('http://localhost:8080/bookfrontend/categoryDropdown/productDisplay/usercart/cart/addItem/'+id).success(function (data) {
             alert("Item added to the cart!")
             
         });
     };
    
    
     /*
      * GrandTotalOfItems method is called on cart page to calculate grand total for the added items
      */
     $scope.GrandTotalOfItems = function () {
         var grandTotal=0;

         for (var i=0; i<$scope.cart.cartItems.length; i++) {
             grandTotal+=$scope.cart.cartItems[i].totalPrice;
        }

         return grandTotal;
     };
     /*
 	 * refreshCartItems method is called by others methods in same controller to refresh the cart
 	 */
     $scope.refreshCartItems = function () {
         $http.get('http://localhost:8080/bookfrontend/refreshCart/'+$scope.cartId).success(function (data) {
            $scope.cart=data;
         });
     };
     
     /*
      * clearCartItems method is used to delete all items from the cart
      */
     $scope.clearCartItems = function () {
     	$http['delete']('http://localhost:8080/bookfrontend/clearCartItems/'+$scope.cartId).success(function (data)
     			{$scope.refreshCartItems()
     		});
     };
 });

</script>
              </div>

            </div>

        </div>

    </div>
    <!-- /.container -->


 <%@ include file="footer.jsp" %>

</body>
</html>