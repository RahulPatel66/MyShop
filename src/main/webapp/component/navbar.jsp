

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background:indigo;">
  <a class="navbar-brand shadow" href="#">My Shop</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse "  id="navbarSupportedContent">

    <ul class="navbar-nav   mr-auto">
      <li class="nav-item  " >
        <a class="nav-link text-white" href="#Home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">
        <a class="nav-link text-white" href="#collection">Electronics</a>
      </li>  
       <li class="nav-item ">
        <a class="nav-link text-white" href="#Cloths">Cloths</a>
      </li>  
    </ul>
   <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2 p-0" type="search" placeholder="Search" aria-label="Search">
      <button class="btn  my-2 my-sm-0 p-0 pl-1 pr-1 bg-dark text-white" type="submit">Search</button>
    </form>
   <%! String name=null; %>
   <%! String email=null; %>
   <%! String Admin=null; %>
   <%
	 name =(String) session.getAttribute("name");
   	 email = (String) session.getAttribute("email");
   	 Admin = (String)session.getAttribute("Admin");
	if(name!=null )
	{
%>
		<div class="nav-item" style="margin-top:-0.5rem;margin-bottom:-0.5rem;">
		
		 <a class="nav-link  text-white " href="#" data-toggle="modal" data-target="#navbarDropdown" >
         <i class="bi bi-person-circle " style="font-size:1.5rem;"></i>
        </a>
		</div>
		
     	
  
<%
	
	}
	else if(name==null)
	{
%>

    <div class="nav-item dropdown " >
        <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
         <i class="bi bi-person-fill" style="margin-right:-0.4rem;"></i>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="UserSignUp.jsp">User</a>
   
          <a class="dropdown-item" href="AdminLogin.jsp">Admin</a>
          
        </div>
      </div>
  <%
  }
  %>
   <a class="nav-link text-white " href="#" data-toggle="modal" data-target="#AddToCard"> <i class="bi bi-cart-check-fill">Cart</i></a>
  	
  </div>
</nav>

       
    
    
    <!-- personal detail model start from here -->
    
    <div class="modal" tabindex="-1" role="dialog" id="navbarDropdown">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-family:cursue;">Personal Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center" style="align-item:center;justify-content:center;">
         <img src="images/User-Icon.jpg" alt="" width="40%" height="50%" class="">
           <div  style="font-weight: bold;"><%=name %></div>
           <div  style="margin-bottom: 1rem;"><%=email %></div>
           <div class="btn btn-success text-white p-1"  style="float: left;text-decoration:none;"><a href="#" style="text-decoration:none;font-size:0.8rem;"  class="text-white"><i class="bi bi-patch-question-fill"></i> Manage Profile Settings</a></div>
            <div class="btn btn-danger text-white p-1"  style="float: right;text-decoration:none;"><a href="LogOut" style="text-decoration:none;font-size:0.8rem;" class="text-white" ><i class="bi bi-box-arrow-right"></i> Log Out</a></div>
      </div>
      <div class="modal-footer">
      <%
      	if(Admin!=null)
      	{
      %>
      <div class="btn btn-dark text-white mr-auto p-1"  style="float: left;text-decoration:none;font-size:0.8rem;"><a href="Admin.jsp" style="text-decoration:none;"  class="text-white"><i class="bi bi-arrow-right-circle-fill"></i> Go To Admin Page</a></div>
      <%}
      
      %>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    
 <!-- personal detail model end from here -->
 
 
 
  <!-- Add To Card model start from here -->
  <%
  	if(name==null&&email==null)
  	{
  %>
  <div class="modal fade" id="AddToCard" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cart Item</h5>
           
      </div>
      <div class="modal-body text-danger">
        Please Login First! You Are Not Logged In
        
      </div>
      <div class="modal-footer">
      <a type="button" href="UserLogin.jsp" class="btn btn-primary">Log In</a>
       <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 <%@page import="java.io.IOException"%>
  <%@page import="java.sql.Connection"%>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
 <%@page import="java.io.PrintWriter"%>

 
 <%
  	}
  	else
  	{
 		
			

	try{
		    String email1 = (String)session.getAttribute("email");
		    
   			Class.forName("com.mysql.jdbc.Driver");
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
			
			String qr1 = "select * from cart where email=?";
		    PreparedStatement st1 = con1.prepareStatement(qr1);
		   	st1.setString(1, email1);
		    ResultSet rs1 =st1.executeQuery();
			rs1.absolute(1);
			

%>
   <div class="modal fade" id="AddToCard" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cart Item</h5> </div>
  		<%!float totalprice=0; %>
  		<%!float currentprice=0; %>
  		<%!int count=0; %>
        <%
        
        	if(rs1.next())
        	{
        		
    			
        	do
        	{
        		int id = rs1.getInt("id");
        		String title= rs1.getString("title");
        		float price = rs1.getFloat("price");
        		float discount = rs1.getFloat("discount");
        		float a =(discount/100)*price;
        		float actualprice = price-a;
        		totalprice += price;
        		currentprice+=actualprice;
        		count++;
        		
        %>
     	
      <div class="modal-body" >
        <p class="model-text"><Span style="font-size:0.8rem;"><%=title %></Span> <span >: &#8377; <%=actualprice %> </span> <span style="font-size:0.8rem;text-decoration:line-through;color:grey;">&#8377; <%=price %>-/-</span> </p>
        <p class="model-text"><a href="DeleteProduct.jsp?idisde=<%=id %>" class="btn btn-danger ml-1 py-1 px-2" style="float:right;font-size:0.8rem;" onMouseOver="this.style.backgroundColor='green'" onMouseOut="this.style.backgroundColor=''">Delete</a> <a href="#" class="btn btn-primary ml-1 py-1 px-2 " style="float:right;font-size:0.8rem;" onMouseOver="this.style.backgroundColor='green'" onMouseOut="this.style.backgroundColor=''">Buy</a></p>
      </div>
      
      
      <%      
        	}while(rs1.next());
        	}
        
		con1.close();
		

	}catch(Exception e)
	 {
	e.printStackTrace();	
}
      %>
  
      <div class="modal-body" style="align-item:center;border:1px solid black;display:none;">
      <p class="model-text text-primary" style="font-weight:bolde;"><span style="float:left;color:black;font-weight:bold;font-family:cursiue">Total Price</span><span style="font-size:0.8rem;text-decoration:line-through;color:grey;float:right;">&#8377; <%=0 %>-/-</span><span style="float:right;margin-left:1rem;margin-right:1rem;"> &#8377; <%=0 %>  </span></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary py-1 px-2" data-dismiss="modal" style="font-size:0.8rem">Close</button>
        <%
        	if(count>0)
        	{
        %>
        
        <button type="button" class="btn btn-primary py-1 px-2 " style="font-size:0.8rem;">Check Out</button>
        <%
        }
        	else
        	{
        %>
                <button type="button" class="btn btn-primary py-1 px-2 disabled" style="font-size:0.8rem">Check Out</button>
          <%
        	}
          %>
      </div>
    </div>
  </div>
</div>
<%
} 
%>
   <!-- Add To Card model end from here -->
   
   
   
   