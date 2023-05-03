package pojo;

public class User {

    private int id;

    private String name;
    private String pwd;
    private String mail;

    private int collections=0;
    private int comments=0;
    public User(){

    }

    public User(String username, String password, String mail){
        name = username;
        pwd = password;
        this.mail = mail;
    }
//Getter:所有属性
    public int getId() {
        return id;
    }

    public String getUserName() {
        return name;
    }

    public String getPassword() {
        return pwd;
    }

    public int getCollectionsNumber() {
        return collections;
    }

    public int getCommentsNumber() {
        return comments;
    }
//Setter:除了id

    public void setUserName(String username) {
        this.name = username;
    }

    public void setPassword(String password) {
        this.pwd = password;
    }

    //收藏数特殊点,不用传参数,调用就是+1
    //评论数同上
    public void addCollections() {
        this.collections++;
    }

    public void addComments() {
        this.comments++;
    }


    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
}
