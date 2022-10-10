

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		response.setContentType("text/html");
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
			String qr = "select * from admin where email=?";
			
			java.sql.Statement s = con.createStatement();
			PreparedStatement st = con.prepareStatement(qr);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			rs.relative(1);
			String email1 = rs.getString("email");
			String name=rs.getString("name");
			String password1 = rs.getString("password");
			
			if(email.equals(email1)&& password.equals(password1))
			{
				HttpSession session = request.getSession();
				session.setAttribute("name",name);
				session.setAttribute("email", email1);
				session.setAttribute("Admin", "Admin");
				response.sendRedirect("Admin.jsp");
			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("adminmessage", "Password is Wrong! Please Try Again");
				response.sendRedirect("AdminLogin.jsp");
			}
			
			con.close();
		}
		catch(java.sql.SQLException e)
		{

			HttpSession session = request.getSession();
			session.setAttribute("adminmessage", "Email is Wrong! Please Try Again");
			response.sendRedirect("AdminLogin.jsp");
		}
		catch(Exception e)
		{
			HttpSession session = request.getSession();
			session.setAttribute("adminmessage", "Somthing is Wrong! Please Try Again After Some Time");
			response.sendRedirect("AdminLogin.jsp");
		}
	}

}
