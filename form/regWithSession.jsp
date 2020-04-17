<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	String logOut = request.getParameter("LogOut");

	boolean showForm = true;

	String result = "";
	String key = "key";

	out.write("session: " + session.getId());

	if(login != null){
		
		if(login.equals("admin") && password.equals("123")){
			result = "access granted";
			showForm = false;
			session.setAttribute(key, "sessionCheck");
		}else{
			result = "access denied";
		}
	}

	if(logOut != null){
		session.invalidate();
		session = request.getSession(true);
		out.write("session: " + session.getId());
		showForm = true;
	}

	//если пользователь авторизирован только логОут, и скрыть форму регистрации
	//сессия для всех страниц
	//доставать имя пользователя, если залоган
	//

	if(session.getAttribute(key) != null){
		result = "Hello guuest";
		showForm = session.getAttribute(key) == null ? true : false ;
	}

	if(showForm){
	%>

	<form action = ''>
	<table border = '1'>
	  <tr>
		<td width = '50' align = 'center'>
		<%out.write("Login");%>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'login'/>
		</td>
	  </tr>
	  <tr>
		<td width = '50' align = 'center'>
		<%out.write("Password");%>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'password'/>
		</td>
	  </tr>
	  <tr>
		<td width = '50' align = 'center'>
		
		</td>
		<td width = '50' align = 'center'>
		<input type = 'submit', value = 'OK'/>
		</td>
	  </tr>
	</table>

	<%
	}else{
	%>

	<form action = '' method="get"> 
	   <tr>
		<td width = '50' align = 'center'>
		<%out.write("Login");%>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'hidden' name = 'login' value="chtoUgodno" />
		</td>
	  </tr>
	  <tr>
	  <tr>
		<td width = '50' align = 'center'>
		</td>
		<td width = '50' align = 'center'>
			<input type = 'submit' name = 'LogOut' value="logOut" />
		</td>
	  </tr>
	</table>
<%

}
	out.write(result); 
%>