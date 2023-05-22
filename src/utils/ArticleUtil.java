package utils;

import pojo.Article;
import pojo.SimpleArticle;

import java.util.List;

//文章处理类（主要是简化文章显示）
public class ArticleUtil {

    //简化时间
    public static List cutTime(List<Article> list) {
        for (Article a : list) {
            //将时间只取到日
            a.setDate(a.getDate().substring(0, 11));
        }
        return list;
    }
    public static Article cutTime(Article a) {
        a.setDate(a.getDate().substring(0, 11));
        return a;
    }
    //简化内容
    public static List cutContent(List<Article> list) {
        for (Article a : list) {
            if (a.getContent() != null && a.getContent().length() > 203) {
                //只显示200字
                a.setContent(a.getContent().substring(0, 200) + "...");
            }
        }
        return list;
    }
    public static SimpleArticle getSimpleArticle(Article article) {

        SimpleArticle simpleArticle = new SimpleArticle();

        simpleArticle.setTitle(article.getTitle());
        simpleArticle.setId(article.getArticle_id());

        String year = StringUtil.cutString(article.getDate(), 0, 4);
        String month = StringUtil.cutString(article.getDate(), 5, 7);
        String day = StringUtil.cutString(article.getDate(), 8, 10);

        simpleArticle.setYear(Integer.valueOf(year));
        simpleArticle.setMonth(Integer.valueOf(month));
        simpleArticle.setDay(Integer.valueOf(day));
        simpleArticle.setTags(article.getTags());
        return simpleArticle;
    }
}
