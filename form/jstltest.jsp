<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jsplogic.GetArray" %>

<c:set var='name' value='Mukola'/>
<c:out value='${name} yehal'/>

<br>

<c:set var='name2' value='Mukola2'/>
${name2}

<br>

<c:set var='money' value='${42*10}'/>
${money}

<br>

<c:if test = "${money > 100}">
         <p>My salary is: ${money}</p>
</c:if>

<br>

<c:if test = "${name eq 'Mukola'}">
         <p>Mukola == ${name}</p>
</c:if>

<br>

<p>Your salary is : <c:out value = "${money}"/></p>
    <c:choose>
         
        <c:when test = "${money <= 0}">
           Salary is very low to survive.
        </c:when>
         
        <c:when test = "${money > 1000}">
           Salary is very good.
        </c:when>
         
        <c:otherwise>
           No comment sir...
        </c:otherwise>
</c:choose>

<br>

<body>
      <c:forEach var = "i" begin = "1" end = "5">
        Item <c:out value = "${i}"/><p> 
      </c:forEach>
</body>


<%
	String[] str = {"1" , "2" , "rf"};
	pageContext.setAttribute("key" , str);
%>

<body>
    <c:forEach items = "${key}" var = "name3">
        <c:out value = "${name3}"/><p>
    </c:forEach>
</body>

<br>
<hr>

<jsp:useBean id="arrayBean" class="jsplogic.GetArray"/>

<body>
    <c:forEach items = "${arrayBean.str}" var = "name3">
        <c:out value = "${name3}"/><p>
    </c:forEach>
</body>
<hr>

${param["name"]}

