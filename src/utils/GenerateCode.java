package utils;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class GenerateCode {

    private static Color getRandomColor(int fc, int bc){
        Random random=new Random();
        if(fc>255) fc=255;
        if(bc>255) bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
    }

    public static String drawImageVerificate(HttpServletResponse response) throws IOException {
        int width = 100, height = 30;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
        Graphics2D graph = image.createGraphics();
        Random random = new Random();
        //设置背景
        graph.setColor(getRandomColor(240, 250));
        graph.setFont(new Font("微软雅黑", Font.PLAIN, 22));
        graph.fillRect(0, 0, width, height);
        //设置干扰线颜色并绘制线条在图片中
        graph.setColor(getRandomColor(180, 230));
        //100条
        for (int i = 0; i < 100; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(60);
            int y1 = random.nextInt(60);
            graph.drawLine(x, y, x1, y1);
        }
        //算术表达式拼接
        int num1 = (int) (Math.random() * 10 + 1);
        int num2 = (int) (Math.random() * 10 + 1);
        int optor = random.nextInt(3);
        int result = 0;
        String optorstr = "";
        switch (optor) {
            case 0:
                optorstr = "+";
                result = num1 + num2;
                break;
            case 1:
                optorstr = "-";
                result = num1 - num2;
                break;
            case 2:
                optorstr = "*";
                result = num1 * num2;
                break;
        }
        //拼接算术表达式
        String calc = num1 + " " + optorstr + " " + num2 + " = ? ";
        //设置表达式颜色
        graph.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
        //绘制表达式
        graph.drawString(calc, 5, 25);
        graph.dispose();
        try {
            ImageIO.write(image, "JPEG", response.getOutputStream());
            return String.valueOf(result);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
