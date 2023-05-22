package service;

import dao.DiscussDao;
import dao.impl.DiscussDaoImpl;

import java.util.List;

public class DiscussService {
    private DiscussDao dao;
    private static DiscussService instance;
    public static final DiscussService getInstance(){
        if (instance == null) {
            try {
                instance = new DiscussService();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }
    private DiscussService(){
        dao=DiscussDaoImpl.getInstance();
    }
    //获取话题区页数
    public int get_page_count(int topic_id){
        return dao.get_page_count(topic_id);
    }
    //获取话题总数
    public int get_discuss_count(int topic_id){
        return dao.get_discuss_count(topic_id);
    }
    //获取话题信息
    public List get_discuss(int current_page, int topic_id){
        return dao.get_discuss(current_page,topic_id);
    }
    //添加评论
    public boolean add_comment(String comment, int topic_id, int user_id,String username) {
        return dao.add_comment(comment,topic_id,user_id,username);
    }

}
