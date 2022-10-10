
	<%@page import="java.sql.Connection" %>
    	<%@page import="java.sql.DriverManager" %>
    	<%@page import="java.sql.ResultSet" %>
    	<%@page import="java.io.IOException" %>
		<%@page import="java.sql.Statement"%>

<div class="modal fade" id="showUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width:100%">
  <div class="modal-dialog" role="document" >
    <div class="modal-content" style="width:70rem;margin-left:-20rem">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">All Users</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
    
        <table class="table table-bordered" >
  

  	<%
  		Class.forName("com.mysql.jdbc.Driver");
  		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
  		String qer = "select * from user";
  		Statement s =connection.createStatement();
  		ResultSet resultset = s.executeQuery(qer);
  		//resultset.relative(1);
  		if(resultset.next())
  		{
  			%>
  			<thead >
    <tr>
      <th scope="col">S.No.</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Number</th>
      <th scope="col">Password</th>
      <th scope="col">Address</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody >
  			<%
  			int id = 0;
  			
  			do
  			{
  				id++;
  		  		String name = resultset.getString("name");
  		  		String email = resultset.getString("email");
  		  		String number = resultset.getString("number");
  		  		String password = resultset.getString("password");
  		  		String address = resultset.getString("address");
		  		
		  		
		  		
  		  		
  		  		
  			
  	%>
  	
    <tr >
   
  	
   
      <td ><%=id %></td>
      <td><%=name %></td>
      <td><%=email %></td>
      <td><%=number %></td>
      <td><%=password %></td>
      <td><%=address %></td>
   	 
   	 <td>
    <a href="UpdateDeleteUser?email=<%=email %>" class="btn btn-danger">Delete</a>
   </td>
 
    
    </tr>
    
   <%
  			}while(resultset.next());
  			connection.close();
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