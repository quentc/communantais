<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>
<%
String lat =  (String) request.getAttribute("lat") ;
%>
<!DOCTYPE html>
<html>
 <jsp:include page="/includes/menu_top.jsp" />
    <body>   
   	<div class="container">
        <h3>
            Détails du problème ${lat}
        </h3>
       </div>   
    </body>
</html>