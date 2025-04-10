package com.dbs;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection conn;

    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/skilltracker", // change DB name if different
                    "root", // your MySQL username
                    "root@123" // your MySQL password (leave blank if none)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
