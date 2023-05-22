package controller;

import dao.impl.MessageDao;
import pojo.Message;
import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import java.sql.SQLException;

import java.util.Calendar;


@WebServlet(name = "AddMessage", value = "/AddMessage")
public class AddMessageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("AddMessage");
        Calendar cal=Calendar.getInstance();
        int y=cal.get(Calendar.YEAR);
        int m=cal.get(Calendar.MONTH);
        int d=cal.get(Calendar.DATE);
        int h=cal.get(Calendar.HOUR_OF_DAY);
        int mi=cal.get(Calendar.MINUTE);
        int s=cal.get(Calendar.SECOND);
        String datetime=(y+"-"+m+"-"+d+" "+h+":"+mi+":"+s);
        String name=req.getParameter("name");
        String title=req.getParameter("title");
        String contacts=req.getParameter("contacts");
        Message message=new Message(datetime,name,title,contacts);

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        MessageDao messageDao = new MessageDao();
        try {
            messageDao.add_contacts(message,user);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("AddMessageSuccess.jsp");
    }
}
