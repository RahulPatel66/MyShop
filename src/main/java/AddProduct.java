

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddProduct
 */
@MultipartConfig
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String name = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		float discount = Float.parseFloat(request.getParameter("discount"));
		int quantity =  Integer.parseInt(request.getParameter("quantity"));
		String category = request.getParameter("category");
		String Description = request.getParameter("proDescription");
		
//		image upload in folder code 
		Part file = request.getPart("Image");
		String fileName = file.getSubmittedFileName();
		String uploadPath = "E:/java Project/MyShop/src/main/webapp/productimage/"+fileName;

		try
		{
			
			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
			String qr = "insert into product values(?,?,?,?,?,?,?,?)";
			PreparedStatement  st = con.prepareStatement(qr);
			st.setInt(1,0);
			st.setString(2, name);
			st.setString(3, Description);
			st.setString(4, fileName);
			st.setFloat(5, price);
			st.setFloat(6, discount);
			st.setInt(7, quantity);
			st.setString(8, category);
			st.executeUpdate();
			con.close();
			
			FileOutputStream fo = new FileOutputStream(uploadPath); 
			InputStream is = file.getInputStream();
			
			byte data[] = new byte[is.available()];
			is.read(data);
			fo.write(data);
			fo.close();
			
				HttpSession session = request.getSession();
				session.setAttribute("sucess", "Product Added Successfully");
				response.sendRedirect("Admin.jsp");

		}
		catch(Exception e)
		{
			HttpSession session = request.getSession();
			session.setAttribute("sucess", "Somthin is Wring! Product is not Added! please Try Again");
			response.sendRedirect("Admin.jsp");
			e.printStackTrace();
		}
	}

}
