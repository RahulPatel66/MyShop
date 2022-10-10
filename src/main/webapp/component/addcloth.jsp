<%@page import="java.io.*" %>
<div class="modal fade" id="addcloth" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title " id="exampleModalLabel">Add Cloth</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="text-white">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <form action="AddCloth" enctype="multipart/form-data" method="post">
  <div class="form-group">
    <label for="clothName">Product Name</label>
    <input type="text" name="clothName" id="clothName" class="form-control" placeholder="Enter Product Name Here" required>
  </div>
  <div class="form-group">
    <label for="clothPrice">Product Price</label>
    <input type="number" name="clothPrice" id="clothPrice" class="form-control" placeholder="Enter Product Price Here" required>
  </div>
   <div class="form-group">
    <label for="clothdescount">Product Discount</label>
    <input type="number" name="clothdescount" id="clothdescount" class="form-control" placeholder="Enter Product Discount Here" required>
  </div>
  
  <script type="text/javascript">
  		$(document).ready(function()
  			{
  				$("#productdescount").keyup(function(){
  					 var a = parseFloat($("#productPrice").val());
                     var b = parseFloat($("#productdescount").val());
                     var c = (b/100)*a;
                     
                   
  					$("#persentis").html(c);
  				});
  			
  			});
  </script>
  <span id="persentis" class="form-group" style="float:right;margin-top:-1rem;color:green;"></span>
   <div class="form-group">
    <label for="clothquantity">Product Quantity</label>
    <input type="number" name="clothquantity" id="clothquantity" class="form-control" placeholder="Enter Product Quantity Here" required>
  </div>
  
   <div class="form-group">
    <label >Product Category</label>
    <select class="form-control" name="clothcategory">
    	<option>Select Category</option>
    	
    	<option value="1">Man</option>
    	<option value="2">WoMan</option>
    	<option value="3">Child</option>
    	
    </select>
  </div>
   <div class="form-group">
    <label for="clothImage">Product Image</label>
    <input type="file" name="clothImage"  accept=".jpg, .jpeg, .png, .webp" id="clothImage" class="form-control" placeholder="Enter Product Image Here" required>
  </div>
  <div class="form-group">
    <label for="clothtype">Product Type</label>
    <input type="text" name="clothtype"  id="clothtype" class="form-control" placeholder="Enter Product type Here like shirt" required>
  </div>
  
  <div class="form-group">
    <label for="clothDescription">Product Description</label>
    <textarea name="clothDescription" id="clothDescription" class="form-control"   placeholder="Enter Product Description Here" rows="3" cols="4" required></textarea>
    
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
  
  