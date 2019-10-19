package com.book.web3;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class JdbcUpdateServlet extends HttpServlet  {
    private static final long serialVersionUID = 1L;

    /**
     * 构造函数
     */
    public JdbcUpdateServlet()
    {
        super();
    }

    /**
     * 初始化
     */
    public void init() throws ServletException
    {}

    /**
     * doGet()方法
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }

    /**
     * doPost()方法
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        try {
            request.setCharacterEncoding("UTF-8");
            String bookIntro = request.getParameter("bookIntro");
            int id = Integer.valueOf(request.getParameter("id"));
            int bookCount = Integer.valueOf(request.getParameter("bookCount"));
            String bookName = request.getParameter("bookName");
            double bookPrice = Double.valueOf(request.getParameter("bookPrice"));
            String bookAuthor = request.getParameter("bookAuthor");


            Class.forName("com.mysql.jdbc.Driver");
            String  url = "jdbc:mysql://localhost:3306/demo?serverTimezone=GMT";
            String userName = "root"; // 用户名
            String userPwd = "113774"; // 密码
            Connection conn = DriverManager.getConnection(url, userName, userPwd);
            String sql = "update tb_books set bookCount=?,name=?,author=?,price=?,intro=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookCount);
            ps.setString(2, bookName);
            ps.setString(3,bookAuthor);
            ps.setDouble(4,bookPrice);
            ps.setString(5,bookIntro);
            ps.setInt(6, id);
            int temp = ps.executeUpdate();
            if(temp>0)
                response.sendRedirect("findServlet.do");
            ps.close();
            conn.close();

        } catch (Exception e) {
            // TODO: handle exception
        }

    }

    /**
     * 销毁
     */
    public void destroy()
    {
        super.destroy();
    }
}