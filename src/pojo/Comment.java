package pojo;

public class Comment {
    private int user_id;
    private int comment_id;
    private String comment_content;
    private String comment_publish_date;
    private int article_id;
    private String username;

    public Comment() {
    }

    public Comment(int user_id, int comment_id, String comment_content, String comment_publish_date, int article_id,String username) {
        this.user_id = user_id;
        this.comment_id = comment_id;
        this.comment_content = comment_content;
        this.comment_publish_date = comment_publish_date;
        this.article_id = article_id;
        this.username=username;
    }

    /**
     * 获取
     * @return user_id
     */
    public int getUser_id() {
        return user_id;
    }

    /**
     * 设置
     * @param user_id
     */
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    /**
     * 获取
     * @return comment_id
     */
    public int getComment_id() {
        return comment_id;
    }

    /**
     * 设置
     * @param comment_id
     */
    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    /**
     * 获取
     * @return comment_content
     */
    public String getComment_content() {
        return comment_content;
    }

    /**
     * 设置
     * @param comment_content
     */
    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    /**
     * 获取
     * @return comment_publish_date
     */
    public String getComment_publish_date() {
        return comment_publish_date;
    }

    /**
     * 设置
     * @param comment_publish_date
     */
    public void setComment_publish_date(String comment_publish_date) {
        this.comment_publish_date = comment_publish_date;
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
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    public String toString() {
        return "Comment{user_id = " + user_id + ", comment_id = " + comment_id + ", comment_content = " + comment_content + ", comment_publish_date = " + comment_publish_date + ", article_id = " + article_id + ", username = " + username + "}";
    }
}
