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
import java.util.List;

@WebServlet(name = "GetMessage", value = "/GetMessage")
public class GetMessage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MessageDao messageDao = new MessageDao();
        List<Message> messageList;
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("user");
        try {
            messageList = messageDao.get_contacts(user.getUserName());
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("messageList", messageList);
        request.getRequestDispatcher("ShowMessage.jsp").forward(request,response);
    }
}
