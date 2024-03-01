<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user1=(User)session.getAttribute("current-user");
    if(user1==null){
        session.setAttribute("message","you are not logged in !! Login first ");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user1.getUserType().equals("admin")){
            session.setAttribute("message","You are not user !! Do not acces this page ");
            response.sendRedirect("login.jsp");
            return;
        }
    }
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
        
        <h2 class="text-center my-5">Welcome <%=user1.getUserName()%> ! </h2>
        <h3 class="text-center my-5"><a href="index.jsp"> Click Here</a> To Continue Your Shopping</h3>
        
         <%@include file="components/common_modals.jsp" %>
            <script src="js/newjavascript.js" charset="UTF-8"></script>
        
    </body>
</html>
