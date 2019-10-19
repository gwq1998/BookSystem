<%@ page language="java" import="java.util.*,java.sql.*,java.net.*" pageEncoding="utf-8" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page import="MD5.MD5" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'Feilong_loginCh.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    -->

</head>
<body>
<% //接收用户名和密码
    int name = Integer.valueOf(new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8"));
    String pwd = request.getParameter("pwd");
    MD5 md5 = new MD5();
    String md5pwd = md5.getMD5ofStr(pwd);
    String driverClass = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/demo?&useSSL=false&serverTimezone=UTC";
    String username = "root";
    String password = "113774";

    Class.forName(driverClass);//加载驱动
    Connection conn = DriverManager.getConnection(url, username, password);//得到连接


    PreparedStatement pStmt = conn.prepareStatement("select * from user where uid = ? and password = ?");
    pStmt.setInt(1,name);
    pStmt.setString(2,md5pwd);
    ResultSet rs = pStmt.executeQuery();

    if (rs.next()) {
        int status = rs.getInt("status");
        if (status == 0) {
            session.setAttribute("nameid", name);
%>
<script language="javascript" type="text/javascript">
    // 以下方式直接跳转
    window.location.href = 'findServlet.do'
</script>
<%
} else {
    session.setAttribute("nameid", name);
%>
<script language="javascript" type="text/javascript">
    // 以下方式直接跳转
    window.location.href = 'userfind.do'
</script>
<%
        }
    } else {
        response.sendRedirect("welcome.jsp?errNo");//密码不对返回到登陆
    }
    rs.close();
    pStmt.close();
    conn.close();
%>
</body>
</html>  