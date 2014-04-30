/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package appliWeb;

import java.io.IOException;








//Imports Google
import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.Result;
import com.googlecode.objectify.cmd.Query;

import static com.googlecode.objectify.ObjectifyService.ofy;








//Java libraries
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;











import beans.Problem;

/**
 *
 * @author Kent
 */
@SuppressWarnings("serial")
public class DetailsProblem extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait conna�tre la classe-entit� � Objectify
    }
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{    	
        
        try {
            
              HttpSession session = request.getSession(true);
              
              if(request.getParameter("coord") != null)
              {
                  String coord  = (String) request.getParameter("coord");
                  String coord1 = coord.replace("(", "");
                  String coord2 = coord1.replace(")", "");
                  String str[]=coord2.split(",");
                  String latProblem = str[0];
                  String lngProblem = str[1];  

                  //Problem problem = ofy().load().type(Problem.class).filter("lat", latProblem).first().now();
                  List<Problem> problem = ofy().load().type(Problem.class).filter("lat", latProblem).list(); 
                  session.setAttribute("problemeEnCours", problem.get(0));
                  request.setAttribute("problem", problem);
                  request.setAttribute( "coord", request.getParameter("coord") );
              }
              else
              {
                  Problem problem = (Problem) session.getAttribute("problemeEnCours");  
                  request.setAttribute("problem", problem);
              }

            this.getServletContext().getRequestDispatcher( "/WEB-INF/detailsProblem.jsp" ).forward( request, response );
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    } 
    }
