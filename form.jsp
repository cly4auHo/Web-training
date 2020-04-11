1. вынести проверку логина пароля в класс через базу
2. на базе красивой формы (которую скинули) сделать форму регистрации (<div class="field"> - )
3. гиперссылка на логин / регистрация (поля не слетают)

<%@ page import="ua.Checker" %>
<%@ page import="ua.NamePrinter" %>

<%
  String login = request.getParameter("login");
  String password = request.getParameter("password");
  boolean showForm = true;
  String result = "";

  if(login != null){
      Checker checker = new Checker(login, password);
      showForm = !checker.show();
	  result = checker.message();
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
  }
  %>
  <%=new NamePrinter().printer()%>
  
  <%out.write(result);  %>