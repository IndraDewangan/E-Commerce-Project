<%@page import="java.util.Map"%>
<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user1=(User)session.getAttribute("current-user");
    if(user1==null){
        session.setAttribute("message","you are not logged in !! Login first ");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user1.getUserType().equals("normal")){
            session.setAttribute("message","You are not admin !! Do not acces this page ");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%
                              CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                              List<Category> list = cdao.getCategory();
                              
                              Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/components/component_css_js.jsp" %>
    </head>
    <body>
        <%@include file="/components/navbar.jsp" %>
        
        <div class="container mt-5 ">
            
            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
            </div>
            
            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card admin">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 110px;" src="img/teamwork.png"/>
                            </div>
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                            
                        </div>
                    </div>                    
                </div>
                
                <div class="col-md-4">
                    <div class="card admin" >
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 110px;" src="img/products.png"/>
                            </div>
                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Product</h1>
                            
                        </div>
                    </div>                     
                </div>
                
                <div class="col-md-4">
                    <div class="card admin" >
                        <div class="card-body text-center">
                            <div class="container ">
                                <img class="img-fluid rounded-circle" style="max-width: 110px;" src="img/categories.png"/>
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Category</h1>
                            
                        </div>
                    </div>                    
                </div>
            </div>
            <div class="row my-5">
                <div class="col-md-6">
                    <div class="card admin" data-toggle="modal" data-target="#exampleModal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 110px;" src="img/add-item.png"/>
                            </div>
                            <p class="mt-3">click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                            
                        </div>
                    </div> 
                    
                </div>
                <div class="col-md-6">
                    <div class="card admin" data-toggle="modal" data-target="#exampleModa2">
                        <div class="card-body text-center">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 110px;" src="img/apps.png">
                            </div>
                            <p class="mt-3">click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                            
                        </div>
                    </div> 
                    
                </div>               
            </div>
        </div>
        
        
        
        
        
        
        

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title " id="exampleModalLabel">Fill Product Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <form action="ProductOperationServlet" method="POST" enctype="multipart/form-data">
                          
                           <input type="hidden" name="operation" value="addproduct" />
                          
                          <div class="form-group">
                              <input type="text" name="pName" placeholder="Enter title of product" class="form-control" required />
                          </div>
                          
                          <div class="form-group">
                              <textarea style="height: 150px;" name="pDesc" placeholder="Enter product description" class="form-control" required></textarea>
                          </div>
                          
                          <div class="form-group">
                              <input type="number" name="pPrice" placeholder="Enter Product Price" class="form-control" required />
                          </div>
                          
                          <div class="form-group">
                              <input type="number" name="pDiscount" placeholder="Enter Product Discount" class="form-control" required />
                          </div>
                          <div class="form-group">
                              <input type="number" name="pQuantity" placeholder="Enter Product Quantity" class="form-control" required />
                          </div>                          
                                                  
                          <div class="form-group">
                              <select name="catId" class="form-control" id="">                                  
                                  <%for(Category c:list){%>
                                        <option value=<%= c.getCategoryId()%>><%= c.getCategoryTitle()%></option>
                                  <%}%>
                                  
                              </select>
                          </div>
                          
                          <div class="form-group">
                              <label for="pPic">select picture of product</label>
                              <br>
                              <input type="file" name="pPic" required />
                          </div>                      
                                                   
                           
                          <div class="container text-center">
                              <button class="btn btn-outline-success">Add Product</button>
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                      </form>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            <div class="modal fade" id="exampleModa2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title " id="exampleModalLabel">Fill Category Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <form action="ProductOperationServlet" method="POST">
                          
                          <input type="hidden" name="operation" value="addcategory">
                          
                          <div class="form-group">
                              <input typre="text" name="catTitle" placeholder="Enter category title" class="form-control" required>
                          </div>
                          <div class="form-group">
                              <textarea style="height: 250px;" name="catDescription" placeholder="Enter category Description" class="form-control" required></textarea>
                          </div>
                          <div class="container text-center">
                              <button class="btn btn-outline-success">Add Category</button>
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                      </form>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            <%@include file="components/common_modals.jsp" %>
            <script src="js/newjavascript.js" charset="UTF-8"></script>
            
    </body>
</html>
