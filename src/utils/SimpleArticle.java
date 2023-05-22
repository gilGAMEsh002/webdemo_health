package utils;

public class SimpleArticle {
    private String title;
    private int id;
    private int year;
    private int month;
    private int day;
    private String tags;

    public SimpleArticle() {
    }

    public SimpleArticle(String title, int id, int year, int month, int day, String tags) {
        this.title = title;
        this.id = id;
        this.year = year;
        this.month = month;
        this.day = day;
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
     * @return id
     */
    public int getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * 获取
     * @return year
     */
    public int getYear() {
        return year;
    }

    /**
     * 设置
     * @param year
     */
    public void setYear(int year) {
        this.year = year;
    }

    /**
     * 获取
     * @return month
     */
    public int getMonth() {
        return month;
    }

    /**
     * 设置
     * @param month
     */
    public void setMonth(int month) {
        this.month = month;
    }

    /**
     * 获取
     * @return day
     */
    public int getDay() {
        return day;
    }

    /**
     * 设置
     * @param day
     */
    public void setDay(int day) {
        this.day = day;
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
        return "SimpleArticle{title = " + title + ", id = " + id + ", year = " + year + ", month = " + month + ", day = " + day + ", tags = " + tags + "}";
    }
}
