package appliWeb;

import static com.googlecode.objectify.ObjectifyService.ofy;




import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.googlecode.objectify.ObjectifyService;

import beans.Problem;


@SuppressWarnings("serial")
public class Communantais1Servlet extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait connaître la classe-entité à Objectify
    }
    
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		resp.setContentType("text/plain");
		
		ArrayList<String> tab = new ArrayList<String>();
		int i = 0,j = 0;	
		
		List<Problem> allProblems = ofy().load().type(Problem.class).list();
		for(Problem problem : allProblems)
		{
		    tab.add(problem.getLat());
		    tab.add(problem.getLng());
		    i++;
		}
		
        req.setAttribute( "tab", tab );

        this.getServletContext().getRequestDispatcher( "/WEB-INF/addProblem.jsp" ).forward( req, resp );

	}
}
