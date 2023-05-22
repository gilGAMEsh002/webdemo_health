package controller;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import dao.UserDao;
import pojo.User;
import service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "UploadImageServlet", value = "/UploadImageServlet")
public class UploadImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        // 获取上传的文件
        SmartUpload smartUpload = new SmartUpload();
        smartUpload.initialize(getServletConfig(), request, response);
        try {
            smartUpload.upload();
        } catch (SmartUploadException e) {
            throw new RuntimeException(e);
        }
        com.jspsmart.upload.File file = smartUpload.getFiles().getFile(0);
        String filename = user.getUserName()+"_"+ System.currentTimeMillis()+".jpg";

        if (smartUpload.getFiles().getSize() > 0) {
            // 上传成功
            System.out.println("上传成功");
        } else {
            System.out.println("上传失败");
            // 上传失败
        }
        // 将文件保存到服务器上的某个目录中
        String path = getServletContext().getRealPath("/image/avatars/")  + filename;
//        String path = "G://"+filename;
        System.out.println(path);
        try {
            file.saveAs(path, File.SAVEAS_PHYSICAL);
        } catch (SmartUploadException e) {
            throw new RuntimeException(e);
        }

        // 将文件路径保存到数据库中
        UserServiceImpl userService = new UserServiceImpl();

        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        try {
            if(userService.updateUserAvatar(user.getUserName(), "/image/avatars/"+filename)){
                user.setAvatar_path("/image/avatars/"+filename);
                session.setAttribute("user",user);
                System.out.println("路径保存成功");
            }else {
                System.out.println("路径保存失败");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        // 返回 JSON 格式的响应
        response.sendRedirect("user.jsp");

        out.close();
    }
}
