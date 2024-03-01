<% 
    User user1=(User)session.getAttribute("current-user");
    if(user1==null){
        session.setAttribute("message","you are not logged in !! Login first to access the checkout");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="/components/component_css_js.jsp" %>
    </head>
    <body>
        <%@include file="/components/navbar.jsp" %>
        
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                <!-- card-->
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center mb-5">Your Selected Items</h3>
                        <div class="cart-body">
                            
                        </div>
                        
                    </div>
                </div>            
                    
                </div>
                <div class="col-md-6">
                    <!-- form-->
                     <div class="card">
                    <div class="card-body">
                        <h3 class="text-center mb-5">Your Details For Order</h3>
                        
                        <form action="#">
                            
                             <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input value="<%= user1.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                             </div>
                               <div class="form-group">
                                <label for="name">Your Name</label>
                                <input value="<%= user1.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                              </div>
                              
                               <div class="form-group">
                                <label for="name">Your Contact</label>
                                <input value="<%= user1.getUserPhone() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Contact">
                              </div>
                              <div class="form-group">
                                <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                <textarea value="<%= user1.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Your Address" rows="3"></textarea>
                              </div>
                              <div class="container text-center">
                                  <button class="btn btn-outline-success">Order Now</button>
                                  <button class="btn btn-outline-primary"><a href="index.jsp">Continue Shopping</a></button>
                        </form>
                        
                        
                    </div>
                </div>
                    
                </div>
            </div>
        </div>
       
        <%@include file="components/common_modals.jsp" %>
        
                           <script src="js/newjavascript.js" charset="UTF-8"></script>
    </body>
</html>
