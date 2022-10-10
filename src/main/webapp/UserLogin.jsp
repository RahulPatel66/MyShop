<head>
<title>My Shop - User Login Page</title>
<style type="text/css">
	body{
		background-image: url("./images/bg-4.jpg");
		background-size:cover;
		background-position:center;
		background-repeat:no-repeat;
	}
	
</style>
</head>
<%@include file="component/componentFile.jsp" %>

<%@include file="component/navbar.jsp" %>
<div class="card bg-light m-auto"id="card" style="width:30%;top:5rem;"  >
 <img class="card-img-top m-auto" src="./images/user.webp" alt="Card image cap" style="width:20%;height:20%">
<div class="card-body">
<h5 class="card-title text-center"  >User Login Page</h5>
<%! String message=null; %>
<%
	message=(String)session.getAttribute("message");
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
<form action="UserLogin">
		<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
 
    
    <a href="ForgotePassword.jsp"class="btn " style="display:block;text-align:right;color:blue;text-decoration:underline;">Forgote Password</a>
   <div class="form-group" style="text-align:center">
 
 <input type="submit"  class="btn form-control btn-primary" value="Login" >
</div>
 <a href="UserSignUp.jsp"style="display:block;text-align:right;color:blue;text-decoration:underline;">Don`t have account?</a>
</form>
</div>

</div>