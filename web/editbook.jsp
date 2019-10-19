<%@ page import="com.book.web3.Book" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8"%>
<%
    Object name = session.getAttribute("nameid");
    if(name==null){
        response.sendRedirect("welcome.jsp");
    }
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <title>编辑图书</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <h3 class="text-center">
        管理员端
    </h3>
    <%String bookId = request.getParameter("bookid");%>
    <%String bookName = request.getParameter("bookname");%>
    <%String bookAuthor = request.getParameter("bookauthor");%>
    <%String bookPrice = request.getParameter("bookprice");%>
    <%String bookCount = request.getParameter("bookcount");%>
    <%String bookIntro = request.getParameter("bookintro");%>
    <div class="col-md-8 col-md-offset-2">
        <form  method="post" id="edit" action="updateServlet.do">
            <table class="table table-bordered">
                <input type="hidden" name="id" value="<%=bookId%>">
                <tr>
                    <th>书籍名称</th>
                    <td><textarea class="form-control" rows="1" id="bookName" name="bookName"><%=bookName%></textarea>
                    </td>
                </tr>
                <tr>
                    <th>书籍作者</th>
                    <td><textarea class="form-control" rows="1" id="bookAuthor" name="bookAuthor"><%=bookAuthor%></textarea></td>
                </tr>
                <tr>
                    <th>书籍数量</th>
                    <td>
                        <textarea class="form-control" rows="1" id="bookCount" name="bookCount"><%=bookCount%></textarea>
                    </td>
                </tr>
                <tr>
                    <th>书籍价格</th>
                    <td> <textarea class="form-control" rows="1" id="bookPrice" name="bookPrice"><%=bookPrice%></textarea></td>
                </tr>
                <tr>
                    <th>书籍简介</th>
                    <td> <textarea class="form-control" rows="3" id="bookIntro" name="bookIntro"><%=bookIntro%></textarea></td>
                </tr>
                <tr><th></th><td><input type="submit" value="修改" class="btn default"/></td></tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>