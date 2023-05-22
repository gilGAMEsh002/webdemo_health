package dao.impl;

import dao.CommentDao;
import pojo.Comment;
import utils.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CommentDaoImpl implements CommentDao {
    private final int max_size=10;
    private Connection connection;
    private DbUtil dbUtil;
    private static CommentDaoImpl instance;
    //创建一次实例
    public CommentDaoImpl() throws SQLException, ClassNotFoundException {
        dbUtil = new DbUtil();
        connection= dbUtil.getConnection();
    }
    public static final CommentDaoImpl getInstance(){
        if (instance == null) {
            try {
                instance = new CommentDaoImpl();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }
    //添加评论
    @Override
    public boolean add_comment(int article_id,int User_id,String content,String username) {
        Date date = new Date();//获取当前时间
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
        String sql="insert into table_comments (comment_id,article_id,user_id,content,comment_publish_date,username) values(null,?,?,?,?,?)";
        PreparedStatement ps;
        int result=0;
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,article_id);
            ps.setInt(2,User_id);
            ps.setString(3,content);
            ps.setString(4,dateFormat.format(date));
            ps.setString(5,username);

            result=ps.executeUpdate();
            dbUtil.close(ps);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result>0;
    }

    @Override
    public boolean delete_comment(int comment_id) {
        String sql="delete from table_comments where comment_id=?";
        PreparedStatement ps;
        int result = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, String.valueOf(comment_id));
            result = ps.executeUpdate();
            // 关闭连接
            dbUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result!=0;
    }
    //获取评论区页数
    @Override
    public int get_page_count() {
        PreparedStatement ps=null;
        String sql="select count(*) as count from table_comments";
        ResultSet rs=null;
        int count=0;
        try {
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();

            if(rs.next()){
                count=rs.getInt("count");
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(count%max_size==0){
            return count/max_size;
        }else {
            return count/max_size+1;
        }
    }
    //获取评论总数
    @Override
    public int get_comment_count(int id) {
        PreparedStatement ps=null;
        String sql="select count(*) as count from table_comments where article_id="+id;
        ResultSet rs=null;
        int count=0;
        try {
            ps=connection.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next()){
                count+=rs.getInt("count");
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    //获取评论信息
    @Override
    public List get_comment(int current_page,int id) {
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from table_comments where article_id=? limit ?,?";

        List<Comment> comment_list=new ArrayList<>();
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2,(current_page-1)*max_size);
            ps.setInt(3,max_size);
            rs=ps.executeQuery();
            while(rs.next()){
                Comment temp=new Comment();
                temp.setUser_id(rs.getInt("user_id"));
                temp.setComment_id(rs.getInt("comment_id"));
                temp.setComment_content(rs.getString("content"));
                temp.setComment_publish_date(rs.getString("Comment_publish_date"));
                temp.setArticle_id(rs.getInt("article_id"));
                temp.setUsername(rs.getString("username"));
                comment_list.add(temp);
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comment_list;
    }

    @Override
    public List getAllComments() {
        List<Comment> commentList=new ArrayList();
        //将时间按降序排列
        String sql="SELECT  * FROM table_comments ORDER BY comment_publish_date DESC ";
       PreparedStatement ps;

        try {
            ps=connection.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            //实例化
            while(rs.next()){
                Comment comment=new Comment(rs.getInt("user_id"),rs.getInt("comment_id"),
                        rs.getString("content"),rs.getString("comment_publish_date"),
                        rs.getInt("article_id"),rs.getString("username"));
              commentList.add(comment);
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }

}
