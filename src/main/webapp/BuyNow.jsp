<%@include file="component/componentFile.jsp" %>
 <%@page import="java.io.IOException"%>
  <%@page import="java.sql.Connection"%>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
 <%@page import="java.io.PrintWriter"%>
<div class="container">
  <div class="row mt-5">
   	 <%
   	 		int id = Integer.parseInt(request.getParameter("id"));
      		Class.forName("com.mysql.jdbc.Driver");
   			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
   			String qr = "select * from product where id=?";
   			PreparedStatement ps = con.prepareStatement(qr);
   			ps.setInt(1,id);
   			ResultSet rs = ps.executeQuery();
   			rs.absolute(1);
   			String name = rs.getString("ptitle");
   			String description = rs.getString("description");
   			String photo = rs.getString("photo");
   			float price = rs.getFloat("price");
   			float discount = rs.getFloat("discount");
   			int quantity = rs.getInt("quantity");
   			float aprice = price -(price*discount)/100;
   			con.close();
   			
   			String ar[] = description.split("|"); 
   					
      %>
    <div class="col-sm-5 m-auto" style="align-item:center;height:40rem;">
      <img class="card-img-top" src="./productimage/<%=photo %>" alt="Card image cap">
    </div>
    <div class="col-sm-6" style="height:40rem;">
      <div class="card" style="height:90%">
     
  		<div class="card-title ml-2 mt-3 " style="font-size:1.5rem;"><%=name %></div>
 	 <div class="card-body">
 	 <p class="card-text"> <span style="font-size:1.5rem;">&#8377; <%=aprice %>     </span><span style="text-decoration:line-through; color:grey;">&#8377;<%=price %></span><span style="margin-left:1rem;color:green;"><%=discount %> %</span></p>
 	 <p class="card-text">Total Item left: <span class="text-danger"><%=quantity %></span></p>
    <p class="card-text" style="line-height:2rem;">
   <%=description %>
</p>
<p class="card-text" style="line-height:2rem;">
   <%=description %>
</p>
    <a href="#" class="btn btn-primary">Buy Now</a>
  </div>
</div>
    </div>
    
  </div>
</div>
  