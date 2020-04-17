<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
		
<c:choose>      
        <c:when test = "${param['login'] eq 'admin' && param['password'] eq '123'}">
          	<c:set var='access' value='access'/>
          	<c:set var='show' value='true'/>
        </c:when>
          
        <c:otherwise>
           <c:set var='access' value='access denied'/>
           <c:set var='show' value='false'/>
        </c:otherwise>
</c:choose>

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
</table>

</c:if>

${access}
