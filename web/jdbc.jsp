<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<body>
<form action="jbcresult.jsp" method="post">
    <table align="center" border="1" width="50%" cellpadding="6">
        <tr>
            <th colspan="2" align="center" >添加图书信息</th><%--th加粗， cellpadding和android padding含义一样--%>
        </tr>
        <tr>
            <td align="center" >图书编号：</td>
            <td align="left" ><input type="text" name="id"></td>
        </tr>
        <tr>
            <td align="center" >图书名称：</td>
            <td align="left" ><input type="text" name="name"></td>
        </tr>
        <tr>
            <td align="center" >价        格：</td>
            <td align="left" ><input type="text" name="price"></td>
        </tr>
        <tr>
            <td align="center" >数        量：</td>
            <td align="left" ><input type="text" name="bookCount"></td>
        </tr>
        <tr>
            <td align="center" >作        者：</td>
            <td align="left" ><input type="text" name="author"></td>
        </tr>
        <tr>
            <td align="center" >简        介：</td>
            <td align="left" ><input type="text" name="intro"></td>
        </tr>
        <tr>
            <th colspan="2" align="center" ><input type="submit" name="submit" value="添加"></th>
        </tr>
    </table>
</form>
</body>
</html>