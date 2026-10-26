package com.hospital.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.hospital.util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/bookAppointment")
public class BookAppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from form
        int patientId =
                Integer.parseInt(request.getParameter("patientId"));

        int doctorId =
                Integer.parseInt(request.getParameter("doctorId"));

        String appointmentDate =
                request.getParameter("appointmentDate");

        String appointmentTime =
                request.getParameter("appointmentTime");

        String sql =
                "INSERT INTO appointments " +
                "(patient_id, doctor_id, appointment_date, appointment_time, status) " +
                "VALUES (?, ?, ?, ?, 'Booked')";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, patientId);
            ps.setInt(2, doctorId);
            ps.setString(3, appointmentDate);
            ps.setString(4, appointmentTime);

            int result = ps.executeUpdate();

            if (result > 0) {

                response.setContentType("text/html");

                response.getWriter().println(
                    "<h2>Appointment Booked Successfully!</h2>"
                );

                response.getWriter().println(
                    "<p>Your appointment has been saved.</p>"
                );

                response.getWriter().println(
                    "<a href='patientDashboard.jsp'>Back to Dashboard</a>"
                );
            }

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>Appointment Booking Failed!</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}