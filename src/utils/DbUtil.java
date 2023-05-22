package utils;

import java.sql.*;

public class DbUtil {
    private String dbUrl = "jdbc:mysql://localhost:3306/healthweb?useUnicode=true&useCharacter=utf8&useSSL=true";
    private String dbUsername = "root";
    private String dbPassword = "2wuyuanzhou";

    public Connection getConnection() throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbUrl,dbUsername,dbPassword);

    }

    public void close(ResultSet resultSet,Statement statement,Connection connection) throws SQLException {
        close(resultSet);
        close(connection);
        close(statement);
    }
    public void close(ResultSet resultSet) throws SQLException {
        if(resultSet!=null){
            resultSet.close();
        }
    }

    public void close(Statement statement) throws SQLException {
        if(statement!=null){
            statement.close();
        }
    }

    public void close(Connection connection) throws SQLException {
        if(connection!=null){
            connection.close();
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        DbUtil dbUtil = new DbUtil();
        dbUtil.getConnection();
        System.out.println("链接成功");
    }

}
