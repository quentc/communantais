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
import com.google.appengine.api.blobstore.*;
import com.google.appengine.api.images.*;

import static com.googlecode.objectify.ObjectifyService.ofy;



//Java libraries
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

//DateTime
import java.util.Date;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;






import beans.Problem;

/**
 *
 * @author Kent
 */
@SuppressWarnings("serial")
public class CreationProblem extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait connaître la classe-entité à Objectify
    }
    
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        
        //BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        //ImagesService imagesService = ImagesServiceFactory.getImagesService(); // Récupération du service d'images

        // Récupère une Map de tous les champs d'upload de fichiers
        //Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);

        // Récupère la liste des fichiers uploadés dans le champ "uploadedFile"
        // (il peut y en avoir plusieurs si c'est un champ d'upload multiple, d'où la List)
        //List<BlobKey> blobKeys = blobs.get("photo");

        // Récupération de l'URL de l'image
        //String urlImage = imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(blobKeys.get(0)));
        
        //FileItemIterator iter = upload.getItemIterator(request);
        
        
        
        String sujet = request.getParameter("sujet");
        String details = request.getParameter("details");
        String categorie = request.getParameter("categorie");
        //String photo = request.getParameter("photo");
        String email = request.getParameter("email");
        String nom = request.getParameter("nom");
        String telephone = request.getParameter("telephone");
        String lat = request.getParameter("latFld");
        String lng = request.getParameter("lngFld");
        /* Récupération de la date courante */
        SimpleDateFormat sdf = new SimpleDateFormat();
        String date = sdf.format(new Date());
        
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
        problem.setProperty("dateProblem", date);
        //problem.setProperty("urlImage",urlImage);
        
        //Enregistrement du problem dans le Datastore
        ofy().save().entity(problem).now();
        assert problem.getKey() != null;
                                
        /* Ajout du bean et du message à l'objet requête */
        request.setAttribute( "problem", problem );
        
        /* Transmission à la page JSP en charge de l'affichage des données */
        this.getServletContext().getRequestDispatcher( "/WEB-INF/problemCreated.jsp" ).forward( request, response );
        
        
    }
}
