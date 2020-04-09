	<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	boolean showForm = true;
	String result = "";

	if(login != null){
		
		if(login.equals("admin") && password.equals("123")){
			result = "access granted";
			showForm = false;
		}else
			result = "access denied";
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
	} out.write(result); 
	%>
