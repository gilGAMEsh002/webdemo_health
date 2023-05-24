package dao;

import java.util.ArrayList;

public interface CollectDao {

    public void addCollect(String username,String articleName,String favorite);
    /* 在collect_table表中添加收藏关系*/
    public void deleteCollection(String username,String articleName);
    /*在collect_table表中删除收藏关系*/
    public boolean is_collect(String username,String articleName);
    /* 收藏关系是否存在*/
    public ArrayList userCollections(String username,String favorite);
    /*用户收藏列表查询*/
    public ArrayList articleCollected(String articleName);

}
