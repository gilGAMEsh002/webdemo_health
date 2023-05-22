package dao;

import pojo.Article;

import java.util.List;

public interface ArticleDao {
     static final int LESS = 1;
     static final int MORE = 2;
     //获取上一篇或下一篇文章
    Article getANearArticle(String time, int less_or_more);
    //新的文章
    Article addArticle(String title,String username,String content,String tags);
    //删除文章
    boolean deleteArticle(int id);
    //获取所有文章
    List getAllArticle();
    //获取最新文章
    Article getLastArticle() ;
    //通过数据库某一列查询文章
    List<Article> getArticleByColumn(String column, String value);
    //收藏了文章
    int collect_article(int id);
    //返回所有的tags
    List getAllTags();
    //获取文章数
    int getCount();
    //通过文章id获取title
    String getTitleById(int id);
    //通过文章title获取id
    List getIdByTitle(String Title);

}
