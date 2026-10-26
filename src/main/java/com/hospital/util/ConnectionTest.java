package com.hospital.util;

import java.sql.Connection;

public class ConnectionTest {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {
            System.out.println("SUCCESS: Database connected!");
        } else {
            System.out.println("FAILED: Database not connected!");
        }
    }
}