<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2018/5/21
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.BookShare.web.BaseDao" %>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>BookShare</title>
    <style type="text/css">
        #head{background-color:#eee;height:auto;}
        a{font-size: 20px;
            color: black;
            text-decoration: none;}
        .tool {
            float: left;
            width: 91.3%;
            margin-left: 4%;
            margin-bottom: 20px;
            text-align: center;
            height: auto;
        }
    </style>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    boolean key = true;
    String name = null;
    if (cookies != null){
        for(Cookie c : cookies ) {

            String temp = c.getName();
            response.getWriter().write(temp+'\n');
            if (temp.equals("username") && c.getValue()!= null ) {
                response.getWriter().write(temp);
                key = false;
                name = c.getValue();
            }
        }
    }

    if(key) {
        response.sendRedirect("login.jsp");
    }

%>

<div id="head">
    <table width=100%>
        <tr>
            <td>欢迎您 : <%=name %></td>
            <td align="right">
                <a href="index.jsp">回到首页</a>
                <a href="logout.jsp">安全退出</a>
            </td>
        </tr>
    </table>
    <div class="tool">
        <h1>欢迎来到BookShare</h1>
        <table align="center" width="90%" style="text-align: center">
            <tr>
                <td class="top_td"><a href="index.jsp?info=热门"> 最热图书 </a></td>
                <td class="top_td"><a href="kindBook.jsp"> 图书分类 </a></td>
                <td class="top_td"><a href="bookInfo.jsp?math=add"> 捐赠图书 </a></td>
                <td class="top_td"><a href="userInfo.jsp?math=add"> 添加用户 </a></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>