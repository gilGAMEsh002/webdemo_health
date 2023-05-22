package pojo;

import java.util.Date;

public class Article {
    private String title;
    private String date;
    private String author;
    private int article_id;
    private String content;
    private int collections;
    private String tags;

    public Article(String s, Date date) {
    }

    public Article(String title, String date, String author, int article_id, String content, int collections, String tags) {
        this.title = title;
        this.date = date;
        this.author = author;
        this.article_id = article_id;
        this.content = content;
        this.collections=collections;
        this.tags=tags;
    }

    /**
     * 获取
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取
     * @return date
     */
    public String getDate() {
        return date;
    }

    /**
     * 设置
     * @param date
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * 获取
     * @return author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * 设置
     * @param author
     */
    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     * 获取
     * @return article_id
     */
    public int getArticle_id() {
        return article_id;
    }

    /**
     * 设置
     * @param article_id
     */
    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    /**
     * 获取
     * @return content
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置
     * @param content
     */
    public void setContent(String content) {
        this.content = content;
    }

    public String toString() {
        return "Article{title = " + title + ", date = " + date + ", " +
                "author = " + author + ", article_id = " + article_id + ", " +
                "content = " + content + ",collections = "+collections+","+
                "tags = "+tags+"}";
    }

    /**
     * 获取
     * @return collections
     */
    public int getCollections() {
        return collections;
    }

    /**
     * 设置
     * @param collections
     */
    public void setCollections(int collections) {
        this.collections = collections;
    }

    /**
     * 获取
     * @return tags
     */
    public String getTags() {
        return tags;
    }

    /**
     * 设置
     * @param tags
     */
    public void setTags(String tags) {
        this.tags = tags;
    }

}
