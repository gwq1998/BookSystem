package com.book.web3;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JdbcUserBorrowed extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * 构造函数
     */
    public JdbcUserBorrowed() {
        super();
    }

    /**
     * 初始化
     */
    public void init() throws ServletException {
    }

    /**
     * doGet()方法
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * doPost()方法
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int uid = Integer.valueOf(request.getParameter("userid"));
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/demo?serverTimezone=GMT";
            String userName = "root"; // 用户名
            String userPwd = "113774"; // 密码
            Connection conn = DriverManager.getConnection(url, userName, userPwd);
            PreparedStatement stmt = conn.prepareStatement("select bookid from userborrow where userid =?");
            stmt.setInt(1,uid);
            ResultSet rs = stmt.executeQuery();
            List<Integer> bookid = new ArrayList<Integer>();
            while (rs.next()) {
                bookid.add(rs.getInt("bookid"));
            }
            List<Book> list = new ArrayList<Book>();
            int i = 0;
            int size = bookid.size();
            while (size > 0) {
                PreparedStatement mstmt = conn.prepareStatement("select * from tb_books where id = ?");
                mstmt.setInt(1,bookid.get(i));
                ResultSet mrs = mstmt.executeQuery();
                while (mrs.next()) {
                    Book book = new Book();
                    book.setId(mrs.getInt("id"));
                    book.setName(mrs.getString("name"));
                    book.setPrice(mrs.getDouble("price"));
                    book.setBookCount(mrs.getInt("bookCount"));
                    book.setAuthor(mrs.getString("author"));
                    book.setBookintro(mrs.getString("intro"));
                    list.add(book);
                }
                size--;
            }
            request.setAttribute("list", list);
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            // TODO: handle exception
        }
        request.getRequestDispatcher("myborrow.jsp").forward(request, response);
    }

    /**
     * 销毁
     */
    public void destroy() {
        super.destroy();
    }
}