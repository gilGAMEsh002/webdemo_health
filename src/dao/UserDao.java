package dao;

import pojo.User;

import java.sql.SQLException;

public interface UserDao {
    User findByUsername(String var1) throws SQLException, ClassNotFoundException;

    boolean addUser(User var1) throws SQLException, ClassNotFoundException;

    User findById(String var1);

    boolean updateStatus(String vara1);

    User findByUsernameAndPassword(User var1) throws SQLException, ClassNotFoundException;
}
