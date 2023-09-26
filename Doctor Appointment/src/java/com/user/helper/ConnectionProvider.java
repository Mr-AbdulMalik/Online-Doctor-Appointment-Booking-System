package com.user.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthcentre", "root", "root");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        }

        return con;
    }
}
