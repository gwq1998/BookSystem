<%@page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
    Object name = session.getAttribute("nameid");
    if(name==null){
        response.sendRedirect("welcome.jsp");
    }
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>
<jsp:useBean id="book" class="com.book.web3.Book"></jsp:useBean>
<jsp:setProperty property="*" name="book"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/demo?serverTimezone=GMT";
        String userName = "root"; // 用户名
        String userPwd = "113774"; // 密码
        Connection conn = DriverManager.getConnection(url, userName, userPwd);
        String sql = "insert into tb_books(id,name,price,bookCount, author,intro)values(?,?,?,?,?,?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, book.getId());
        ps.setString(2, book.getName());
        ps.setDouble(3, book.getPrice());
        ps.setInt(4, book.getBookCount());
        ps.setString(5, book.getAuthor());
        ps.setString(6, book.getBookintro());

        int row = ps.executeUpdate();
        if (row > 0) {
%>
<script language="javascript" type="text/javascript">
    // 以下方式直接跳转
    window.location.href = 'findServlet.do';
</script>
<%
        }
        ps.close();
        conn.close();
    } catch (Exception e) {
        out.print("图书信息添加失败  " + e.toString());
    }
%>
</br>

</body>
</html>