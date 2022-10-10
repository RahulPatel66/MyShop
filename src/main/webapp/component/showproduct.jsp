	<%@page import="java.sql.Connection" %>
    	<%@page import="java.sql.DriverManager" %>
    	<%@page import="java.sql.ResultSet" %>
    	<%@page import="java.io.IOException" %>
		<%@page import="java.sql.Statement"%>
<div class="modal fade" id="showproduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width:100%">
  <div class="modal-dialog" role="document" >
    <div class="modal-content" style="width:70rem;margin-left:-20rem">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">All Products</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
    
        <table class="table table-bordered" >
  

  	<%
  		Class.forName("com.mysql.jdbc.Driver");
  		Connection conisx = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
  		String qrisx = "select * from product";
  		Statement stisx = conisx.createStatement();
  		ResultSet rsisx = stisx.executeQuery(qrisx);
  		//rsisx.absolute(1);
  		if(rsisx.next())
  		{
  			%>
  			<thead >
    <tr>
      <th scope="col">id</th>
      <th scope="col">Name</th>
      <th scope="col">price</th>
      <th scope="col">description</th>
      <th scope="col">discount</th>
      <th scope="col">quantity</th>
      <th scope="col">Update</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody >
  			<%
  			
  			do
  			{
  				int id = rsisx.getInt("id");
  		  		String name = rsisx.getString("ptitle");
  		  		String description = rsisx.getString("description");
  		  		float price = rsisx.getFloat("price");
  		  		float discount = rsisx.getFloat("discount");
  		  		int quantity = rsisx.getInt("quantity");
  		  		
  		  		
  			
  	%>
  	<form action="UpdateDelete">
    <tr >
   
  	
   
      <td ><div class="form-group">
    <input type="text" class="form-control" name="id" value="<%=id%>" style="border:none;width:3rem;" >
    </div></td>
      <td><div class="form-group">
    <input type="text" class="form-control" name="name" value="<%=name%>" style="border:none;width:10rem;">
    </div></td>
      <td><div class="form-group">
    <input type="number" class="form-control" name="price" value="<%=price%>" style="border:none;width:6rem;">
    </div></td>
      <td><div class="form-group">
    <input type="text" class="form-control" name="description" value="<%=description%>" style="border:none;width:15rem;">
    </div></td>
      <td><div class="form-group">
    <input type="number" class="form-control" name="discount" value="<%=discount%>" style="border:none;width:5rem;">
    </div></td>
      <td><div class="form-group">
    <input type="number" class="form-control" name="quantity" value="<%=quantity%>" style="border:none;width:4rem;">
    </div></td>
   	 <td><div class="form-group">
   <input type="submit" class="btn btn-success" name="btn" value="Update" style="border:none;width:5rem;"> 
    </div></td>
   	 <td><div class="form-group">
    <input type="submit" class="btn btn-danger" name="btn" value="Delete" style="border:none;width:5rem;">
    </div></td>
 
    
    </tr>
    </form>
   <%
  			}while(rsisx.next());
  			conisx.close();
  		}
  		else
  		{
  			out.println("don`t have any product");
  		}
   %>
    
  </tbody>
  
</table>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>