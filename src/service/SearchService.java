package service;

import dao.SearchDao;
import dao.impl.ArticleDaoImpl;
import dao.impl.SearchDaoImpl;

import java.util.ArrayList;

public class SearchService {
    private SearchDao dao;
    private static SearchService instance;
    //获取实例
    public static final SearchService getInstance(){
        if (instance == null) {
            try {
                instance = new SearchService();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }
    private SearchService() {
        dao = SearchDaoImpl.getInstance();
    }
    //查找
    public ArrayList queryAllEssay(String search){
        return dao.queryAllEssay(search);
    }
}
