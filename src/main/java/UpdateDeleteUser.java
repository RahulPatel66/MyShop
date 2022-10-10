

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
 * Servlet implementation class UpdateDeleteUser
 */
@WebServlet("/UpdateDeleteUser")
public class UpdateDeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			String email = request.getParameter("email");
		
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
				String qr = "delete from user where email =?";
				PreparedStatement st = con.prepareStatement(qr);
				st.setString(1, email);
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
