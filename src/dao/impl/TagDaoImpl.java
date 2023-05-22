package dao.impl;

import dao.TagDao;
import pojo.Tag;
import utils.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TagDaoImpl implements TagDao {
    private Connection connection = null;


    @Override
    public Tag getTag(ResultSet resultSet) throws SQLException {
        Tag tag= null;
        while(resultSet.next()){
            tag = new Tag();
            tag.setName(resultSet.getString("name"));
            tag.setId(resultSet.getInt("id"));
            tag.setArticle_number(resultSet.getString("Article_number"));
        }

        return tag;
    }
    public List<Tag> getTopTags() throws SQLException, ClassNotFoundException {

        System.out.println("TagDao");
        List<Tag> tags = new ArrayList<>();

        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT * FROM tags ORDER BY article_number DESC LIMIT 12";
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            Tag tag = new Tag(resultSet.getInt("id"),resultSet.getString("name"),resultSet.getString("Article_number"));
            tags.add(tag);
        }
//        for (Tag tag:tags
//             ) {
//            System.out.println(tag.getName());
//        }
        dbUtil.close(resultSet,preparedStatement,connection);

        return tags;
    }

    @Override
    public Tag findByName(String tagname) throws SQLException, ClassNotFoundException {
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "select * from tags where name = '"+tagname+"'";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        Tag result = getTag(resultSet);
        dbUtil.close(connection);
        return result;

    }

    @Override
    public Tag addTag(String tagname) throws SQLException, ClassNotFoundException {

        //设置标志;获取数据库连接
        Tag result ;
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();

        //编写sql及准备语句
        String sql = "INSERT IGNORE INTO tags(name) VALUES(?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,tagname);

        //执行sql,获取结果
        preparedStatement.executeUpdate();
        result = findByName(tagname);

        dbUtil.close(connection);
        dbUtil.close(preparedStatement);
        return result;
    }
    public boolean addAttachment(int article_id, int[] tags_id) throws SQLException, ClassNotFoundException {

        System.out.println("AttachDao2");
        //在article_tags关系数据库添加条目
        boolean flag = false;

        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        PreparedStatement preparedStatement ;

        int rows = 0;
        for (int tag_id:tags_id) {
            String sql ="INSERT INTO article_tag(article_id,tag_id) VALUES(?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,article_id);
            preparedStatement.setInt(2,tag_id);
            rows+=preparedStatement.executeUpdate();
        }

        if(rows== tags_id.length&&updateName()==rows)
            flag=true;

        return flag;
    }

    @Override
    public int updateName() throws SQLException, ClassNotFoundException {

        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql1 = "UPDATE article_tag JOIN articles ON article_tag.article_id = articles.article_id SET article_tag.article_title = articles.article_title;";
        String sql2 = "UPDATE article_tag JOIN tags ON article_tag.tag_id = tags.id SET article_tag.tag_name = tags.name";
        PreparedStatement preparedStatement = connection.prepareStatement(sql1);
        int result1 = preparedStatement.executeUpdate();
        int result2 = preparedStatement.executeUpdate(sql2);

        if(result2!=result1)
            System.out.println("result1:"+result1);
            System.out.println("result1:"+result1);
        dbUtil.close(connection);

        return result1 ;
    }
    public  boolean updateNumber(int[] tags_id) throws SQLException, ClassNotFoundException {
        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        int row = 0;
        for (int tag_id: tags_id) {
            String sql = "UPDATE tags SET article_number = article_number + 1 WHERE id =? ";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,tag_id);
            row+=preparedStatement.executeUpdate();
        }

        return row== tags_id.length;
    }

    public int findByIdFromArticle_tag(int tag_id) throws SQLException, ClassNotFoundException {

        DbUtil dbUtil = new DbUtil();
        connection = dbUtil.getConnection();
        String sql = "select COUNT(*) from article_tag where tag_id = '"+tag_id+"'";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        int number = 0;
        if(resultSet.next())
            number = resultSet.getInt(1);

        dbUtil.close(connection);
        return number;

    }


}
