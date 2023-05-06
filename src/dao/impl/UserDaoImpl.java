package dao.impl;

import dao.UserDao;
import pojo.User;
import utils.DbUtil;
import utils.MD5;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDaoImpl implements UserDao {
    private Connection connection =null;

    private User getUser(ResultSet resultSet) throws SQLException {
        User user = null;
        if(resultSet.next()){
            user = new User();
            user.setUserName(resultSet.getString("username"));
            user.setMail(resultSet.getString("mail"));
            user.setPassword(resultSet.getString("password"));
        }
        return user;
    }

    @Override
    public User findByUsername(String username) throws SQLException, ClassNotFoundException {

        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "select * from user where username = '"+username+"'";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        User user = getUser(resultSet);
        dbUtil.close(connection);
        return user;
    }

    @Override
    public boolean addUser(User user) throws SQLException, ClassNotFoundException {

        boolean flag = false;
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "insert into user(username,password,mail,collection_number,comment_number)values(?,?,?,0,0)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, user.getUserName());
        preparedStatement.setString(2, MD5.stringToMD5(user.getPassword()));//最后添加密码到数据库要添加MD5格式的
        preparedStatement.setString(3, user.getMail());

        preparedStatement.executeUpdate();
        if(findByUsername(user.getUserName())!=null){
            flag = true;
        }
        return flag;
    }

    @Override
    public User findById(String id) {

        return null;
    }

    @Override
    public boolean updateStatus(String vara1) {
        return false;
    }

    @Override
    public User findByUsernameAndPassword(User user) throws SQLException, ClassNotFoundException {
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "select * from user where username=? and password=?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, user.getUserName());
        preparedStatement.setString(2, user.getPassword());
        ResultSet resultSet = preparedStatement.executeQuery();

        User userResult = getUser(resultSet);
        dbUtil.close(connection);
        return userResult;

    }
}
