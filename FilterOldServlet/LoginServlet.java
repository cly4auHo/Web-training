package lesson06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

	@Override
	public void destroy() {
		super.destroy();
	}

	@Override
	public void init() throws ServletException {
		super.init();
	}

	public static final String FORM = "<html><form action = '' method='post'>\r\n" + "<table border = '1'>\r\n"
			+ "  <tr>\r\n" + "    <td width = '50' align = 'center'>\r\n" + "    Login\r\n" + "    </td>\r\n"
			+ "    <td width = '50' align = 'center'>\r\n" + "    <input type = 'text', name = 'login'/>\r\n"
			+ "    </td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td width = '50' align = 'center'>\r\n"
			+ "    Password\r\n" + "    </td>\r\n" + "    <td width = '50' align = 'center'>\r\n"
			+ "    <input type = 'text', name = 'password'/>\r\n" + "    </td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n"
			+ "    <td width = '50' align = 'center'>\r\n" + "    \r\n" + "    </td>\r\n"
			+ "    <td width = '50' align = 'center'>\r\n" + "    <input type = 'submit', value = 'OK'/>\r\n"
			+ "    </td>\r\n" + "  </tr>\r\n" + "</table></form>";

	public static final String NEWFORM = "<a href='?logOut'>LogOut</a>";
	private PrintWriter out;
	private boolean showForm = true;
	private String result = "sdf";
	private HttpSession session;
	public static final String KEY = "key";
	private String logOut;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		out = resp.getWriter();

		session.setAttribute(KEY, "Minimax");
		String login = req.getParameter("login");
		String password = req.getParameter("password");

		if (login != null) {
			if (login.equals("admin") && password.equals("123")) {
				result = "Access is granted";
				showForm = false;
			} else {
				result = "Access is denied";
			}
		}

		doGet(req, resp);
	}

	private static final String HREF = "<a href='/lesson07/request.jsp'>Href</a>";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		out = resp.getWriter();
		session = req.getSession();
		out.write("<html>");
		logOut = req.getParameter("logOut");

		if (logOut != null) {
			session.invalidate();
			session = req.getSession(true);
			showForm = true;
		}

		if (session.getAttribute(KEY) != null) {
			result = "Hello guest";
			showForm = (session.getAttribute(KEY) == null) ? true : false;
		}

		if (showForm) {
			out.write(FORM);
		} else {
			out.write(NEWFORM);
		}

		out.write(result +"<br>" +HREF + "</html>");
	}
}
