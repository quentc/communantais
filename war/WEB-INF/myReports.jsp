<%@ page pageEncoding="UTF-8" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <jsp:include page="/includes/menu_top.jsp" />
<body>
   	<div class="container"> 
		<h3>Mes incidents reportés</h3>
			<jsp:include page="/includes/listProblems.jsp">
				<jsp:param name="panelClass" value="panel panel-warning" />
			</jsp:include>
       </div>  
       
</body>
</html>