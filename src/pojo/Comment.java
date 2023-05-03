package pojo;

public class Comment {
    private String username;
    private String content;//150个字内
    private String date;

    public Comment() {
    }
    public Comment(String username, String content, String date) {
        this.username = username;
        this.content = content;
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public String getContent() {
        return content;
    }

    public String getDate() {
        return date;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    //只有第一次发评论时可以使用,不允许修改评论,可以删除评论
    public void setContent(String content) {
        this.content = content;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
