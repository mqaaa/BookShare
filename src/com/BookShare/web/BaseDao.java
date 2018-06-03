package com.BookShare.web;


import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * 数据库操作类
 * @author mq
 *
 */

public class BaseDao {

    //数据库地址“jdbc:mysql://服务器域名:端口号/数据库名称”
    private String url = "jdbc:mysql://120.24.222.231:3306/BookShare1?useUnicode=true&characterEncoding=utf-8";
    //用户名
    private String user = "root";
    //用户密码
    private String pwd = "qqqqqqqq";
    //数据库链接对象
    private java.sql.Connection conn;
    //数据库命令执行对象
    private Statement pstmt;
    //数据库返回结果
    private java.sql.ResultSet rs;

    //静态代码块
    static{
        //1、加载驱动
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        }
    }


    //2、创建连接
    private void getConnection(){
        if(conn == null){
            try {
                conn = DriverManager.getConnection(url, user, pwd);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //执行读操作方法
    public java.sql.ResultSet executeQuery(String query){
        getConnection();
        //System.out.println(query);
        try {
            //3、创建命令执行对象
            pstmt = conn.createStatement();
            //4、执行
            /*if(params!=null && params.size()>0){
                for(int i=0;i<params.size();i++){
                    pstmt.setObject(i+1, params.get(i));
                }
            }*/
            rs = pstmt.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    //执行写操作方法
    public int executeUpdate(String query){
        int result = 0;
        getConnection();
        System.out.println(query);
        try {
            //3、创建命令执行对象
            pstmt = conn.createStatement();
//            //4、执行
//            if(params!=null && params.size()>0){
//                for(int i=0;i<params.size();i++){
//                    pstmt.setObject(i+1, params.get(i));
//                }
//            }
            //5、处理结果
            result = pstmt.executeUpdate(query);

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            //6、释放资源
            this.close();
        }
        return result;
    }


    //关闭资源
    //
    public void close(){
        try {
            if(rs!=null){
                rs.close();
                rs = null;
            }
            if(pstmt!=null){
                pstmt.close();
                pstmt = null;
            }
            if(conn!=null){
                conn.close();
                conn = null;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
