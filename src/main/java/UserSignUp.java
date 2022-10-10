

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserSignUp
 */
@WebServlet("/UserSignUp")
public class UserSignUp extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String number = request.getParameter("number");
			String password = request.getParameter("password");
			String address = request.getParameter("address");
			
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
				String qr = "insert into user values(?,?,?,?,?)";
				PreparedStatement  st = con.prepareStatement(qr);
				st.setString(1, name);
				st.setString(2, email);
				st.setString(3, number);
				st.setString(4, password);
				st.setString(5, address);
				st.executeUpdate();
				con.close();
				//System.out.print("success");
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				response.sendRedirect("index.jsp?id=all");
			}
			catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e)
			{
				HttpSession session = request.getSession();
				session.setAttribute("message", "your Account details Already! Exixst Please Login ");
				response.sendRedirect("UserSignUp.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
				HttpSession session = request.getSession();
				session.setAttribute("message", "Somthing! is Wrong Please Try Again");
				response.sendRedirect("UserSignUp.jsp");
				
			}
	}

}
