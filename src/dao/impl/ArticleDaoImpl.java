package dao.impl;

import dao.ArticleDao;
import pojo.Article;
import utils.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//进行文章的操作
public class ArticleDaoImpl implements ArticleDao {
    private Connection connection;
    private DbUtil dbUtil;
    private static ArticleDao instance;
    //创建一次实例才进行一次数据库链接
    public ArticleDaoImpl() throws SQLException, ClassNotFoundException {
        dbUtil = new DbUtil();
        connection=dbUtil.getConnection();
    }
    public static final ArticleDao getInstance() {
        if (instance == null) {
            try {
                instance = new ArticleDaoImpl();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;

    }
    @Override
    //less_or_more值为1代表是参数日期之前，2是参数日期之后
    public Article getANearArticle(String time, int less_or_more) {
        Article article = null;
        String sql = null;
        if (less_or_more == this.LESS) {
            //将表按article_time从大到小的顺序排好
            sql = " SELECT  * FROM table_article WHERE article_time< '" + time + "'  ORDER BY article_time DESC ";
        } else if (less_or_more == this.MORE) {
            sql = " SELECT  * FROM table_article WHERE article_time > '" + time + "'  ORDER BY article_time ";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                article = new Article(rs.getString("title"), rs.getString("article_time"),
                        rs.getString("author"),rs.getInt("article_id"),
                       rs.getString("content"),rs.getInt("collections"),
                        rs.getString("tags"));
            }
            dbUtil.close(rs);
            dbUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return article;
    }
    //添加文章
    @Override
    public Article addArticle(String title,String username,String content,String tags) {
        String sql = "insert into table_article(title,author,article_time,content,collections,tags) values(?,?,?,?,?,?)";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        PreparedStatement ps;
        int result = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,title);
            ps.setString(2, username);
            ps.setString(3, df.format(date));
            ps.setString(4, content);
            ps.setInt(5, 0);
            ps.setString(6, tags);
            result = ps.executeUpdate();
            System.out.println(result);
            dbUtil.close(ps);
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return this.getLastArticle();
    }
    //删除文章
    @Override
    public boolean deleteArticle(int id) {
        String sql = "delete from table_article where article_id=?";
        PreparedStatement ps;
        int result = 0;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, String.valueOf(id));
            result = ps.executeUpdate();
            // 关闭连接
            dbUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result!=0;

    }
    //时间从最新的开始获取
    @Override
    public List getAllArticle() {
        List<Article> list = new ArrayList();
        //将时间按降序排列
        String sql = "SELECT  * FROM table_article ORDER BY article_time DESC ";
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            // bean实例化
            while (rs.next()) {
                Article article = new Article(rs.getString("title"), rs.getString("article_time"), rs.getString("author"),rs.getInt("article_id"),
                        rs.getString("content"),rs.getInt("collections"),
                        rs.getString("tags"));
                list.add(article);
            }
            // 关闭连接
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //获取最新的文章
    @Override
    public Article getLastArticle(){
        //将表按时间从大到小的顺序排，取最上面的1条（最新的文章）
        String sql = "SELECT * FROM table_article ORDER BY article_time DESC LIMIT 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Article article = new Article(rs.getString("title"), rs.getString("article_time"), rs.getString("author"),rs.getInt("article_id"),
                        rs.getString("content"),rs.getInt("collections"),
                        rs.getString("tags"));
                dbUtil.close(ps);
                dbUtil.close(rs);
                return article;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    //通过某一属性查找文章
    @Override
    public List<Article> getArticleByColumn(String column, String value) {
        List<Article> list = null;
        Article a = null;
        String sql = "select * from table_article where " + column + " = ?";
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, value);
            ResultSet rs = ps.executeQuery();
            // bean实例化
            list = new ArrayList();
            while (rs.next()) {
                a = new Article(rs.getString("title"), rs.getString("article_time"), rs.getString("author"),rs.getInt("article_id"),
                        rs.getString("content"),rs.getInt("collections"),
                        rs.getString("tags"));
                list.add(a);
            }
            // 关闭连接
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //收藏文章,并获取文章的收藏数
    @Override
    public int collect_article(int id) {
        String sql = "update table_article set collections=collections+1 where article_id=" + id;
        int result = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        sql = "select collections from table_article where article_id=" + id;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    //获取到所有的tags
    @Override
    public List getAllTags(){
        String sql = " select distinct(tags) from table_article";
        List list = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //获取文章数
    @Override
    public int  getCount(){
        String sql;
        sql = "SELECT COUNT(article_id) FROM table_article";
        int result = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public String getTitleById(int id) {
        String sql="SELECT title FROM table_article WHERE article_id=?";
        String result = "";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, String.valueOf(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString(1);
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List getIdByTitle(String title) {
        String sql="SELECT article_id FROM table_article WHERE title = 'test'";
        List list=null;
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            list=new ArrayList<>();
            while(rs.next()) {
                list.add(rs.getInt("article_id"));
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
