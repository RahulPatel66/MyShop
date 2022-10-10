<!doctype html>
<%@include file="component/componentFile.jsp" %>
<head>
<title>My Shop - User SignUp Page</title>
<style type="text/css">
body{
		background-image: url("./images/bg-4.jpg");
		background-size:cover;
		background-position:center;
		background-repeat:no-repeat;
		
	}
</style>
</head>
<body >
<div class="card bg-light m-auto " style="width:30%;top:.5rem;" >
 <img class="card-img-top m-auto" src="./images/user.webp" alt="Card image cap" style="width:20%;height:20%">
<div class="card-body">
<h5 class="card-title text-center" style="text-decoration:underline; margin-top:-1rem;" >User Sign Up Page</h5>
<%
	String message =(String) session.getAttribute("message");
	if(message!=null)
	{
%>
  <div class="alert alert-warning alert-dismissible">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong><%=message %></strong>
</div>
<%
	session.removeAttribute("message");
	}
%>
<form action="UserSignUp"  onsubmit="return checkvalidation()">
<div class="form-group ">
    <label for="name">User Name</label>
    <input type="text" id="name" class="form-control" name="name"  placeholder="Enter Name Here"  minlength="4"  maxlength="20" required>
    
  </div>
	<div class="form-group">
    <label for="email1">Email address</label>
    <input type="email" id="emaill" class="form-control" name="email" placeholder="Enter Email Here" minlength="14" maxlength="30" required>
    
  </div>
  <div class="form-group">
    <label for="number">Phone Number</label>
    <input type="number" id="number" class="form-control" name="number"  placeholder="Enter Number Here" required> 
  </div>
    <i id="numbererro" style="float:right;font-size:1rem; font-weight: lighter;margin-top:-1rem;"></i>
  
  
  <script type="text/javascript">
  	function checkvalidation(){
  		var number = document.getElementById("number").value;
  		if(number.length!="10")
  		{
  			document.getElementById("numbererro").innerHTML="Please Enter a Valid Number";
  			return false;
  		}
  	}
  </script>
  
  <div class="form-group">
    <label for="Password1">Password</label>
    <input type="password" class="form-control" name="password" id="Password1" minlength="8" maxlength="20" placeholder="Enter Password Here" required>
  </div>
 
    <div class="form-group">
    <label for="address">Address</label>
    <textarea name="address" id="address" class="form-control"   placeholder="Enter Address Here" rows="3" cols="4" required></textarea>
    
  </div>
    
  <div class="form-group" style="text-align:center">
 
 <input type="submit"  class="btn form-control btn-primary" value="Submit" >
</div>
 <a href="UserLogin.jsp"style="display:block;text-align:right;color:blue;text-decoration:underline;">already have account?</a>

</form>
</div>

</div>
</body>