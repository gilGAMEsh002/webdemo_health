package service;

import dao.ArticleDao;
import dao.impl.ArticleDaoImpl;
import pojo.Article;
import pojo.SimpleArticle;
import utils.ArticleUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ArticleService {
    private ArticleDao dao;

    private static ArticleService instance;
    //获取实例
    public static final ArticleService getInstance() {
        if (instance == null) {
            try {
                instance = new ArticleService();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }
    private ArticleService() {
        dao = ArticleDaoImpl.getInstance();
    }
    //获取上一篇文章
    public Article getPreviousArticle(String time) {
        return dao.getANearArticle(time, dao.LESS);
    }
    //获取下一篇文章
    public Article getNextArticle(String time) {
        return dao.getANearArticle(time, dao.MORE);
    }
    //获取文章数
    public int getCount() {
        return dao.getCount();
    }
    //获取时间轴显示的文章
    public List getArticleList(){
        List<Article> articles = dao.getAllArticle();
        return articles;
    }
    //通过文章属性获取文章
    public List<Article> getArticle(String column, String value) {
        return dao.getArticleByColumn(column, value);
    }
    public List getArticle() {
        List<Article> list = dao.getAllArticle();
        for (Article a : list) {
            ArticleUtil.cutContent(list);
            ArticleUtil.cutTime(list);
        }
        return list;
    }
    //获得文章所有标签
    public List getTags(){
        return dao.getAllTags();
    }
    //获得简化版本文章
    public List getSimpleList() {
        // 获取数据库中的所有文章
        List<Article> articles = dao.getAllArticle();
        // 用来存 时间轴文章 (一种比Article类更简单适用的对象)
        List<SimpleArticle> simple_list = new ArrayList();
        // Article->SimpleArticle
        for (Article a : articles) {
            SimpleArticle at = ArticleUtil.getSimpleArticle(a);
            simple_list.add(at);
        }
        SimpleArticle tmp = null;
        List result = new LinkedList();
        // 塞进去最新的一个年份 并且塞入第一个SimpleArticle
        if (!simple_list.isEmpty()) {
            tmp = new SimpleArticle();
            tmp.setId(0);
            tmp.setYear(simple_list.get(0).getYear());
            result.add(tmp);
            result.add(simple_list.get(0));
        }
        // 判断文章年份是不是不一样 不一样则塞一个year
        for (int i = 1; i < simple_list.size(); i++) {
            int present_year = simple_list.get(i).getYear();
            int past_year = simple_list.get(i - 1).getYear();

            if (present_year < past_year) {
                tmp = new SimpleArticle();
                tmp.setId(0);
                tmp.setYear(present_year);
                result.add(tmp);
            }
            result.add(simple_list.get(i));
        }
        // 注意: 在list遍历里面动态修改了数组长度会出现内存溢出的情况
        return result;
    }
    //通过文章id获取title
    public String getTitle(int id) throws SQLException, ClassNotFoundException {
        return  new ArticleDaoImpl().getTitleById(id);
    }
    //通过文章title获取id
    public List getId(String title) throws SQLException, ClassNotFoundException {
        return  new ArticleDaoImpl().getIdByTitle(title);
    }
    //添加文章
    public Article addArticle(String title,String username,String content,String tags) throws SQLException, ClassNotFoundException {
        return new ArticleDaoImpl().addArticle(title,username,content,tags);
    }
    //删除文章
    public boolean deleteArticle(int id) throws SQLException, ClassNotFoundException {
        return  new ArticleDaoImpl().deleteArticle(id);
    }
}
