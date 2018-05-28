
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2018/5/22
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.BookShare.web.BaseDao" %>
<%
//    BaseDao sql = new BaseDao();
    rs = db.executeQuery("SELECT URL ,Sname FROM Sapp LIMIT 5; ");

%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
        .food{
            width: 100%;
            height: auto;
            text-align: center;
            background: #EEEEEE;
        }
        .food_table{
            float: left;

        }
        a{
            color: #000000;
            text-decoration: none;
        }
        .img_school{
            border-radius: 50%;
        }
    </style>
</head>
<body>
<hr>
<table class="food" align="center">
    <tr>
        <td>
            <table class="food_table" border="0" width="33%" align="center">
                <tr>
                    <td align="center"><h2>友情链接</h2></td>
                    <%
                        if(rs==null){
                            %><td>数据库中没有内容</td><%
                        }else{
                            while (rs.next()){
                                System.out.println("yes");
//                                String Uphone  = rs.getString("Uphone");
                                String URL = rs.getString("URL");
                                String Sname = rs.getString("Sname");
                                %>
                <tr><td align="center"><h4><a href="<%=URL %>"><%=Sname %></a></h4></td></tr>
                                <%
                            }
                        }
                    %>
                </tr>

            </table>

            <table class="food_table" border="0" width="33%" align="center">
                <tr>
                    <td align="center"><h2>联系我</h2></td>
                </tr>
                <tr>
                    <td align="center"><a href="mailto:qmeng1128@163.com"><h4>MAIL FOR ME</h4></a></td>
                </tr>
                <tr>
                    <td align="center"><a href="https://blog.csdn.net/Mq_Go"><h4>CSDN Mq_Go</h4></a></td>
                </tr>
                <tr>
                    <td align="center"><a href="https://https://github.com/mqaaa"><h4>GITHUB 开源项目</h4></a></td>
                </tr>
                <tr>
                    <td align="center"><a href="mailto:qmeng1128@163.com"><h4>MAIL FOR ME</h4></a></td>
                </tr>

            </table>

            <table class="food_table" border="0" width="33%" align="center">
                <tr>
                    <td align="center"><img src="images/logo.png" width="120px" height="80px"></td>
                </tr>
                <tr>
                    <td align="center"><h4>软工2015班 孟祺<br>学号：201515614261</h4></td>
                </tr>


                <tr>
                    <td align="center">
                        <img class="img_school" src="images/school.jpg" width="100px" height="100px">
                    </td>
                <tr>
                    <td align="center">
                        <h4>山西大学</h4>
                    </td>
                </tr>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
