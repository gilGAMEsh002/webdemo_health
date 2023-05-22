package pojo;

public class Tag {
    private int id;
    private String name;
    private String article_number;

    public Tag(String name) {
        this.name = name;
    }

    public Tag() {
        
    }

    public Tag(int id, String name, String article_number) {
        this.id = id;
        this.name = name;
        this.article_number = article_number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArticle_number() {
        return article_number;
    }

    public void setArticle_number(String article_number) {
        this.article_number = article_number;
    }
}
