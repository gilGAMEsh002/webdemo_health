package pojo;

public class Discuss {
    private int user_id;
    private String discuss_content;
    private String discuss_publish_date;
    private String username;

    public Discuss() {
    }

    public Discuss(int user_id, String discuss_content, String discuss_publish_date, String username) {
        this.user_id = user_id;
        this.discuss_content = discuss_content;
        this.discuss_publish_date = discuss_publish_date;
        this.username = username;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setDiscuss_content(String discuss_content) {
        this.discuss_content = discuss_content;
    }

    public void setDiscuss_publish_date(String discuss_publish_date) {
        this.discuss_publish_date = discuss_publish_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getDiscuss_content() {
        return discuss_content;
    }

    public String getDiscuss_publish_date() {
        return discuss_publish_date;
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
        return "Discuss{user_id = " + user_id + ", discuss_content = " + discuss_content + ", discuss_publish_date = " + discuss_publish_date + ", username = " + username + "}";
    }
}
