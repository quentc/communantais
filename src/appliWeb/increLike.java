package appliWeb;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import beans.Problem;

public class increLike extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait conna�tre la classe-entit� � Objectify
    }
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
	    
        com.google.appengine.api.users.UserService userService = UserServiceFactory.getUserService();
        com.google.appengine.api.users.User user = userService.getCurrentUser();
        
		HttpSession session = req.getSession();
		Problem problemeEnCours = (Problem) session.getAttribute("problemeEnCours");
		String message = "";
		
		boolean trouve = false; String test = "";
        String adresse = user.getNickname();
                ArrayList<String> liste = problemeEnCours.getListeLike();
                for(String s : liste){
                    if(s.equals(adresse)){
                        trouve = true;
                    }
                }
                if(!trouve){
                    problemeEnCours.setLike(problemeEnCours.getLike() + 1);
                    liste.add(adresse);
                } else {
                    message = "Erreur : vous avez d�j� lik� ce probl�me !";
                }
                    
                session.setAttribute("msg", message);
                session.setAttribute("liste", liste);
                
                problemeEnCours.setListeLike(liste);

		if (problemeEnCours.getLike() == 3) {
		    problemeEnCours.setConfirme(true);
		}
        ofy().save().entity(problemeEnCours).now();
        assert problemeEnCours.getId() != null;
		
		resp.sendRedirect("detailsProblem");
	}
}
