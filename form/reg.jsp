<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ include file="header.jsp" %>  

<%
boolean form = true;
String email = request.getParameter("email");
String signUpButton = request.getParameter("signUpButton");


String password = request.getParameter("password");
String passwordConfirmation = request.getParameter("passwordConfirmation");
String gender = request.getParameter("gender");
String textarea = request.getParameter("textarea");
String location = request.getParameter("location");
String checkbox = request.getParameter("checkbox");

boolean ifError = false;
StringBuilder errorText = new StringBuilder("<ul>");

if (email!=null){
			Pattern pattern = Pattern.compile("^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\\d\\W])|(?=.*\\W)(?=.*\\d))|(?=.*\\W)(?=.*[A-Z])(?=.*\\d)).{8,20}$");
			Matcher matcher = pattern.matcher(email);
				if (matcher.matches()==false){
					ifError = true;
					errorText.append("<li>incorrect e-mail</li>");
				}
			}

if (password!=null){
				Pattern pattern = Pattern.compile("^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\\d\\W])|(?=.*\\W)(?=.*\\d))|(?=.*\\W)(?=.*[A-Z])(?=.*\\d)).{8,20}$");
				Matcher matcher = pattern.matcher(password);
				if(matcher.matches()==false){
					ifError=true;
					errorText.append("<li>must contain 8 symb...bla bla bla</li>");
				}
			}

if (passwordConfirmation!=null&&!passwordConfirmation.equals("")){
					Pattern pattern = Pattern.compile("^((?=.*[a-z])(?=.*\\d)(?=.*[A-Z])(?=.*[@#$%!]).{8,20})$");
					Matcher matcher = pattern.matcher(passwordConfirmation);
					
				if (matcher.matches()==false&&!passwordConfirmation.equals(password)){
					ifError=true;
					errorText.append("<li>didnt match with your password</li>");
				} 
			}				
			
if (location!=null){
				if (location.equals("")){
					ifError=true;
					errorText.append("<li>choose your location</li>");
				}
			}
			
			
if (checkbox!=null){
				if (!checkbox.equals("checked")){
					ifError=true;
					errorText.append("<li>dont you agree with us?</li>");
				}
			} 			

if (form){
%>

<html>

<head>
	<title></title>
	<meta charset="UTF-8" />
	<link href="style.css" rel="stylesheet" />
</head>
<body>
<center>
<form action='' method = 'post'>
<table border='1'>
	
	<h1 align='center'>
			Fill in this registration form!
	</h1>
	<tr>
		<td align='right'>
			Enter your e-mail: <input type='text' name='email' required='required' value="<%=email==null?"":email%> "/>
		</td>
		<td>
		<% 		
			out.write(""+errorText);
		%>
		</td>
	</tr>
	<tr>
		<td align='right'>
			Enter your pass: <input type='password' name='password'/>
		</td>
	</tr>
	<tr>
		<td align='right'>
			Confirm your pass: <input type='password' name='passwordConfirmation'/></td>
		</td>
		
	</tr>
	<tr>
		<td align='right'>
			Where are you from?: <select name='location'>
									<option value=""></option>
									<option value="dnr" <%=(location!=null&&location.equals("dnr"))?"selected":""%>>DNR</option>
									<option value="lnr" <%=(location!=null&&location.equals("lnr"))?"selected":""%>>LNR</option>
									<option value="crimea" <%=(location!=null&&location.equals("crimea"))?"selected":""%>>CRIMEA</option>
								</select>
		</td>
		
	</tr>
	<tr>
		<td align='right'>
			What are you?: 	<input type='radio' name='gender' value="male" <%=(gender!=null&&gender.equals("male"))?"checked":""%>>Male</input>
							<input type='radio' name='gender' value="female" <%=(gender!=null&&gender.equals("female"))?"checked":""%>>Female</input>

		</td>
	</tr>
	<tr>
		<td align='right'>
			Comment: <textarea name='textarea' cols='25' rows='10'><%=textarea==null?"":textarea%></textarea>
		</td>
	</tr>
	<tr>
		<td align='right'>
			Have you seen those small letters?: <font color='grey' size='1'><a href="agreement.txt"> (Read this carefully) </a>I dont want to read, I agree with everything!</font><input type="checkbox" name='checkbox' value="checked" checked></input>
		</td>
	</tr>
	<tr>
		<td align='right'>
			<input type='submit' value="Sign Up!">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>
<%}

%>
