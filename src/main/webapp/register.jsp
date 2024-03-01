<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User register</title>
        <%@include file="/components/component_css_js.jsp" %>
    </head>
    <body>
        <%@include file="/components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row my-5">
            <div class="col-md-4 offset-4 ">
                <div class="card" style="box-shadow: 10px 10px 15px #000000;">
                    
                    <%@include file="components/message.jsp" %>
                    
                    <div class="card-body px-5">
                        <div class="text-center"><img src="img/registration.png" width="15%" height="15%"/></div>
                        <h3 class="text-center my-0.5">Sign up here!!!</h3>
                        <form action="RegisterServlet" method="POST">
                                <div class="form-group"> 
                                  <label for="name">User name</label>
                                  <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group"> 
                                  <label for="email">User Email</label>
                                  <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group"> 
                                  <label for="password">User password</label>
                                  <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group"> 
                                  <label for="phone">User phone</label>
                                  <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>
                                <div class="form-group"> 
                                  <label for="address">User address</label>
                                  <textarea name="user_address" style="height:100px;" class="form-control"  aria-describedby="emailHelp" placeholder="Enter your address"></textarea>
                                </div>
                                
                                   <a href="login.jsp" class="d-block text-center my-2">Already registered click here</a>
                            
                                <div class="container text-center">
                                  <button class="btn btn-outline-success">Register</button>
                                  <button class="btn btn-outline-warning">Reset</button>
                                </div>

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
