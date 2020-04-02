<%
String s = "1";
%>

<%! private int counter = 0;%>

<table border = '1'>
	
		<td width="50" align="center"><%=s%></td>
		<td width="50" align="center"><%=s%></td>
	<tr>
		<td width="50" align="center"><%=s%></td>	
	<tr>
		<td width="50" align="center"><%=s%></td>
</table>

<% 
	out.write("" + (counter++));
%>

<a href="">USER</a>

<form action="1.jsp">
	<input type="text" name="name"/>
	<input type="submit" value="SEND"/>
</form>

<form action="2.jsp">
	name:
	<input type="text" name="name"/> 
	<br>
	password:
	<input type="text" name="password"/>
	<br> 
	<input type="submit" value="SEND"/>
</form>
