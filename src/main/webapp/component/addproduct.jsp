
  	<div class="modal fade" id="AddProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title " id="exampleModalLabel">Add Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="text-white">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <form action="AddProduct" enctype="multipart/form-data" method="post">
  <div class="form-group">
    <label for="productName">Product Name</label>
    <input type="text" name="name" id="productName" class="form-control" placeholder="Enter Product Name Here" required>
  </div>
  <div class="form-group">
    <label for="productPrice">Product Price</label>
    <input type="number" name="price" id="productPrice" class="form-control" placeholder="Enter Product Price Here" required>
  </div>
   <div class="form-group">
    <label for="productdescount">Product Discount</label>
    <input type="number" name="discount" id="productdescount" class="form-control" placeholder="Enter Product Discount Here" required>
  </div>
  
  <script type="text/javascript">
  		$(document).ready(function()
  			{
  				$("#productdescount").keyup(function(){
  					 var a = parseFloat($("#productPrice").val());
                     var b = parseFloat($("#productdescount").val());
                     var c = (b/100)*a;
                     
                   
  					$("#persent").html(c);
  				});
  			
  			});
  </script>
  <span id="persent" class="form-group" style="float:right;margin-top:-1rem;color:green;"></span>
   <div class="form-group">
    <label for="productquantity">Product Quantity</label>
    <input type="number" name="quantity" id="productquantity" class="form-control" placeholder="Enter Product Quantity Here" required>
  </div>
  
   <div class="form-group">
    <label for="productquantity">Product Category</label>
    <select class="form-control" name="category">
    	<option>Select Category</option>
    	<%@page import="java.sql.Connection" %>
    	<%@page import="java.sql.DriverManager" %>
    	<%@page import="java.sql.ResultSet" %>
    	<%@page import="java.io.IOException" %>
    	
    	
    	<%
    	Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
		String qr = "select * from category";
		java.sql.Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(qr);
		if(rs.next())    	
		{
			
		do
		{
			
		int category = rs.getInt("id");
		String categroy1 = rs.getString("title");
		
    	%>
    	<option value="<%=category%>"><%=categroy1 %></option>
    	<%
		}while(rs.next());
		}
		con.close();
    	%>
    </select>
  </div>
   <div class="form-group">
    <label for="productImage">Product Image</label>
    <input type="file" name="Image"  accept=".jpg, .jpeg, .png, .webp" id="productImage" class="form-control" placeholder="Enter Product Image Here" required>
  </div>
  
  <div class="form-group">
    <label for="ProductDescription">Product Description</label>
    <textarea name="proDescription" id="ProductDescription" class="form-control"   placeholder="Enter Product Description Here" rows="3" cols="4" required></textarea>
    
  </div>
    
  <div class="form-group text-center">
  <button type="submit" class="btn btn-primary text-center"  id="btn">Submit</button>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn">Close</button>
      
      </div>
    </div>
  </div>
</div>
  