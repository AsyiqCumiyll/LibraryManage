package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

 
    // Private constructor to prevent instantiation
   public class DBConnection {
    private static Connection myConnection = null;

    // Get DB info from environment variables or fallback to default values
   private static final String DB_URL = System.getenv("DB_URL");
    private static final String DB_USER = System.getenv("DB_USER");
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");
    private DBConnection() {} // prevent instantiation


    public static void closeConnection() {
        try {
            if (myConnection != null && !myConnection.isClosed()) {
                myConnection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

}

