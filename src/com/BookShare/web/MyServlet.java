package com.BookShare.web;

import javax.servlet.http.Cookie;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

public class MyServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String  password = request.getParameter("password");
        String str = "";
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("md5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte[] by = md5.digest(password.getBytes());
        for (int i = 0; i < by.length; i++) {
            str += Byte.toString(by[i]);
        }

        BaseDao sql = new BaseDao();
        String query = "SELECT * FROM user WHERE Uphone ='" + name + "' AND passwd = '"+str+"';";
        System.out.println("搜索语句为="+ query);
        //response.getWriter().write("sql="+ query+"\n");
        String info = null;
        java.sql.ResultSet rs = sql.executeQuery(query);
        //if (rs == null )
        try{
            while(rs.next()){
                // 通过字段检索
                String Uphone  = rs.getString("Uphone");
                String Uname = rs.getString("Uname");
                String passwd = rs.getString("passwd");
                String level = rs.getString("level");

                //添加活跃度
                query = "UPDATE user SET Num = Num+1 where Uname = '"+ Uname +"';";
                sql.executeUpdate(query);
                // 输出数据
                System.out.print("Uphone=" + Uphone);
                System.out.print(",Uname " + Uname);
                System.out.print(",passwd"+ passwd);
                System.out.print(",level="+ level);
                System.out.print("\n");
                info = "Uphone=" + Uphone + "<br>Uname=" + Uname + ",<br>level=\"+ level";
                Cookie c1 = new Cookie("username",Uname);
                response.addCookie(c1);
//                String level_temp = null;
//                if (level == "0"){
//                    level_temp = "Basic User";
//                }else if(level == "1"){
//                    level_temp = "Super User";
//                }else if(level == "2"){
//                    level_temp = "admin";
//                }

                Cookie c2 = new Cookie("level",level);
                response.addCookie(c2);
                System.out.print("123");
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        String login = "点击进入主页";
        if(info == null){
            login = "用户名或者密码错误,点击重新登陆";
        }
        sql.close();

        Cookie[] cookies = request.getCookies();
        for(Cookie c :cookies ){
            System.out.println(c.getName()+"--->"+c.getValue());
            response.getWriter().write(c.getName()+"--->"+c.getValue()+"\n");
        }
    //response.getWriter().write("<a href=\"/view/home.jsp\">点击跳转</a>");
    response.getWriter().write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
            "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" +
            "<head>\n" +
            "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
            "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
            "<title>BookShare综合管理平台</title>\n" +
            "<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\n" +
            "</head>\n" +
            "<body >\n" +
            "<div>\n" +
            "    <h1><a href=\"index.jsp\">"+ login +"</a></h1>\n" +
            "</div>\n" +
             "   <table border=\"1\">\n" +
             "        <tr>\n" +
             "            <th>SQL</th>\n" +
             "            <th>" + query + "</th>\n" +
             "        </tr>\n" +
             "        <tr>\n" +
             "            <th>Info</th>\n" +
             "            <th>"+ info +"</th>\n" +
             "        </tr>\n" +
             "        <tr>\n" +
             "            <th>Cookie</th>\n" +
             "            <th>OK</th>\n" +
             "        </tr>" +
            "     </table>"+
            "\n" +
            "\n" +
            "<div>\n" +
            "\t<p>山西大学软件学院</p>\n" +
            "    <p>201515614261 孟祺</p>\n" +
            "</div>\n" +
            "<!--Login-结束-->\n" +
            "    \n" +
            "</body>\n" +
            "</html>");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
