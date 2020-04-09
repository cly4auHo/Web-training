<%!int count = 0;%>
<%!long time = 0;%>
	
<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	boolean showForm = true;
	String result = "";
	
	if(login != null){
		
		if(login.equals("admin") && password.equals("123")){
			result = "access granted";
			showForm = false;
			count++;
		}else{
			result = "access denied";
			count++;
		}
	}

	if(count >= 3){
		showForm = false; 
		result = "form blocked<br><a href=''>REFRESH</a><br>" + ((5000 - (System.currentTimeMillis() - time)) / 1000) + "<br>";

		if(time == 0)
			time = System.currentTimeMillis();		
	}
	
	if(count > 3 && System.currentTimeMillis() - time >= 5000){
		showForm = true; 
		count = 0;
		result = "";
		time = 0;
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
		<input type = 'password', name = 'password'/>
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
	} 

	out.write(result); 
	out.write("" + time); 

	%>