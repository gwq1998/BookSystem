<%@ page import="com.book.web3.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.net.URLEncoder" %>
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
  Date: 2019/10/15
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/swal.js"></script>
    <link rel="stylesheet" type="text/css" href="css/swal.css">
</head>
<body>
<%int bookid = Integer.valueOf(request.getParameter("bookid"));%>
<%int borrower = Integer.valueOf(request.getParameter("userid"));%>
<% String driverClass = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/demo?&useSSL=false&serverTimezone=UTC";
    String username = "root";
    String password = "113774";

    Class.forName(driverClass);//加载驱动
    Connection conn = DriverManager.getConnection(url, username, password);//得到连接
    PreparedStatement pStmt = conn.prepareStatement("select bookid from userborrow where userid = ?" );
    pStmt.setInt(1,borrower);
    ResultSet rs = pStmt.executeQuery();
    boolean bookIsBorrowed = false;
    while (rs.next()) {
        int bid = rs.getInt("bookid");
        if (bid == bookid) {
            bookIsBorrowed = true;
        }
    }
    if (bookIsBorrowed == true) {
%>
<script language="javascript" type="text/javascript">
    swal("该图书您已经借阅！")
</script>
<a href="userfind.do">返回</a>
<%
} else {
    PreparedStatement sstmt = conn.prepareStatement("select bookCount from tb_books where id = ?");
    sstmt.setInt(1,bookid);
    ResultSet rrs = sstmt.executeQuery();
    rrs.next();
    int count = rrs.getInt("bookCount");
    if (count > 0) {
        String sql = "insert into userborrow value (" + borrower + "," + bookid + ")";
        PreparedStatement stmt = conn.prepareStatement("insert into userborrow value (?,?)");
        stmt.setInt(1,borrower);
        stmt.setInt(2,bookid);
        PreparedStatement mstmt = conn.prepareStatement("update tb_books set bookCount = bookCount-1 where id = ?");
        mstmt.setInt(1,bookid);
        int mrst = mstmt.executeUpdate();
        int rst = stmt.executeUpdate();
        if
        (rst > 0 && mrst > 0) {
%>
<script language="javascript" type="text/javascript">
    swal("借阅成功！");
</script>
<a href="userfind.do">返回</a>
<%
    }
    stmt.close();
} else {
%>
<script language="javascript" type="text/javascript">
    swal("数量不足！");
</script>
<a href="userfind.do">返回</a>
<%
        }
    }
    rs.close();
    pStmt.close();
    conn.close();
%>
</body>
</html>
