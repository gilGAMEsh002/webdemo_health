package dao.impl;

import dao.SearchDao;
import pojo.Essay;
import utils.DbUtil;

import java.sql.*;
import java.util.ArrayList;

public class SearchDaoImpl implements SearchDao {
    private Connection connection;
    private DbUtil dbUtil;

    private static SearchDao instance;
    //创建一次实例才进行一次数据库链接
    public SearchDaoImpl() throws SQLException, ClassNotFoundException {
        dbUtil = new DbUtil();
        connection=dbUtil.getConnection();
    }
    public static final SearchDao getInstance(){
        if(instance==null){
            try {
                instance=new SearchDaoImpl();
            }
            catch (Exception e){
                e.printStackTrace();
            }

        }
        return instance;
    }
    //查找
    @Override
    public ArrayList queryAllEssay(String search) {
        ArrayList<Essay> list=null;
        Essay essay=new Essay();
        //essay.setU_in(search);
        String sql = "SELECT* FROM table_article WHERE LOCATE(?,article_id)>0 OR LOCATE(?,title)>0";
        PreparedStatement ps;
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1,search);//给第一个赋值
            ps.setString(2,search);//第二个赋值
            ResultSet rs = ps.executeQuery();
            list=new ArrayList<>();

            while (rs.next()){
                essay.setTitle(rs.getString("title"));
                essay.setContent(rs.getString("content"));
                essay.setArticle_id(rs.getInt("article_id"));
                essay.setTags(rs.getString("tags"));
                list.add(essay);
                essay=new Essay();
            }
            dbUtil.close(ps);
            dbUtil.close(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
}
