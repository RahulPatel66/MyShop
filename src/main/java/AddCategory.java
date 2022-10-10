import java.io.IOException;
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
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		String Title = request.getParameter("catTitle");
		String Description = request.getParameter("catDescription");
		
		System.out.println(Title);
		System.out.print(Description);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
			String qr = "insert into category values(0,?,?)";
			PreparedStatement  st = con.prepareStatement(qr);
			st.setString(1, Title);
			st.setString(2, Description);
			int i=st.executeUpdate();
			con.close();
			
				HttpSession session = request.getSession();
				session.setAttribute("sucess", "Product Added Successfully");
				response.sendRedirect("Admin.jsp");
//			}
//			
//			else
//			{
//				HttpSession session = request.getSession();
//				session.setAttribute("sucess", "Somthin is Wring! Product is not Added! please Try Again");
//				response.sendRedirect("Admin.jsp");
//			}
		}
		catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e)
		{
			HttpSession session = request.getSession();
			session.setAttribute("sucess", "Your Category Already Present");
			response.sendRedirect("Admin.jsp");
		}
		
		catch(Exception e)
		{
			HttpSession session = request.getSession();
			session.setAttribute("sucess", "Somthin is Wring! Product is not Added! please Try Again");
			response.sendRedirect("Admin.jsp");
		}
	}

}
