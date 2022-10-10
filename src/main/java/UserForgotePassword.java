

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

/**
 * Servlet implementation class UserForgotePassword
 */
@WebServlet("/UserForgotePassword")
public class UserForgotePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String password = request.getParameter("password");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
			String qr = "select*from user Where email=? and number=?";
			
			PreparedStatement  st = con.prepareStatement(qr);
			st.setString(1, email);
			st.setString(2, number);
			
			ResultSet rs = st.executeQuery();
			rs.relative(1);
			String name1 = rs.getString("name");
			String email1= rs.getString("email");
			String number1 = rs.getString("number");
			if(name.equals(name1)&&email.equals(email1)&&number.equals(number1))
			{
				String qr1 = "UPDATE user SET password = ? WHERE email = ?";
				PreparedStatement st1 = con.prepareStatement(qr1);
				st1.setString(1, password);
				st1.setString(2, email);
				st1.executeUpdate();
				HttpSession session = request.getSession();
				session.setAttribute("message", "Succesfully Password Forgoted");
				response.sendRedirect("UserLogin.jsp");
			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("message", "Your Account is not Exixt! Please Try Again");
				response.sendRedirect("ForgotePassword.jsp");
			}
			con.close();
			
		}
		catch(java.sql.SQLException e)
		{

			HttpSession session = request.getSession();
			session.setAttribute("message", "Details is not Matched! Please Try Again");
			response.sendRedirect("ForgotePassword.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			HttpSession session = request.getSession();
			session.setAttribute("message", "Somthing! is Wrong Please Try Again");
			response.sendRedirect("ForgotePassword.jsp");
			
		}
	}

}
