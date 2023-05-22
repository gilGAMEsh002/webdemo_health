package dao.impl;

import pojo.Message;
import pojo.User;
import utils.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//CREATE DATABASE IF NOT EXISTS __;
//CREATE TABLE IF NOT EXISTS  表名(
//        字段1, 数据类型 [约束条件] [默认值],
//        字段2, 数据类型 [约束条件] [默认值],
//        字段3, 数据类型 [约束条件] [默认值],
//        ……
//        [表约束条件]
//        );
//DROP DATABASE IF EXISTS __;
public class MessageDao {
    private Connection connection =null;

    public void add_contacts(Message message, User user) throws SQLException, ClassNotFoundException {

        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql="insert into message values(?,?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,message.getTime());
//        preparedStatement.setString(2,message.getName());
        preparedStatement.setString(2, user.getUserName());
        preparedStatement.setString(3,message.getTitle());
        preparedStatement.setString(4,message.getContacts());
        preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
    }

    public List<Message> get_contacts(String username) throws SQLException, ClassNotFoundException {
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "select * from message where name='"+username+"';";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Message> list=new ArrayList<>();
        while(resultSet.next()){
            Message temp=new Message();
            temp.setTime(resultSet.getString("time"));
            temp.setName(resultSet.getString("name"));
            temp.setTitle(resultSet.getString("title"));
            temp.setContacts(resultSet.getString("contacts"));
            list.add(temp);
        }
        resultSet.close();preparedStatement.close();connection.close();
        return list;
    }
}
