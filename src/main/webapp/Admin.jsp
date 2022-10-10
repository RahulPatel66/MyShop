		<%@page import="java.sql.Connection" %>
    	<%@page import="java.sql.DriverManager" %>
    	<%@page import="java.sql.ResultSet" %>
    	<%@page import="java.io.IOException" %>
		<%@page import="java.sql.Statement"%>
		
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%! String name=null; %>
   <%! String email=null; %>
   <%
	 name =(String) session.getAttribute("name");
   	 email = (String) session.getAttribute("email");
	if(name!=null)
	{

%>

<head>
<meta charset="ISO-8859-1">
<title>My Shop - AdminPage</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

 <style>
        .row .card:hover{
           background-color:#e2e2e2;
           cursor:pointer;
        }
		#btn{
		font-weight:bold;
		}        
         #btn:hover
        {
        	
        	background-color:green;
        }
    </style>
    <%@include file="component/componentFile.jsp" %>
</head>
    
<body style="background-color: aqua;">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" >
  <a class="navbar-brand shadow" href="index.jsp?id=all">My Shop</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse "  id="navbarSupportedContent">

    <ul class="navbar-nav   mr-auto">
      <li class="nav-item  " >
        <a class="nav-link text-white" href="index.jsp?id=all">Home <span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
  
  
  

   

		
		<div class="nav-item" style="margin-top:-0.5rem;margin-bottom:-0.5rem;" id="navbarDropdown">
		<a class="nav-link  text-white " href="#" data-toggle="modal" data-target="#Admin">
         <i class="bi bi-person-circle " style="font-size:1.5rem;"></i>
        </a>
		</div>
		<div class="nav-item" style="margin-top:-0.5rem;margin-bottom:-0.5rem;">
		
		 
         <a href="LogOut" class="nav-link  text-white btn btn-dark p-1" style="float: right;"><i class="bi bi-box-arrow-in-right"></i> Log Out</a>
        
		</div>
		
     	
     	


   
  	
  </div>
</nav>
	<!-- 
       <div class="card bg-lite" style="width: 18rem;height:18rem;display: none;z-index:4000;float:right;margin-right:1rem;margin-top:3rem;" id="usercard">
        <div class="card-title" style="margin-left: 1rem;margin-top:0.4rem;font-weight: bold;">Personal</div>
       
        <div class="card-body text-center">
          <img src="images/User-Icon.jpg" alt="" width="40%" height="50%" style="margin:auto;">
           <div class="card-title" style="font-weight: bold;"><%=name %></div>
           <div class="card-title" style="margin-top: -.6rem;"><%=email %></div>
           <div class="card-text "><a href="#"  style="font-size: 0.8rem;text-decoration: underline;float: left;">Manage Profile Settings</a></div>
           
        </div>
        
    </div>
  -->
    <div class="modal" tabindex="-1" role="dialog" id="Admin">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">Admin Info</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <img src="images/User-Icon.jpg" alt="" width="30%" height="40%" style="margin:auto;"><br>
           <div  style="font-weight: bold;"><%=name %></div><br>
           <div  style="font-weight: lighter;margin-top: -.6rem;"><%=email %></div><br><br>
          <div class="btn btn-success text-white p-1"  style="float: left;text-decoration:none;"><a href="#" style="text-decoration:none;font-size:0.8rem;"  class="text-white"><i class="bi bi-patch-question-fill"></i> Manage Profile Settings</a></div>
           
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


  
    


    <div class="" style="margin-top: 6rem;" >
    
<%
	String s = (String)session.getAttribute("sucess");
	//out.print(s);
	if(s!=null)
	{
%>
<div class="alert alert-warning alert-dismissible">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong><%=s %></strong>
</div>
<%
	session.removeAttribute("sucess");
	}
