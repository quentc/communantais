package appliWeb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Communantais1Servlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		resp.setContentType("text/plain");
        this.getServletContext().getRequestDispatcher( "/WEB-INF/addProblem.jsp" ).forward( req, resp );

	}
}
