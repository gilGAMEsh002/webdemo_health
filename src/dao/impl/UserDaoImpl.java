package dao.impl;

import dao.UserDao;
import pojo.User;
import utils.DbUtil;
import utils.MD5;

import java.sql.*;


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
    public boolean updateUser(String vara1) {
        return false;
    }

    public User updateUserName(String oldName,String newName) throws SQLException, ClassNotFoundException {
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "update user set username =? where username=?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,newName);
        preparedStatement.setString(2,oldName);


        int row = preparedStatement.executeUpdate();
        if(row==1){
            System.out.println("(DAO)updateUserName更新username成功");
            return this.findByUsername(newName);
        }

        return null;
    }

    public User updateMail(User oldUser,String newMail) throws SQLException, ClassNotFoundException {
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "update user set mail =? where username=?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,newMail);
        preparedStatement.setString(2,oldUser.getUserName());


        int row = preparedStatement.executeUpdate();
        if(row==1){
            System.out.println("(DAO)updateUserPassword更新Password成功");
            return this.findByUsername(oldUser.getUserName());
        }

        return null;
    }

    public User updatePassword(User oldUser, String newUserPassword) throws SQLException, ClassNotFoundException {
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "update user set password=? where username=?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,MD5.stringToMD5(newUserPassword));
        preparedStatement.setString(2,oldUser.getUserName());

        User newUser = null;
        int row = preparedStatement.executeUpdate();
        if(row==1){
            System.out.println("(DAO)updateUserMail更新mail成功");
            return this.findByUsername(oldUser.getUserName());
        }


        return null;
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
