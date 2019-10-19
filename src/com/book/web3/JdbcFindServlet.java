package com.book.web3;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class JdbcFindServlet extends HttpServlet  {
    private static final long serialVersionUID = 1L;

    /**
     * 构造函数
     */
    public JdbcFindServlet()
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
            Class.forName("com.mysql.jdbc.Driver");
            String  url = "jdbc:mysql://localhost:3306/demo?serverTimezone=GMT";
            String userName = "root"; // 用户名
            String userPwd = "113774"; // 密码
            Connection conn = DriverManager.getConnection(url, userName, userPwd);
            Statement stmt = conn.createStatement();
            String sql = "select * from tb_books";
            ResultSet rs = stmt.executeQuery(sql);

            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setName(rs.getString("name"));
                book.setPrice(rs.getDouble("price"));
                book.setBookCount(rs.getInt("bookCount"));
                book.setAuthor(rs.getString("author"));
                book.setBookintro(rs.getString("intro"));
                list.add(book);
            }
            request.setAttribute("list", list);
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            // TODO: handle exception
        }
        request.getRequestDispatcher("jdbcfindservlet.jsp").forward(request, response);
    }
    /**
     * 销毁
     */
    public void destroy()
    {
        super.destroy();
    }
}