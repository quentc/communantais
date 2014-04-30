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
public class AllProblems extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait conna�tre la classe-entit� � Objectify
    }
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{    	
        
        try {

            //R�ccup�ration de tous les probl�mes enregistr�s dans le DataStore
            List<Problem> problems = ofy().load().type(Problem.class).order("-dateProblem").list();
            /* Ajout du bean et du message � l'objet requ�te */
            request.setAttribute( "problems", problems );

            this.getServletContext().getRequestDispatcher( "/WEB-INF/allProblems.jsp" ).forward( request, response );
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }        /* Transmission � la page JSP en charge de l'affichage des donn�es */
    }
