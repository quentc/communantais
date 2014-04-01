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

import static com.googlecode.objectify.ObjectifyService.ofy;

//Java libraries
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;




import beans.Problem;

/**
 *
 * @author Kent
 */
@SuppressWarnings("serial")
public class DetailsProblem extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait connaître la classe-entité à Objectify
    }
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{    	
        
        try {
            String coord  = request.getParameter("coord");
            String coord1 = coord.replace("(", "");
            String coord2 = coord1.replace(")", "");
            String str[]=coord2.split(",");
            
            Query<Problem> q = ofy().load().type(Problem.class);
            q = q.filter("lat", str[0]);
            q = q.filter("lng", str[1]);
                                    
            request.setAttribute( "lat", str[0] );
            request.setAttribute( "lng", str[1] );

            this.getServletContext().getRequestDispatcher( "/WEB-INF/detailsProblem.jsp" ).forward( request, response );
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }        /* Transmission à la page JSP en charge de l'affichage des données */
    }
