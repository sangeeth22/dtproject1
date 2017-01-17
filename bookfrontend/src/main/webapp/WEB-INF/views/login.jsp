<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
		<title>Login</title>
		<script type="text/javascript" src="assets/js/bootstrap.js"></script>
		<script>
		$(function() {

			var $formLogin = $('#login-form');
			var $formLost = $('#lost-form');
			var $formRegister = $('#register-form');
			var $divForms = $('#div-forms');
			var $modalAnimateTime = 300;
			var $msgAnimateTime = 150;
			var $msgShowTime = 2000;

			$("form")
					.submit(
							function() {
								switch (this.id) {
								case "login-form":
									var $lg_username = $('#login_username').val();
									var $lg_password = $('#login_password').val();
									if (($lg_username == "niit"
											&& $lg_password == "niit")||($lg_username=="admin"&&$lg_password=="admin")) {
										msgChange($('#div-login-msg'),
												$('#icon-login-msg'),
												$('#text-login-msg'), "success",
												"glyphicon-ok", "Login Successful");
										request.getRequestDispatcher("").forward(
												request, response);
									} else {
										msgChange($('#div-loginS-msg'),
												$('#icon-login-msg'),
												$('#text-login-msg'), "error",
												"glyphicon-remove", "Login error");
									}
									return false;
									break;
								case "lost-form":
									var $ls_email = $('#lost_email').val();
									if ($ls_email == "ERROR") {
										msgChange($('#div-lost-msg'),
												$('#icon-lost-msg'),
												$('#text-lost-msg'), "error",
												"glyphicon-remove", "Send error");
									} else {
										msgChange($('#div-lost-msg'),
												$('#icon-lost-msg'),
												$('#text-lost-msg'), "success",
												"glyphicon-ok", "Send OK");
									}
									return false;
									break;
								case "register-form":
									var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
									var $rg_username = $('#username').val();
									var $rg_email = $('#email').val();
									var $rg_password = $("#pass1").val();
									var $rg_password2 = $("#pass2").val();
									if ($rg_password != $rg_password2
											|| regMail.test($rg_email) == false) {
										msgChange($('#div-register-msg'),
												$('#icon-register-msg'),
												$('#text-register-msg'), "error",
												"glyphicon-remove",
												"Registeration error");
									} else {
										msgChange($('#div-register-msg'),
												$('#icon-register-msg'),
												$('#text-register-msg'), "success",
												"glyphicon-ok",
												"Registered Successfully");
										request.getRequestDispatcher("").forward(
												request, response);
									}
									return false;
									break;
								default:
									return false;
								}

								return false;
							});

			$('#login_register_btn').click(function() {
				modalAnimate($formLogin, $formRegister)
			});
			$('#register_login_btn').click(function() {
				modalAnimate($formRegister, $formLogin);
			});
			$('#login_lost_btn').click(function() {
				modalAnimate($formLogin, $formLost);
			});
			$('#lost_login_btn').click(function() {
				modalAnimate($formLost, $formLogin);
			});
			$('#lost_register_btn').click(function() {
				modalAnimate($formLost, $formRegister);
			});
			$('#register_lost_btn').click(function() {
				modalAnimate($formRegister, $formLost);
			});

			function modalAnimate($oldForm, $newForm) {
				var $oldH = $oldForm.height();
				var $newH = $newForm.height();
				$divForms.css("height", $oldH);
				$oldForm.fadeToggle($modalAnimateTime, function() {
					$divForms.animate({
						height : $newH
					}, $modalAnimateTime, function() {
						$newForm.fadeToggle($modalAnimateTime);
					});
				});
			}

			function msgFade($msgId, $msgText) {
				$msgId.fadeOut($msgAnimateTime, function() {
					$(this).text($msgText).fadeIn($msgAnimateTime);
				});
			}

			function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass,
					$msgText) {
				var $msgOld = $divTag.text();
				msgFade($textTag, $msgText);
				$divTag.addClass($divClass);
				$iconTag.removeClass("glyphicon-chevron-right");
				$iconTag.addClass($iconClass + " " + $divClass);
				setTimeout(function() {
					msgFade($textTag, $msgOld);
					$divTag.removeClass($divClass);
					$iconTag.addClass("glyphicon-chevron-right");
					$iconTag.removeClass($iconClass + " " + $divClass);
				}, $msgShowTime);
			}
		});
</script>
		<style>
body, html{
     height: 100%;
 	background-repeat: no-repeat;
 	background: url(http:///wp-content/uploads/2014/09/blue-wallpaper-36.jpg)no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
 	font-family: 'Oxygen', sans-serif;
}
/*footer problem and header down*/
body {
  min-height: 1000px;
  padding-top:23px;
  font-family: 'Open Sans', sans-serif;
}
.main{
 	margin-top: 70px;
}
section{
	padding: 3rem 0;
}
h1.title { 
	font-size: 50px;
	font-family: 'Passion One', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}

#div-login-msg,
#div-lost-msg,
#div-register-msg {
    border: 1px solid #dadfe1;
    height: 30px;
    line-height: 28px;
    transition: all ease-in-out 500ms;
}

#div-login-msg.success,
#div-lost-msg.success,
#div-register-msg.success {
    border: 1px solid #68c3a3;
    background-color: #c8f7c5;
}

#div-login-msg.error,
#div-lost-msg.error,
#div-register-msg.error {
    border: 1px solid #eb575b;
    background-color: #ffcad1;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}
</style>
	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">Book Store</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form id="login-form" class="form-horizontal" action="perform_login" method="POST" role="form">
						<div class="form-group">
							<label for="UserName" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="username" id="userID"  placeholder="Enter your Username"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="Password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
									<input type="password" class="form-control" id="password" name="password" placeholder="Enter your Password"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Login</button>
						</div>
					</form>
				</div>
			</div>
		</div><br><br><br>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>