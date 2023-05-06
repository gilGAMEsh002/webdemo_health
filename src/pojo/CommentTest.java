package pojo;

import java.util.Date;

public class CommentTest {
    private int id;
    private int user_id;
    private Date time;
    private String content ;

    public CommentTest(int id, int user_id, Date time, String content) {
        this.id = id;
        this.user_id = user_id;
        this.time = time;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
