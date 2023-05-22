package service;

import pojo.Article;
import pojo.Tag;

import java.sql.SQLException;
import java.util.List;

public interface TagService {
    public List<Tag> getTopTags() throws SQLException, ClassNotFoundException;
    public List<Article> getArticles(int[] tags_id);
    public Tag addTag(String tagname) throws SQLException, ClassNotFoundException;
    public Tag deleteTag(String tagname);
}
