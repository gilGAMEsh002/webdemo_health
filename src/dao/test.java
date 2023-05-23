package dao;

import service.CommentService;

public class test {
    public static void main(String[] args) {
        CommentService cs=CommentService.getInstance();
        cs.addComment(7,1,"dsadasdas","dada");
    }
}
