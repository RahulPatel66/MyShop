
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet("/AddCloth")
public class AddCloth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String name = request.getParameter("clothName");
		String price = request.getParameter("clothPrice");
		String discount = request.getParameter("clothdescount");
		String quantity =request.getParameter("clothquantity");
		String category = request.getParameter("clothcategory");
		String Description = request.getParameter("clothDescription");
		String ProductType = request.getParameter("clothtype");
		
//		image upload in folder code 
		Part file = request.getPart("clothImage");
		String fileName = file.getSubmittedFileName();
		String uploadPath = "E:/java Project/MyShop/src/main/webapp/clothImage/"+fileName;
		System.out.print("file name is "+fileName);
		try
		{
			
			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
			String qr = "insert into cloths values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement  st = con.prepareStatement(qr);
			st.setInt(1,0);
			st.setString(2, name);
			st.setString(3, price);
			st.setString(4, discount);
			st.setString(5, Description);
			st.setString(6, ProductType);
			st.setString(7, category);
			st.setString(8, quantity);
			st.setString(9, fileName);
			
			st.executeUpdate();
			con.close();
			
			
			//add file in cloth image folder
			FileOutputStream fo = new FileOutputStream(uploadPath); 
			InputStream is = file.getInputStream();
			
			byte data[] = new byte[is.available()];
			is.read(data);
			fo.write(data);
			fo.close();
			
				HttpSession session = request.getSession();
				session.setAttribute("sucess", "product Added Successfully");
				response.sendRedirect("Admin.jsp");

		}
		catch(Exception e)
		{
			HttpSession session = request.getSession();
			session.setAttribute("sucess", "Somthin is Wring! Product is not Added! please Try Again");
			response.sendRedirect("Admin.jsp");
			System.out.println(e);
		}
	}

}
