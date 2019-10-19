<%--
  Created by IntelliJ IDEA.
  User: GWQ
  Date: 2019/10/18
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Object name = session.getAttribute("nameid");
    if(name==null){
        response.sendRedirect("welcome.jsp");
    }
    session.setAttribute("nameid",null);
    response.sendRedirect("welcome.jsp");
%>
</body>
</html>
