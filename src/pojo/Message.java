package pojo;

public class Message {
    private String time;
    private String name;
    private String title;
    private String contacts;

    public Message(){

    }

    public Message(String time, String name, String title, String contacts){
        this.time=time;
        this.name = name;
        this.title = title ;
        this.contacts = contacts;
    }

    public String getTime(){return time;}
    public String getName(){return name;}
    public String getTitle(){return title;}
    public String getContacts(){return contacts;}

    public void setTime(String time){this.time=time;}
    public void setName(String name){this.name=name;}
    public void setTitle(String title){this.title=title;}
    public void setContacts(String contacts){this.contacts = contacts;}
    public String toString(){
        return time+" "+name+" "+title+" "+contacts;
    }
}
