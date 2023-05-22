package dao;

import pojo.Tag;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface TagDao {
   public Tag getTag(ResultSet resultSet) throws SQLException;
   public Tag findByName(String tagname) throws SQLException, ClassNotFoundException;
   public Tag addTag(String tagname) throws SQLException, ClassNotFoundException;

   int updateName() throws SQLException, ClassNotFoundException;
}
