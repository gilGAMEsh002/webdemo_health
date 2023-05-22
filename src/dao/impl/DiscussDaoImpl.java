package dao.impl;

import java.sql.Connection;
import dao.DiscussDao;
import pojo.Discuss;
import utils.DbUtil;

import java.awt.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DiscussDaoImpl implements DiscussDao {
    private final int max_size=10;//一页的评论量
    private Connection connection;
    private DbUtil dbUtil;

    private static DiscussDaoImpl instance;
    public DiscussDaoImpl() throws SQLException, ClassNotFoundException {
        dbUtil = new DbUtil();
        connection=dbUtil.getConnection();
    }
    public static final DiscussDaoImpl getInstance(){
        if(instance==null){
            try {
                instance = new DiscussDaoImpl();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }
    //获取话题区页数
    @Override
    public int get_page_count(int topic_id) {
        PreparedStatement ps=null;
        String sql="select count(*) as count from table_discuss where topic_id=?";
        ResultSet rs=null;
        int count=0;
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,topic_id);
            rs=ps.executeQuery();

            if(rs.next()){
                count=rs.getInt("count");
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        }catch (SQLException e){
            e.printStackTrace();
        }

        if(count%max_size==0){
            return count/max_size;
        }else {
            return count/max_size+1;
        }
    }
    //获取话题总数
    @Override
    public int get_discuss_count(int topic_id) {

        PreparedStatement ps=null;
        String sql="select count(*) as count from table_discuss where topic_id=?";
        ResultSet rs=null;
        int count=0;
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,topic_id);
            rs=ps.executeQuery();
            if(rs.next()){
                count=rs.getInt("count");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                dbUtil.close(ps);
                dbUtil.close(rs);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return count;
    }
    //获取话题信息
    @Override
    public List get_discuss(int current_page, int topic_id) {
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from table_discuss where topic_id=? limit ?,?";

        List<Discuss> discuss_list=new ArrayList();
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,topic_id);
            ps.setInt(2,(current_page-1)*max_size);
            ps.setInt(3,max_size);
            rs=ps.executeQuery();
            while(rs.next()){
                Discuss temp=new Discuss();
                temp.setDiscuss_content(rs.getString("discuss_content"));
                temp.setDiscuss_publish_date(rs.getString("discuss_publish_date"));
                temp.setUser_id(rs.getInt("user_id"));
                temp.setUsername(rs.getString("username"));
                discuss_list.add(temp);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                dbUtil.close(ps);
                dbUtil.close(rs);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return discuss_list;

    }
    //添加评论
    @Override
    public boolean add_comment(String comment, int topic_id, int user_id,String username) {
        Date date = new Date();//获取当前时间
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

        String sql="insert into table_discuss(user_id,topic_id,discuss_content,discuss_publish_date,username) values(?,?,?,?,?)";
        try{
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1,user_id);
            ps.setInt(2,topic_id);
            ps.setString(3,comment);
            ps.setString(4,dateFormat.format(date));
            ps.setString(5,username);

            int i=ps.executeUpdate();

            if(i==1){
                dbUtil.close(ps);

                return true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }



}
