<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
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
      <div class="container-fluid" > 
        <div class="row mt-3 mx-2">
            
            <% 
                String cat=request.getParameter("category");
                
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;
                
                if(cat==null || cat.trim().equals("All") ){
                     list=dao.getAllProducts();                   
                }else{
                    int cid=Integer.parseInt(cat.trim());
                    list=dao.getAllProductsById(cid);
                }
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist=cdao.getCategory();
            %>
            
            
            
            <div class="col-md-2 ">
                
                <div class="list-groupv mt-4">
                 <a href="index.jsp?category=All" class="list-group-item list-group-item-action active" style="background:#8D64ED; border-color:#8D64ED">
                    All Products
                 </a>
               </div>
                
                <%
                    for(Category c : clist){
                %>
                    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
                <%
                    }
                %>
                
            </div>
            
             <div class="col-md-10">
                 <div class="row mt-4">
                     <div class="col-md-12">
                         
                         <div class="card-columns">
                                                         
                           <%
                              for(Product p : list){
                           %>
                           
                           <div class="card admin" >
                               <div class="container text-center">
                                   <img src="img/products/<%= p.getpPhoto()%>" style="max-height:250px; max-width: 100%; width:auto;" class="card-img-top m-2" alt="...">   
                               </div>
                               <div class="card-body">
                                   
                                   <h5 class="card-title"><%= p.getpName()%></h5>
                                   
                                   <P class="card-text">
                                       <%= Helper.get10Words(p.getpDesc()) %>
                                   </P>
                                    
                                   
                               </div>
                                   
                                   <div class="card-footer">
                                       <button class="btn custom-bg text-white AddCart" onclick="add_to_cart(<%= p.getpId()%> , '<%= p.getpName()%>', <%= p.getPriceApplyingDiscount()%>)">Add to Cart</button>
                                       <button class="btn btn-outline-primary">&#8377; <%= p.getPriceApplyingDiscount() %>/- <span class="text-secondary" style="font-size: 15px; font-style:italic;">,&#8377; <%=p.getpPrice()%>/- <%= p.getpDiscount()%>% off </span></button>
                                   </div>
                               
                               
                               
                           </div>
                             
                           <%}
                                if(list.size()==0){
                                      out.println("<h4>No product available</h4>");
                                }
                           
                           
                           
                           %> 
                             
                             
                         </div>
                         
                         
                     </div>
                 </div>
                 
                
            </div>
        </div>
      </div>
                           
                         
                           <%@include file="components/common_modals.jsp" %>
        
                           <script src="js/newjavascript.js" charset="UTF-8"></script>
    </body>
</html>
