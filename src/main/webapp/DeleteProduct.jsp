<%@page import="java.io.IOException"%>
  <%@page import="java.sql.Connection"%>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
 <%@page import="java.io.PrintWriter"%>
 
 
 <%
	 int id = Integer.parseInt(request.getParameter("idisde"));
 	 String email = (String)session.getAttribute("email");
 	 
 	System.out.println(id);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
		String qr = "delete from cart where id=? and email=?";
		PreparedStatement st = con1.prepareStatement(qr);
		st.setInt(1, id);
		st.setString(2, email);
		st.executeUpdate();
		
		con1.close();
		
		response.sendRedirect("index.jsp");
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
 
 %>