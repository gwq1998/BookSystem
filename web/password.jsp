<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="MD5.MD5" %>
<%
    Object name = session.getAttribute("nameid");
    if(name==null){
        response.sendRedirect("welcome.jsp");
    }
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'Feilong_chechRegister.jsp' starting page</title>

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
<%
    String Pwd = request.getParameter("Password");
    String newPwd = request.getParameter("newPassword");
    MD5 md5 = new MD5();

    int id = Integer.valueOf(request.getParameter("Userid"));
    String md5newpwd = md5.getMD5ofStr(newPwd);

    String driverClass = "com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/demo?&useSSL=false&serverTimezone=UTC";
    String username = "root";
    String password = "113774";

    Class.forName(driverClass);//加载驱动
    Connection conn = DriverManager.getConnection(url,username,password);//得到连接

    PreparedStatement pStmt = conn.prepareStatement("select * from user where uid = ?");
    pStmt.setInt(1,id);
    ResultSet rs = pStmt.executeQuery();
    if(!rs.next()){
        out.println("<script language='javascript'>alert('该用户不存在,请注册！');window.location.href='register.jsp';</script>");
    }else{
        PreparedStatement tmt = conn.prepareStatement("update user set password=? where uid=?");
        tmt.setString(1,md5newpwd);
        tmt.setInt(2,id);
        int rst = tmt.executeUpdate();
        if (rst != 0){
            out.println("<script language='javascript'>alert('更改密码成功！');window.location.href='welcome.jsp';</script>");
        }else{
            out.println("<script language='javascript'>alert('更改密码失败！');window.location.href='register.jsp';</script>");
        }
    }
%>
</body>
</html>
