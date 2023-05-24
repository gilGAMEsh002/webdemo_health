package service.impl;

import dao.impl.TagDaoImpl;
import pojo.Article;
import pojo.Tag;
import service.TagService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TagServiceImpl implements TagService {

    private final TagDaoImpl tagDao = new TagDaoImpl();
    @Override
    public List<Tag> getTopTags() throws SQLException, ClassNotFoundException {
        System.out.println("TagService");
        return tagDao.getTopTags();

    }
    public boolean attach(int article_id,String[] tags) throws SQLException, ClassNotFoundException {

        System.out.println("attachService");

        //如果不存在tag,添加tag
        for (int i = 0; i < tags.length; i++) {
            if(tagDao.findByName(tags[i]) == null){
                tagDao.addTag(tags[i]);
            }
        }

        //根据标签名,获得标签id
        int[] tags_id = new int[tags.length];
        for (int i = 0; i < tags.length; i++) {
            tags_id[i] = tagDao.findByName(tags[i]).getId();
        }

        //将article_id和tag_id联系起来
        boolean flag_connection =  tagDao.addAttachment(article_id,tags_id);

        //更新标签的article_number
        boolean flag_number= tagDao.updateNumber(tags_id);

        return flag_connection&flag_number;

    }

    @Override//获取有这个标签的所有的文章
    public List<Article> getArticles(int[] tags_id) {
        List<Article> articles = new ArrayList<>();


        return articles;
    }

    @Override
    public Tag addTag(String tagname) throws SQLException, ClassNotFoundException {
        return tagDao.addTag(tagname);
    }

    @Override
    public Tag deleteTag(String tagname) {
        return null;
    }
}
