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
<%
    BaseDao db = new BaseDao();
    java.sql.ResultSet rs;
%>
<%@ include file="head.jsp" %>

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
                    <td>1</td>
                    <td>借阅最多图书</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>鸟哥Linux</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Mysql必知必会</td>
                </tr>
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
                    int k = 0;
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


                <tr>
                    <td>1</td>
                    <td>借阅最多图书</td>
                </tr>

            </table>
        </div>
    </div>
    <div class="right">
        <table align="center">
            <tr><td>
                <form method="get" action="list.html" action="center" class="form_find" >
                    <select name="class">
                        <option value="1">书名</option>
                        <option value="2">作者</option>
                        <option value="3">种类</option>
                        <option value="4">出版时间</option>
                    </select>
                    <input type="text" name="find">
                    <input type="submit" value="提交" class="submit">
                </form>
            </td></tr>
        </table>

        <hr>
        <h2 align="center">借阅成功</h2>
        <br>
        <hr>
        <br>
        <table align="center" width="600px">

            <%
                String BID_URL = request.getParameter("BID");
                String KID_URL = request.getParameter("KID");
                String sql;
                sql = "update book set Num=Num+1 where BID="+ BID_URL +";";
                db.executeUpdate(sql);
                sql = "update bookKind set Num=Num+1 where KID="+ KID_URL +";";

                db.executeUpdate(sql);
                sql = "select BID,Bname,URL,publish,author,Ptime,Kind,book.Num from book,bookKind where book.KID=bookKind.KID and book.BID="+ BID_URL +";";
                rs = db.executeQuery(sql);
                while (rs.next()){
                    String BID =  rs.getString("BID");
                    String URL = rs.getString("URL");
                    String Bname = rs.getString("Bname");
                    String author = rs.getString("author");
                    String Ptime = rs.getString("Ptime");
                    String Kind = rs.getString("Kind");
                    String publish = rs.getString("publish");
                    String Num = rs.getString("Num");
            %>
            <tr><td style="text-align: center;">编号:&nbsp;</td><td><%=BID%></td></tr>
            <tr><td style="text-align: center;">书名&nbsp;</td><td><a href="<%=URL%>"><%=Bname%></a></td></tr>
            <tr><td style="text-align: center;">阅读地址:&nbsp:</td><td><a href="<%=URL %>"><%=URL %></a> </td></tr>
            <tr><td style="text-align: center;">作者:&nbsp;</td><td><%=author%></td></tr>
            <tr><td style="text-align: center;">出版时间:&nbsp;</td><td><%=Ptime%></td></tr>
            <tr><td style="text-align: center;">图书类型:&nbsp;</td><td><%=Kind%></td></tr>
            <tr><td style="text-align: center;">出版社:&nbsp;</td><td><%=publish%></td></tr>
            <tr><td style="text-align: center;">热度:&nbsp;</td><td><%=Num%></td></tr>
            <%
                }
            %>
            <tr><td></td><td><button><a href="index.jsp">返回首页</a> </button></td></tr>

        </table>



    </div>
</nav>
</body>
</html>

<%@ include file="foot.jsp" %>
