package service;


import dao.CommentDao;

import dao.impl.CommentDaoImpl;

import pojo.Comment;


import java.util.List;

public class CommentService {
    private CommentDao dao;

    private  static  CommentService instance;

    //获取实例
    public static final CommentService getInstance(){
        if (instance == null) {
            try {
                instance = new CommentService();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }

    private CommentService(){
        dao= CommentDaoImpl.getInstance();
    }
    //添加评论
    public boolean addComment(int article_id,int User_id,String content,String username){
        return dao.add_comment(article_id, User_id, content,username);
    }
    //获取评论区页数
    public int get_page_count()  {
       return dao.get_page_count();
    }
    //通过文章id获取评论总数
    public int get_comment_count(int id) {
        return dao.get_comment_count(id);
    }
    //获取评论信息
    public List<Comment> get_comment(int current_page,int id)  {
       return dao.get_comment(current_page,id);
    }
    //获取所有评论
    public List getAllComments(){
        return  dao.getAllComments();
    }
    //删除某条评论
    public boolean deleteComment(int id){
        return dao.delete_comment(id);
    }
}
