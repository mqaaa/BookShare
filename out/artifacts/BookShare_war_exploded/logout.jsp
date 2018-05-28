<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2018/5/21
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.Cookie" %>

<html>
<head>
    <title>登出</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    try
    {
        for(int i=0;i<cookies.length;i++)
        {
            //System.out.println(cookies[i].getName() + ":" + cookies[i].getValue());
            Cookie cookie = new Cookie(cookies[i].getName(), null);
            cookie.setMaxAge(0);
            cookie.setPath("/");//根据你创建cookie的路径进行填写
            response.addCookie(cookie);
        }
    }catch(Exception ex)
    {
        System.out.println("清空Cookies发生异常！");
    }
    response.sendRedirect("index.jsp");
%>
</body>
</html>
