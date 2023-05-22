package dao;


import java.util.List;

public interface DiscussDao {
    //获取页数
    int get_page_count(int topic_id);
    //获取数量
    int get_discuss_count(int topic_id);
    //获取评论信息
    List get_discuss(int current_page, int topicid);
    //添加评论
    boolean add_comment(String comment,int topic_id,int user_id,String username);

}
