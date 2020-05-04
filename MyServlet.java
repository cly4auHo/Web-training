package lesson06;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class MyServlet extends HttpServlet  {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("name", "Minimax");
		req.getAttribute("name");
		PrintWriter out = resp.getWriter();
		out.write("<html><form><h1>Hello</h1><input type='submit' value='Ok'/></form>");
		String login = req.getParameter("login");
		String password = req.getParameter("password");
		out.write(login+" "+password+"</html>");
	}
}
