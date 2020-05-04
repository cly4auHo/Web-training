package lesson06;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyFilter implements Filter {
	private String myName;
	private static final String KEY = "key";
	private HttpSession session;

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {

		System.out.println("My name = " + myName);
		HttpServletRequest req = (HttpServletRequest) arg0;
		session = req.getSession();

		if (session.getAttribute(KEY) != null) {
			arg2.doFilter(arg0, arg1);
		}else {
			HttpServletResponse resp = (HttpServletResponse) arg1;
			resp.sendRedirect("/lesson07/403.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		myName = arg0.getInitParameter("myName");
	}
}
