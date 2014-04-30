/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package appliWeb;

import java.io.IOException;
//Imports Google Divers
import com.google.appengine.api.datastore.*;
import com.google.appengine.api.users.UserServiceFactory;
//Objectify
import static com.googlecode.objectify.ObjectifyService.ofy;
import com.googlecode.objectify.ObjectifyService;
//Blob
import com.google.appengine.api.blobstore.*;
import com.google.appengine.api.images.*;
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
//Beans
import beans.Problem;

/**
 *
 * @author Kent
 */
@SuppressWarnings("serial")
public class CreationProblem extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait connaitre la classe-entité Objectify
    }
    public static final String VUE_SUCCES = "/WEB-INF/problemCreated.jsp";
    
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        
        String urlImage = null;
        //Imports User
        com.google.appengine.api.users.UserService userService = UserServiceFactory.getUserService();
        com.google.appengine.api.users.User user = userService.getCurrentUser();
        
        //Blobstore
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        ImagesService imagesService = ImagesServiceFactory.getImagesService(); // R�cup�ration du service d'images

        // R�cup�re une Map de tous les champs d'upload de fichiers
        Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);

        // R�cup�re la liste des fichiers upload�s dans le champ "uploadedFile"
        // (il peut y en avoir plusieurs si c'est un champ d'upload multiple, d'o� la List)
        List<BlobKey> blobKeys = blobs.get("uploadedFile");

        // R�cup�ration de l'URL de l'image
        if(blobKeys != null)
        {
            urlImage = imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(blobKeys.get(0)));
        }
        
        String sujet = request.getParameter("sujet");
        String details = request.getParameter("details");
        String categorie = request.getParameter("categorie");
        String nom = request.getParameter("nom");
        String telephone = request.getParameter("telephone");
        String lat = request.getParameter("latFld");
        String lng = request.getParameter("lngFld");
        /* R�cup�ration de la date courante */
        SimpleDateFormat sdf = new SimpleDateFormat();
        String date = sdf.format(new Date());
        
       /// DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        
        Entity problem = new Entity("Problem");
        problem.setProperty("sujet", sujet);
        problem.setProperty("details", details);
        problem.setProperty("categorie", categorie);
        problem.setProperty("email", user.getNickname());
        problem.setProperty("nom", nom);
        problem.setProperty("telephone", telephone);
        problem.setProperty("lat", lat);
        problem.setProperty("lng", lng);
        problem.setProperty("dateProblem", date); 
        if(urlImage != null)
        {
            problem.setProperty("urlImage",urlImage);  
        }
        else
        {
            problem.setProperty("urlImage","/bootstrap/img/noImg.jpg");  
        }
        
        //Enregistrement du problem dans le Datastore
        ofy().save().entity(problem).now();
        assert problem.getKey() != null;
                                
        /* Ajout du bean et du message � l'objet requ�te */
        request.setAttribute( "problem", problem );
        
        /* Transmission � la page JSP en charge de l'affichage des donn�es */

        this.getServletContext().getRequestDispatcher( "/WEB-INF/problemCreated.jsp" ).forward( request, response );
        /*response.sendRedirect("/problemCreated.jsp");
        return;*/
        
        
    }
}
