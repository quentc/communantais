<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Problem" %>
<%@ page import="com.google.appengine.api.blobstore.*;" %>
<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	
	List<Problem> problems = (List<Problem>) request.getAttribute("problems");
		for (Problem problem : problems) {
%>
	<div class="${param.panelClass}" style="width:800px">
		<div class="panel-heading">
			<h3 class="panel-title"><a href="detailsProblem?coord=(<%=problem.getLat()%>,<%=problem.getLng()%>)"><%=problem.getSujet()%></a>&nbsp<span class="badge" style="margin-left:30px"><%=problem.getLike()  %><span class="glyphicon glyphicon-heart"/></span></h4>
			le <%=problem.getDateProblem()  %></h3>
		</div>
	 <div class="panel-body">
	 	<div style="float:left;">		 		
		 	<p><b>Catégorie : </b><%=problem.getCategorie()  %></p>
    		<p><b>Détails : </b><%=problem.getDetails()  %></p>
    		<p><b>Coordonnées du Communantais :</b></br>
    		<%
    		if(problem.getNom().equals(""))
    		{
    		%>
    		<em>Non renseignées</em>
    		<%
    		}
    		else
    		{
    		%>
    		<p>Nom : <%=problem.getNom()  %></p>
    		<p>Téléphone : <%=problem.getTelephone()  %> </p> 
    		<%
    		}
    		%>		
    		</p>
   		</div>
   		<div>
   			<img src="<%=problem.getUrlImage()  %>" style="float:right;width:180px;height:150px; margin-left:350px;"  />
   		</div>
 		</div>
	</div>
	<%
		}
	%>