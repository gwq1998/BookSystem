<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%
    Object name = session.getAttribute("nameid");
    if(name==null){
        response.sendRedirect("welcome.jsp");
    }
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>

<%--
  Created by IntelliJ IDEA.
  User: GWQ
  Date: 2019/10/17
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%int bookid = Integer.valueOf(request.getParameter("bookid"));%>
<%String borrower = request.getParameter("userid");%>
<%
    String driverClass = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/demo?&useSSL=false&serverTimezone=UTC";
    String username = "root";
    String password = "113774";

    Class.forName(driverClass);//加载驱动
    Connection conn = DriverManager.getConnection(url, username, password);//得到连接
    PreparedStatement pStmt = conn.prepareStatement("delete from userborrow where bookid =?");
    pStmt.setInt(1,bookid);
    PreparedStatement ppStmt = conn.prepareStatement("update tb_books set bookCount = bookCount+1 where id = ?");
    ppStmt.setInt(1,bookid);
    int rs = pStmt.executeUpdate();
    int rrs = ppStmt.executeUpdate();
    if (rs > 0 && rrs > 0) {
%>
<script language="javascript" type="text/javascript">
    swal("还书成功！")
</script>
<a href="userfind.do">返回</a>
<%
} else {
%>
<script language="javascript" type="text/javascript">
    swal("还书失败！")
</script>
<a href="userfind.do">返回</a>
<%
    }
%>
</body>
</html>
