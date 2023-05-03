package service;

import pojo.User;

import java.sql.SQLException;

public interface UserService {
    boolean regist(User var1) throws SQLException, ClassNotFoundException;
    User login(User var1);
}
