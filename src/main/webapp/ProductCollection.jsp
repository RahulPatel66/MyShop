  <%@page import="java.io.IOException"%>
  <%@page import="java.sql.Connection"%>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
 <%@page import="java.io.PrintWriter"%>
 <style>
 .listitem:hover
 {
 	background-color:blue;
 	color:white;
 }
 </style>
  <section style="" id="collection">
  <h2 class="text-center text-white p-2" style="background:radial-gradient(circle,red,blue,yellow);">Electronics Item Page</h2>
  
    	
    <div class="row " id="Collection"  >
        <div class="col-sm-2  mt-2"  >
            <div class="list-group">
                <a href="index.jsp?id=all" class="list-group-item bg-success text-white text-center list-group-item-action disabled">
                  CATEGORY LIST
                </a>
                <a href="index.jsp?id=all" class="list-group-item list-group-item-action text-center listitem list "  >All</a>
                
                
    <%
    	try
  		{
    		
    
    	Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
		String qr = "select * from category";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(qr);
		if(rs.next())    	
		{
		
		do
		{
		
		int category = rs.getInt("id");
		String categroy1 = rs.getString("title");
  	%>
                <a href="index.jsp?id=<%=category %>" class="list-group-item list-group-item-action text-center listitem " ><%=categroy1 %></a>
			<%
                
				}while(rs.next());
				}
  				con.close();
  		}catch(Exception e)
    {
  			
  			e.printStackTrace();			
    }
                %>
              </div>
       </div>
        <div class="col-sm-10" >
           <div class="row mt-2 ">

                    <div class="col-sm-12 ">


                        <div class="card-columns " >
                        
                        <%
                        String  prid =null;
                        prid = request.getParameter("id");
                        String email =(String) session.getAttribute("email"); 
                       // System.out.println(email);
                        
                        try{
                           	Class.forName("com.mysql.jdbc.Driver");
                   				Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3307/myshop","root","rahulpatel");
                   				String qr1="";
                   				ResultSet rs1=null;
                   				 if(prid==null)
                				{
                   					 qr1 = "select * from product";
                           		     Statement st1 = con1.createStatement();
                           			  rs1 = st1.executeQuery(qr1);
                				}
                   				else if(prid.equals("all"))
                   				{
                           		 qr1 = "select * from product";
                       		     Statement st1 = con1.createStatement();
                       			  rs1 = st1.executeQuery(qr1);
                   					
                   				}
                   				
                   				else
                   				{
                   					qr1 = "select * from product where cid=?";
                   					
                           		    PreparedStatement st1 = con1.prepareStatement(qr1);
                           		    int prid1 = Integer.parseInt(prid);
                           		    st1.setInt(1, prid1);
                       				rs1 = st1.executeQuery();
                   				}
                   				
                   				if(rs1.next())
                   				{
           						do
           						{
           						
           						int proid = rs1.getInt("id");
           						String title = rs1.getString("ptitle");
                   				String description = rs1.getString("description");
                   				String  photo = rs1.getString("photo");
                   				float price = rs1.getFloat("price");
                   				float discount = rs1.getFloat("discount");
                   				int quantity= rs1.getInt("quantity");
                   				int cid = rs1.getInt("cid");
                   		
                   				float Min_Prince=(discount/100)*price;
                   				String description1 = description.substring(0, 20);
                   				String description2 = description.substring(20);
                       	 
                        %>
                            <div class="card mr-0" style="width:22rem;">
                              <img class="card-img-top " src="./productimage/<%=photo %>" alt="Card image cap" style="width:350px;height:350px">
                              <div class="card-body">
                                <h5 class="card-title"><%=title %></h5>
                                <p class="card-text"><span class="" style="color:black;font-weight:bold;font-size:1.5rem">&#8377; <%=price-Min_Prince %>  </span><span style="text-decoration: line-through;color:grey;"><%=price %></span><span style="color:green;margin-left:1rem;"> <%=discount%>% OFF</span></p>
                             	<p class="card-text">Order Now Total Item Left <span style="color:darkblue;font-weigth:bold;font-size:1.2rem;text-shadow:1px 1px green;">'<%=quantity %>'</span></p>
                             	 
                                <p class="card-text"> <a  class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   									<%=description1 %>
 									 </a>
                                <span class="dropdown-menu p-2 bg-dark text-white" style="" ><%=description2 %></span>
                                	 
  									
                                </p>
                                  <script type="text/javascript">
                                	$(document).ready(function(){
                                		$("#describebtn").click(function(){
                                			$("#descr").toggle();
                                			
                                		});
                                	});
                             
                                </script>
                                <%
                                String s = (String)session.getAttribute("email");
                                if(s!=null)
                                {
                                %>
                              <a href="BuyNow.jsp?id=<%=proid %>" class="btn btn-primary " target="_blank">Buy Now</a><a href="AddCart.jsp?idfirst=<%=proid %>" class="btn btn-primary " style="float:right;">Add To Cart</a>
                              <%
                                }
                                else
                                {
                              %>
                               <a href="#" class="btn btn-primary disabled" >Buy Now</a><a href="#" class="btn btn-primary disabled" style="float:right;">Add To Cart</a>
                              <%
                                }
                              %>
                              </div>
                            </div>
                            
                      
                          <%
                
						}while(rs1.next());
                        }
               				con1.close();
						
  						}catch(Exception e)
	 					 {
							e.printStackTrace();	
						  }
                %>  
                            
                           
                            
                          </div>

                        </div>
                    </div>
           </div>
        
       
    </div>
  </section>