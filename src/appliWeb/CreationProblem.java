/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package appliWeb;

import java.io.IOException;
import java.io.PrintWriter;

//Imports Google
import com.google.appengine.api.datastore.*;
import com.googlecode.objectify.ObjectifyService;

import static com.googlecode.objectify.ObjectifyService.ofy;

//Java libraries
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

//DateTime
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;




import beans.Problem;

/**
 *
 * @author Kent
 */
//@WebServlet(name = "CreationProblem", urlPatterns = {"/CreationProblem"})
@SuppressWarnings("serial")
public class CreationProblem extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait conna�tre la classe-entit� � Objectify
    }
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
       String sujet = request.getParameter("sujet");
        String details = request.getParameter("details");
        String categorie = request.getParameter("categorie");
        //String photo = request.getParameter("photo");
        String email = request.getParameter("email");
        String nom = request.getParameter("nom");
        String telephone = request.getParameter("telephone");
        String lat = request.getParameter("lat");
        String lng = request.getParameter("lat");
        
        /* R�cup�ration de la date courante */
        //DateTime dt = new DateTime();
        /* Conversion de la date en String selon le format d�fini */
        //DateTimeFormatter formatter = DateTimeFormat.forPattern( "dd/MM/yyyy HH:mm:ss" );
        //String date = dt.toString( formatter );
        
        
        /*
        String message;
        /*
         * Initialisation du message � afficher : si un des champs obligatoires
         * du formulaire n'est pas renseign�, alors on affiche un message
         * d'erreur, sinon on affiche un message de succ�s
         
        if ( sujet.trim().isEmpty() || details.trim().isEmpty() || categorie.trim().isEmpty()
                || email.isEmpty() || nom.isEmpty() ) {
            message = "Erreur - Vous n'avez pas rempli tous les champs obligatoires. <br> <a href=\"addProblem.jsp\">Cliquez ici</a> pour acc�der au formulaire de cr�ation d'un probl�me.";
        } else {
            message = "Probl�me cr�� avec succ�s !";
        }
        */
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        
        Entity problem = new Entity("Problem");
        problem.setProperty("sujet", sujet);
        problem.setProperty("details", details);
        problem.setProperty("categorie", categorie);
        problem.setProperty("email", email);
        problem.setProperty("nom", nom);
        problem.setProperty("telephone", telephone);
        problem.setProperty("lat", lat);
        problem.setProperty("lng", lng);
        //problem.setPhoto( photo );

        
        //Enregistrement du problem dans le Datastore
        ofy().save().entity(problem).now();
        assert problem.getKey() != null;
        
        
        //Problem fetched = ofy().load().type(Problem.class).id(problem.getKey()).now();
        
        List<Problem> problems = ofy().load().type(Problem.class).list();
        /* Ajout du bean et du message � l'objet requ�te */
        request.setAttribute( "problem", problem );
        //request.setAttribute( "message", message );
        
        /* Transmission � la page JSP en charge de l'affichage des donn�es */
        this.getServletContext().getRequestDispatcher( "/WEB-INF/problemCreated.jsp" ).forward( request, response );
    }
}
