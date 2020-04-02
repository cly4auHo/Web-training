<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");

	if(name.equals("admin") && password.equals("123"))
		out.write("Acces");
	else
		out.write("Acces denied");
%>