package controller;

import pojo.Essay;
import service.SearchService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {



    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        response.setContentType("text/html;charset=gb2312");
        Essay essay=new Essay();
        request.setCharacterEncoding("utf-8");
        String search=request.getParameter("search");
        //essay.setU_IN(request.getParameter("search"));
        SearchService searchService=SearchService.getInstance();
        ArrayList list=null;
        try {
            list=new ArrayList<Essay>();
            list=(ArrayList) searchService.queryAllEssay(search);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        try {
            if(essay!=null){
                searchService.queryAllEssay(search);}

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(list.size()!=0){
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("EssayList", list);
            response.sendRedirect("search_result.jsp");
        }
        else{
            PrintWriter out = response.getWriter();
            out.println("<script>alert('没有该篇文章');window.location.href='index.jsp'</script>");
        }
    }
}
