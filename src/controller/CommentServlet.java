package controller;

import pojo.Comment;
import pojo.CommentTest;
import pojo.PageTest;
import pojo.User;
import utils.DbUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CommentServlet", value = "/CommentServlet")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("get");
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        int currentPage = request.getParameter("page")==null?1:Integer.parseInt((request.getParameter("page")));
        int pageSize = 10;

        DbUtil dbUtil = new DbUtil();
        Connection connection =null;
        Statement statement =null;
        ResultSet resultSet =null;
        List<CommentTest> comments =new ArrayList<>();

        try {
            connection = dbUtil.getConnection();
            statement = connection.createStatement();
            String sql ="SELECT * FROM comment WHERE articleId = " + articleId + " ORDER BY time DESC";
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                int articleID = resultSet.getInt("articleId");
                int userId = resultSet.getInt("userId");
                Date time = resultSet.getDate("time");
                String content = resultSet.getString("content");
                CommentTest comment = new CommentTest(articleID,userId,time,content);

                //所有comment都放到comments集合中
                comments.add(comment);
            }
            resultSet.close();
            statement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
// 获取分页参数
        int start = 0;
        int count = 10;

        try {
            start = Integer.parseInt(request.getParameter("page.start"));
            count = Integer.parseInt(request.getParameter("page.count"));
        } catch (Exception e) {
        }
        System.out.println("测试");
        System.out.println(comments.size());
        PageTest page = new PageTest(start, count,comments.size());
        System.out.println(page.getTotalPage());


// 共享数据
        request.setAttribute("comments",comments);
        request.setAttribute("page", page);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    this.doGet(request,response);
        System.out.println("post");
        String comment = request.getParameter("comment");
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        Date commentTime = new Date(System.currentTimeMillis());

        DbUtil dbUtil = new DbUtil();
        try {
            Connection connection = dbUtil.getConnection();
            String sql ="INSERT INTO comment (userId, articleId, content,time) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,userId);
            preparedStatement.setInt(2,articleId);
            preparedStatement.setString(3,comment);
            preparedStatement.setString(4,commentTime.toString());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect(request.getContextPath());
    }
}
