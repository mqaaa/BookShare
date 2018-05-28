<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2018/5/27
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.BookShare.web.BaseDao" %>
<%@ page import="java.security.MessageDigest" %>

<%
    MessageDigest md5 = MessageDigest.getInstance("md5");
   java.sql.ResultSet rs;
   BaseDao db = new BaseDao();
   String Uphone = request.getParameter("Uphone");
   String Uname = request.getParameter("Uname");
   String passwd = request.getParameter("passwd");
   String level = request.getParameter("level");
   String mail = request.getParameter("mail");
    byte[] by = md5.digest(passwd.getBytes());
    String str = "";
    for (int i = 0; i < by.length; i++) {
        str += Byte.toString(by[i]);
    }
    String sql = "INSERT INTO user(Uphone,Uname,passwd,level,mail,Num)values ('"+Uphone+"','"+Uname+"','"+str+"',"+level+",'"+mail+"',0);";

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
您的密码已经加密。
<%=sql%>
<%
   int n =  db.executeUpdate(sql);
   if(n > 0){
%><h1>恭喜你，添加成功，<a href="index.jsp">点击返回首页</a></h1><%
    }else {
%><h1>对不起，添加失败</h1><%
    }
%>
</body>
</html>
