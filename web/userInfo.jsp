<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2018/5/21
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.BookShare.web.BaseDao" %>
<% BaseDao db = new BaseDao();
    java.sql.ResultSet rs;
%>
<%@ include file="head.jsp" %>
<%  int k=0; %>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>BookShare</title>
    <style type="text/css">
        body, html {
            margin: 0;
            padding: 0%;
        }

        .left {
            float: left;
            width: 19%;
            height: 100%;
            margin-left: 4%;
            margin-right: 1%;
            text-align: center;
            /*margin-left: 8%
            margin-right: 2%;*/
        }

        .right {
            float: left;
            width: 70%;
            height: 100%;
            margin-left: 1%;
            margin-right: 4%;
        }

        .left {
            background-color: #FFFFFF;

            border: 2px solid darkslategray;
            border-radius: 30px;

        }

        .right {
            background-color: #FFFFFF;
        }

        input {
            width: 400px;
            height: 30px;
            padding: 0px;
            margin: 5px;
            background-color: #EEEEEE;
            border-top: 0px;
            /*border-bottom: 2px; */
        }

        select {
            width: 100px;
            height: 30px;
            padding: 0px;
            margin: 5px;
            background-color: #EEEEEE;
            border-top: 0px;
            /*border-bottom: 2px; */
        }

        .submit {
            border: 0px;
            background-color: #cccccc;
            width: 100px;
        }

        table {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .div_left {
            margin: 20px;
        }

        hr {
            margin: 20px;

        }

        /*.tool {*/
        /*float: left;*/
        /*width: 91.3%;*/
        /*margin-left: 4%;*/
        /*margin-bottom: 20px;*/
        /*text-align: center;*/
        /*height: auto;*/
        /*}*/

        a {
            font-size: 20px;
            color: black;
            text-decoration: none;

        }

        .top_td {
            background-color: #FFFFFF;
            border: 10px;
            margin: 20px;
            border-radius: 15px;
        }
    </style>
</head>
<body bgcolor="#CCCCCC">
<%--<div class="tool">--%>
<%--<h1>欢迎来到BookShare</h1>--%>
<%--<table align="center" width="90%" style="text-align: center">--%>
<%--<tr>--%>
<%--<td class="top_td"><a href="#"> 最热图书 </a></td>--%>
<%--<td class="top_td"><a href="#"> 图书分类 </a></td>--%>
<%--<td class="top_td"><a href="#"> 捐赠图书 </a></td>--%>
<%--<td class="top_td"><a href="#"> 用户详情 </a></td>--%>
<%--</tr>--%>
<%--</table>--%>
<%--</div>--%>
<nav>
    <div class="left">
        <div class="div_left">
            <h3>本周热门图书</h3>
            <table border="0" align="center" width="95%">
                <tr>
                    <td>编号</td>
                    <td>借阅最多图书</td>
                    <td>热度</td>
                </tr>
                <%
                    rs = db.executeQuery("SELECT BID,KID,Bname,Num FROM book ORDER BY Num DESC LIMIT 4;");
                    k = 0;
                    while (rs.next()){
                        String Bname = rs.getString("Bname");
                        String Num = rs.getString("Num");
                        String BID = rs.getString("BID");
                        String KID = rs.getString("KID");
                        k++;
                %>
                <tr>
                    <td><%= k%></td>
                    <td><a href="borrowBook.jsp?BID=<%= BID%>&KID=<%= KID%>"><%= Bname%></a></td>
                    <td><%= Num%></td>
                </tr>
                <%
                    }
                %>


            </table>
        </div>
        <hr>
        <div class="div_left">
            <h3>本周最勤奋用户</h3>
            <table border="0" align="center" width="95%">
                <tr>
                    <td>排名</td>
                    <td>用户</td>
                    <td>活跃度</td>
                </tr>
                <%
                    rs = db.executeQuery("SELECT * FROM user order by Num DESC limit 4;");
                    k = 0;
                    while (rs.next()){
                        String Uname = rs.getString("Uname");
                        String Num = rs.getString("Num");
                        k++;
                %>
                <tr>
                    <td><%=k %></td>
                    <td><%=Uname %></td>
                    <td><%=Num %></td>
                </tr>
                <%
                    }
                %>


            </table>
        </div>
        <hr>
        <div class="div_left">
            <h3>本周热门图书种类</h3>
            <table border="0" align="center" width="95%">
                <%
                    rs = db.executeQuery("SELECT * FROM bookKind ORDER BY Num DESC LIMIT 4;");
                    k = 0;
                    while (rs.next()){
                        k++;
                        String Kind = rs.getString("Kind");
                        String Num = rs.getString("Num");
                %>
                <tr>
                    <td><%= k%></td>
                    <td><%= Kind%></td>
                    <td><%= Num%></td>
                </tr>
                <%
                    }

                %>



            </table>
        </div>
    </div>
    <div class="right">
        <table align="center">
            <tr><td>
                <form method="get" action="find.jsp" class="form_find" >
                    <select name="clas">
                        <option value="Bname">书名</option>
                        <option value="author">作者</option>
                        <option value="Kind">种类</option>
                        <option value="time">出版时间</option>
                    </select>
                    <input type="text" name="find">
                    <input type="submit" value="提交" class="submit">
                </form>
            </td></tr>
        </table>

        <hr>
        <h2 align="center">添加用户</h2>
        <table align="center" width="95%">

        </table>
        <table align="center">
            <form action="useradd.jsp" method="post">
                <tr><td>Uphone</td><td><input type="text" name="Uphone"></td></tr>
                <tr><td>Uname</td><td><input type="text" name="Uname"></td></tr>
                <tr><td>Passwd</td><td><input type="password" name="passwd"></td></tr>
                <tr><td>level</td><td>
                    <select name="level">
                        <option value="1">会员</option>
                        <option value="2">管理员</option>
                        <option value="3">超级管理员</option>
                    </select>

                </td></tr>
                <%--<tr><td>level</td><td><input type="text" name="level"></td></tr>--%>
                <tr><td>mail</td><td><input type="email" name="mail"></td></tr>
                <tr><td><input type="reset" value="reset"></td><td><input type="submit" value="提交"></td></tr>
            </form>
        </table>

    </div>
</nav>
</body>
</html>

<%@ include file="foot.jsp" %>