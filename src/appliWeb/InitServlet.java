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
public class InitServlet extends HttpServlet {
    static {
        ObjectifyService.register(Problem.class); // Fait connaître la classe-entité à Objectify
    }
    
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/plain");
		
		List<Problem> problems = ofy().load().type(Problem.class).order("-like").limit(5).list();
		request.setAttribute( "problems", problems );
        this.getServletContext().getRequestDispatcher( "/index.jsp" ).forward( request, response );

	}
}
