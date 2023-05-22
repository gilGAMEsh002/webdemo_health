package dao;

import pojo.Comment;

import java.util.List;

public interface CommentDao {
    //添加评论
    boolean add_comment(int article_id,int User_id,String content,String username);
    //删除评论
    boolean delete_comment(int comment_id);
    //获取评论区页数
    int get_page_count();
    //获取评论总数
    int get_comment_count(int id);
    //获取评论信息
    List get_comment(int current_page,int id);
    //获取所有评论
    List getAllComments();
}
