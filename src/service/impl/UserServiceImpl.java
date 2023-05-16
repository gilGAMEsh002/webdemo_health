package service.impl;

import dao.impl.UserDaoImpl;
import pojo.User;
import service.UserService;

import java.sql.SQLException;

public class UserServiceImpl implements UserService {

    @Override
    public boolean regist(User user) throws SQLException, ClassNotFoundException {

        UserDaoImpl userDao = new UserDaoImpl();
        //1.在user表中查找是否有同名用户
        if(userDao.findByUsername(user.getUserName())!=null){
            //有,则返回false
            return false;
        }{
            //无,则添加进数据库
            userDao.addUser(user);
            return true;
        }

    }

    @Override
    public User login(User user) {

        UserDaoImpl userDao = new UserDaoImpl();


        try {
            return userDao.findByUsernameAndPassword(user);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public User updateUserName(User oldUser,String newUserName) throws SQLException, ClassNotFoundException {

        User newUser = null;

        UserDaoImpl userDao = new UserDaoImpl();

        if(userDao.findByUsername(newUserName)!=null){
            //有,则返回null
            return null;
        }{
            //无,则进行更新
            try{
                return userDao.updateUserName(oldUser.getUserName(),newUserName);
            }catch (SQLException | ClassNotFoundException e){
                throw new RuntimeException(e);
            }
        }



    }

}
