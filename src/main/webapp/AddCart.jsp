
 <%@page import="java.io.IOException"%>
  <%@page import="java.sql.Connection"%>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
 <%@page import="java.io.PrintWriter"%>
<!--  get data from product -->
<%!int id; %>
<%!String title; %>
<%!String description; %>
<%!String  photo; %>
<%!float price; %>
<%!float discount; %>
<%!int quantity; %>
<%!int cid; %>

<%
	String id1 = request.getParameter("idfirst");
	String id2 = request.getParameter("idsecond");
	String email1 = (String)session.getAttribute("email");
	System.out.print(email1);

	try{
   			Class.forName("com.mysql.jdbc.Driver");
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
			//id = id1;
			int id3;
			
			String qr1=null;
			if(id1!=null&&id2==null)
			{
				id3 =Integer.parseInt(request.getParameter("idfirst"));
				 qr1 = "select * from product where id=?";				
			}
			else
			{
				System.out.println("else is running");
				id3=Integer.parseInt(request.getParameter("idsecond"));
				 qr1 = "select * from cloths where id=?";
			}
		    PreparedStatement st1 = con1.prepareStatement(qr1);
		    st1.setInt(1, id3);
		    ResultSet rs1 = st1.executeQuery();
			rs1.absolute(1);
			 
		
			 id = rs1.getInt("id");
			 if(id1!=null&&id2==null)
			 {
				title = rs1.getString("ptitle");
			   description = rs1.getString("description");
			 }
			 else
			 {
				title = rs1.getString("name");
			  description = rs1.getString("details");
			 }
			  photo = rs1.getString("photo");
			 price = rs1.getFloat("price");
			 discount = rs1.getFloat("discount");
			quantity= rs1.getInt("quantity");
			 cid = rs1.getInt("cid");
	
			float Min_Prince=(discount/100)*price;
			String description1 = description.substring(0, 20);
			String description2 = description.substring(20);
			
			con1.close();
			

		}catch(Exception e)
		 {
		e.printStackTrace();	
	  }


%>

<!--  set data from cart -->
<%


try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");

	String qr = "insert into cart values(?,?,?,?,?,?,?,?)";
    PreparedStatement st = con.prepareStatement(qr);
    st.setInt(1,id);
    st.setString(2, email1);
    st.setString(3, title);
    st.setString(4, description);
    st.setString(5, photo);
    st.setFloat(6, price);
    st.setFloat(7, discount);
    st.setInt(8, quantity);
	st.executeUpdate();
	con.close();
	
	response.sendRedirect("index.jsp");


}catch(Exception e)
 {
e.printStackTrace();	
}



%>