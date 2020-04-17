<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "jsplogic.Checker" %>

<jsp:useBean id="arrayBean" class="jsplogic.Checker"/>

<jsp:setProperty name='arrayBean' property='login' value="${param['login']}"/>
<jsp:setProperty name='arrayBean' property='password' value="${param['password']}"/>

<body>
    <c:set var='access' value="${arrayBean.access}"/>
    <c:set var='show' value="${arrayBean.show}"/>
    <c:set var='mysession' value="lol" scope="session"/>
</body>


${sessionScope.mysession}

<c:if test = "${show eq false}">

<form action = ''>
	<table border = '1'>
	  <tr>
		<td width = '50' align = 'center'>
		  Login
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'login'/>
		</td>
	  </tr>
	  <tr>
		<td width = '50' align = 'center'>
		  Password
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
	  
<form action = ''>
	  <tr>
		<td width = '50' align = 'center'>
		  logOut
		</td>
		<td width = '50' align = 'center'>
		<input type = 'hidden', name = 'logOut'/>
		</td>
	  </tr>
	  <tr>
		<td width = '50' align = 'center'>
		
		</td>
		<td width = '50' align = 'center'>
		<input type = 'submit', value = 'OK2'/>
		</td>
	  </tr>

</table>

</c:if>

${access}