%>
		
		<%
			int count=0;
			int count1=0;
			int count2=0;
			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conismy = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
			String qrismy = "select name from user";
			Statement stismy = conismy.createStatement();
			ResultSet rsismy = stismy.executeQuery(qrismy);
			//rsismy.absolute(1);
			if(rsismy.next())
			{
			do
			{
				count++;
				
			}while(rsismy.next());
			}
			String qrismy1 = "select id from category";
			Statement stismy1 = conismy.createStatement();
			ResultSet rsismy1 = stismy.executeQuery(qrismy1);
			//rsismy1.absolute(1);
			if(rsismy1.next())
			{
			do
			{
				count1++;
				
			}while(rsismy1.next());
			}
			String qrismy2 = "select id from product";
			Statement stismy2 = conismy.createStatement();
			ResultSet rsismy2 = stismy.executeQuery(qrismy2);
			//rsismy2.absolute(1);
			if(rsismy2.next())
			{
			do
			{
				count2++;
				
			}while(rsismy2.next());
			
			}
			System.out.println(count1+" "+count2);
			conismy.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		%>
    
        <div class="row my-3" style="border-radius: 1rem; align-items: center;justify-content: center; ">
        
       
            <div class="col-sm-2 card mr-2 " style="align-items: center;border: 1px solid black; text-align: center;">
                <img class="card-img-top my-3" src="./images/man.png" alt="Card image cap" style="width: 30%; height:50%; border-radius: 50;">
                <div class="card-body " style="margin-top: -1.5rem;">
                    <span class="card-title" style="font-size: 2rem;"><%=count %></span>
                    <div class="card-title" style="font-size: 1.5rem;font-weight: lighter;">USERS</div>
                </div>
            </div>
            <div class="col-sm-2 card mr-2 " style="align-items: center;border: 1px solid black; text-align: center;">
                <img class="card-img-top my-3" src="./images/more.png" alt="Card image cap" style="width: 30%; height:50%; border-radius: 50;">
                <div class="card-body " style="margin-top: -1.5rem;">
                    <span class="card-title" style="font-size: 2rem;"><%=count1 %></span>
                    <div class="card-title" style="font-size: 1.5rem;font-weight: lighter;">CATEGORIES</div>
                </div>
            </div>
            <div class="col-sm-2 card mr-2 " style="align-items: center;border: 1px solid black; text-align: center;">
                <img class="card-img-top my-3" src="./images/delivery-box.png" alt="Card image cap" style="width: 30%; height:50%; border-radius: 50;">
                <div class="card-body " style="margin-top: -1.5rem;">
                    <span class="card-title" style="font-size: 2rem;"><%=count2 %></span>
                    <div class="card-title" style="font-size: 1.5rem;font-weight: lighter;">PRODUCTS</div>
                </div>
            </div>
            </div>
            
            
            <div class="row my-3" style="border-radius: 1rem; align-items: center;justify-content: center; ">
            
            
                <div class="col-sm-2 card mr-2 " data-toggle="modal" data-target="#AddCategory" style="align-items: center;border: 1px solid black; text-align: center;">
                    <img class="card-img-top my-3" src="./images/plus.png" alt="Card image cap" style="width: 30%; height:50%; border-radius: 50;">
                    <div class="card-body " style="margin-top: -1.5rem;">
                        <span class="card-title" style="font-size: 0.8rem;">click here to add category</span>
                        <div class="card-title" style="font-size: 1.5rem;font-weight: lighter;">ADD CATEGORY</div>
                    </div>
                </div>
                <div class="col-sm-2 card mr-2 " data-toggle="modal" data-target="#AddProduct" style="align-items: center;border: 1px solid black; text-align: center;">
                    <img class="card-img-top my-3" src="./images/sticker.png" alt="Card image cap" style="width: 30%; height:50%; border-radius: 50;">
                    <div class="card-body " style="margin-top: -1.5rem;">
                        <span class="card-title" style="font-size: 0.8rem;">click here to Add product</span>
                        <div class="card-title" style="font-size: 1.5rem;font-weight: lighter;">ADD PRODUCT</div>
                    </div>
                </div>
                <div class="col-sm-2 card mr-2 " data-toggle="modal" data-target="#showproduct" style="align-items: center;border: 1px solid black; text-align: center;">
                    <img class="card-img-top my-3" src="./images/refresh.png" alt="Card image cap" style="width: 30%; height:50%; border-radius: 50;">
                    <div class="card-body " style="margin-top: -1.5rem;">
                        <span class="card-title" style="font-size: 0.8rem;">click here to show product</span>
                        <div class="card-title" style="font-size: 1.3rem;font-weight: lighter;">show product</div>
                    </div>
        
                </div>
                   
           
				</div>
				
				 <div class="row my-3" style="border-radius: 1rem; align-items: center;justify-content: center; ">
            
            	<div class="col-sm-2 card mr-2 " data-toggle="modal" data-target="#addcloth" style="align-items: center;border: 1px solid black; text-align: center;">
                    <img class="card-img-top my-3" src="./images/plus.png" alt="Card image cap" style="width: 30%; height:50%; border-radius: 50;">
                    <div class="card-body " style="margin-top: -1.5rem;">
                        <span class="card-title" style="font-size: 0.8rem;">click here to Add Cloth</span>
                        <div class="card-title" style="font-size: 1.5rem;font-weight: lighter;">Add Cloth</div>
                    </div>
                </div>
                <div class="col-sm-2 card mr-2 " data-toggle="modal" data-target="#showUser" style="align-items: center;border: 1px solid black; text-align: center;">
                    <img class="card-img-top my-3" src="./images/plus.png" alt="Card image cap" style="width: 30%; height:50%; border-radius: 50;">
                    <div class="card-body " style="margin-top: -1.5rem;">
                        <span class="card-title" style="font-size: 0.8rem;">click here to Show User</span>
                        <div class="card-title" style="font-size: 1.5rem;font-weight: lighter;">Show User</div>
                    </div>
                </div>
               
                   
           
				</div>
				
				
                   
           
				
    </div>


<%
	//session.removeAttribute("name");
	}
	else 
	{
		session.setAttribute("adminmessage", "You Are Not Loged In! please Login First");
		response.sendRedirect("AdminLogin.jsp");
	
	}
%>


<!-- Add Category Model start -->
<%@include file="component/addcategory.jsp" %>	
<!-- Add Category Model end -->

  
  
 <!-- Add product Model start --> 
  <%@include file="component/addproduct.jsp" %>
 <!-- Add product Model end -->
  
  
  
  
  <!--  show product Start from here  -->

<%@include file="component/showproduct.jsp" %>

  <!--  show product End Here -->  
  
  <!-- show users start here -->
  
  <%@include file="component/showuser.jsp" %>
<!-- Show users end here  -->




<!-- Add Cloth start here  -->
 
 <%@include file="component/addcloth.jsp" %>

 <!-- Add Cloth end here  -->
</body>