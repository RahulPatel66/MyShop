<div class="modal fade" id="AddCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title " id="exampleModalLabel">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="text-white">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<form action="AddCategory" method="get">
  <div class="form-group">
    <label for="catTitle">Category Title</label>
    <input type="text" name="catTitle" id="catTitle" class="form-control" placeholder="Enter Category Title Here" required>
  </div>
  <div class="form-group">
    <label for="address">Category Description</label>
    <textarea name="catDescription" id="address" class="form-control"   placeholder="Enter Address Here" rows="5" cols="4" required></textarea>
    
  </div>
    
  <div class="form-group text-center">
  <input type="submit" class="btn btn-primary text-center" value="Submit"  id="btn">
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn">Close</button>
      
      </div>
    </div>
  </div>
</div>
	