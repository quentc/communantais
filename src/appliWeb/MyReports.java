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
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

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
public class MyReports extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait conna�tre la classe-entit� � Objectify
    }
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{    	
        
        try {
            HttpSession session = request.getSession(true);
            
            com.google.appengine.api.users.UserService userService = UserServiceFactory.getUserService();
            com.google.appengine.api.users.User user = userService.getCurrentUser();
            
            List<Problem> problems = ofy().load().type(Problem.class).filter("email", user.getNickname()).list(); 
            request.setAttribute( "problems", problems );

            this.getServletContext().getRequestDispatcher( "/WEB-INF/myReports.jsp" ).forward( request, response );
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    } 
    }
