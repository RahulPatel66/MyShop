

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateDelete
 */
@WebServlet("/UpdateDelete")
public class UpdateDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		float discount = Float.parseFloat(request.getParameter("discount"));
		String description = request.getParameter("description");
		float price = Float.parseFloat(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		System.out.println("id"+id);
		if(btn.equals("Update"))
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
				String qr = "Update product set ptitle=?,description=?,price=?,discount=?,quantity=? where id =?";
				PreparedStatement st = con.prepareStatement(qr);
				st.setString(1, name);
				st.setString(2, description);
				st.setFloat(3, price);
				st.setFloat(4, discount);
				st.setInt(5, quantity);
				st.setInt(6, id);
				st.executeUpdate();
				
				response.sendRedirect("Admin.jsp");
				con.close();
			}
			catch(Exception e)
			{
				
				System.out.println("exception");
				
			}
		}
		else 
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
				String qr = "delete from product where id =?";
				PreparedStatement st = con.prepareStatement(qr);
				st.setInt(1, id);
				
				st.executeUpdate();
				
				response.sendRedirect("Admin.jsp");
				con.close();
			}
			catch(Exception e)
			{
				
				System.out.println("exception");
				
			}
		}
	}

}
