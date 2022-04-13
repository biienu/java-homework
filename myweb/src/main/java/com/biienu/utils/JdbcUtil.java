package com.biienu.utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtil {
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException, IOException {
        Properties p = new Properties();
        p.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties"));
        String url = p.getProperty("url");
        String user = p.getProperty("user");
        String password = p.getProperty("password");
        Connection conn = DriverManager.getConnection(url,user,password);
        return conn;
    }
}
