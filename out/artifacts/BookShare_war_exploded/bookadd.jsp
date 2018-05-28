<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2018/5/27
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.BookShare.web.BaseDao" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%

    java.sql.ResultSet rs;
    BaseDao db = new BaseDao();
    String Bname = request.getParameter("Bname");
    String URL = request.getParameter("URL");
    String publish = request.getParameter("publish");
    String author = request.getParameter("author");
    Date date=new Date();     //获取一个Date对象
    SimpleDateFormat simpleDateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //创建一个格式化日期对象
    String punchTime = simpleDateFormat.format(date);   //格式化后的时间
    String Kname = request.getParameter("Kname");
    rs = db.executeQuery("SELECT KID FROM bookKind WHERE Kind='"+Kname+"'");
    String KID = null;

    while (rs.next()){
        KID = rs.getString("KID");
    }


    if (KID == null){
%><h1>添加种类</h1><%
        db.executeUpdate("INSERT INTO bookKind(Kind,Num)values('"+Kname+"',0)");
        rs = db.executeQuery("SELECT KID FROM bookKind WHERE Kind='"+Kname+"'");
        while (rs.next()){
            KID = rs.getString("KID");
        }

    }
//    insert `book`(`BID`,`Bname`,`URL`,`publish`,`author`,`Ptime`,`KID`,`Num`) values(null,'123','132','132','132','2018-05-28 00:38:36',1,0);
//    db.executeUpdate();
String sql = "insert `book`(`BID`,`Bname`,`URL`,`publish`,`author`,`Ptime`,`KID`,`Num`) values(null,'"+Bname+"','"+URL+"','"+publish+"','"+author+"','"+punchTime+"',"+KID+",0);";

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
