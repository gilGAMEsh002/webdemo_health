package pojo;

public class Essay {
    public   String title;
    public   String content;

    public   String U_in;
    private int article_id;
    private String tags;

    public Essay() {
    }

    public Essay(String title, String content, String U_in, int article_id, String tags) {
        this.title = title;
        this.content = content;
        this.U_in = U_in;
        this.article_id = article_id;
        this.tags = tags;
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

    /**
     * 获取
     * @return U_in
     */
    public String getU_in() {
        return U_in;
    }

    /**
     * 设置
     * @param U_in
     */
    public void setU_in(String U_in) {
        this.U_in = U_in;
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

    public String toString() {
        return "Essay{title = " + title + ", content = " + content + ", U_in = " + U_in + ", article_id = " + article_id + ", tags = " + tags + "}";
    }
}
