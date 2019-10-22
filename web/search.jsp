<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="com.book.web3.Book" %>
<%@ page import="java.time.ZoneId" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    Object name = session.getAttribute("nameid");
    if(name==null){
        response.sendRedirect("welcome.jsp");
    }
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <h3 class="text-center">
            图书系统用户端</br>
            Welcome！<%=name%>
        </h3>
        <div class="row">
            <div class="col-sm-2">
                <form action="userborrow.do" method="post" class="btn-group">
                    <input type="hidden" name="userid" value="<%=name%>">
                       <input type="submit" value="我的借阅" class="btn btn-primary">      
                </form>
                <button class="btn btn-primary" type="button" onclick="window.location.href='userfind.do'">退出登录</button></br>
                <button class="btn btn-primary" type="button" onclick="window.location.href='userfind.do'">返回</button>
            </div>

            <div class="col-sm-8">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>书籍名称</th>
                        <th>书籍作者</th>
                        <th>书籍价格</th>
                        <th>书籍数量</th>
                        <th>书籍简介</th>
                        <th>操作</th>
                    </tr>
                    <%
                        //获取图书信息集合
                        List<Book> list = (List<Book>) request.getAttribute("list");
                        if (list == null || list.size() < 1) {
                            out.print("没有数据 ");
                        } else {
                            for (Book book : list) {
                    %>
                    </thead>
                    <tbody>
                    <tr>
                        <td style="width:12%">
                            <p><%= book.getName() %>
                            </p>
                        </td>
                        <td>
                            <p><%= book.getAuthor() %>
                            </p>
                        </td>
                        <td>
                            <p><%= book.getPrice() %>
                            </p>
                        </td>
                        <td>
                            <p><%= book.getBookCount() %>
                            </p>
                        </td>
                        <td>
                            <p><textarea class="form-control" rows="3" id="bookIntro" name="bookIntro"><%=book.getBookintro()%></textarea>
                            </p>
                        </td>
                        <td>
                            <div class="btn-group-vertical">
                                <a class="btn btn-primary" type="button"
                                   href="userborrow.jsp?bookid=<%=book.getId()%>&userid=<%=name%>">借阅</a>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                    <%
                            }
                        }
                    %>
                </table>
            </div>
            <div class="col-sm-2">
                <form class="form-search" action="serach.do">
                    <input class="form-control" type="text" name="bookname"/> <button type="submit" class="btn">搜索</button>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>