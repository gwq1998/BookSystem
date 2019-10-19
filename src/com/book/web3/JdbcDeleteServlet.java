package com.book.web3;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JdbcDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            int id = Integer.parseInt(request.getParameter("id"));
            Class.forName("com.mysql.jdbc.Driver");
            String  url = "jdbc:mysql://localhost:3306/demo?serverTimezone=GMT";
            String userName = "root"; // 用户名
            String userPwd = "113774"; // 密码
            Connection conn = DriverManager.getConnection(url, userName, userPwd);
            String sql = "delete from tb_books where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int temp = ps.executeUpdate();
            if(temp>0)
                response.sendRedirect("findServlet.do");
            ps.close();
            conn.close();

        } catch (Exception e) {
            // TODO: handle exception
        }

    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
