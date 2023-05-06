package pojo;

public class PageTest {

    int start;      // 开始数据的索引
    int count;      // 每一页的数量
    int total;      // 总共的数据量

    /**
     * 提供一个构造方法
     * @param start
     * @param count
     */
    public PageTest(int start, int count,int total) {
        super();
        this.start = start;
        this.count = count;
        this.total = total;
    }

    /**
     * 判断是否有上一页
     * @return
     */
    public boolean isHasPrevious(){
        if(start==0)
            return false;
        return true;

    }

    /**
     * 判断是否有下一页
     * @return
     */
    public boolean isHasNext(){
        if(start==getLast())
            return false;
        return true;
    }

    /**
     * 计算得到总页数
     * @return
     */
    public int getTotalPage(){
        int totalPage;
        // 假设总数是50，是能够被5整除的，那么就有10页
        if (0 == total % count)
            totalPage = total /count;
            // 假设总数是51，不能够被5整除的，那么就有11页
        else
            totalPage = total / count + 1;

        if(0==totalPage)
            totalPage = 1;
        return totalPage;
    }

    /**
     * 计算得到尾页
     * @return
     */
    public int getLast(){
        int last;
        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
        if (0 == total % count)
            last = total - count;
            // 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
        else
            last = total - total % count;

        last = last<0?0:last;
        return last;
    }

    /* getter and setter */

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}