package com.hospital.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hospital.util.DBConnection;

@WebServlet("/cancelAppointment")
public class CancelAppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Check logged-in patient
        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("patientId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Get logged-in patient ID
        int patientId =
                (Integer) session.getAttribute("patientId");

        // Get appointment ID
        int appointmentId =
                Integer.parseInt(
                    request.getParameter("appointmentId")
                );


        /*
         * Cancel only the appointment
         * that belongs to the logged-in patient.
         */
        String sql =
                "UPDATE appointments " +
                "SET status = 'Cancelled' " +
                "WHERE appointment_id = ? " +
                "AND patient_id = ?";


        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, appointmentId);

            ps.setInt(2, patientId);


            int result =
                    ps.executeUpdate();


            if (result > 0) {

                // Appointment cancelled successfully
                response.sendRedirect(
                    "myAppointments.jsp"
                );

            } else {

                // Appointment does not belong
                // to this patient
                response.setContentType(
                    "text/html"
                );

                response.getWriter().println(
                    "<h2>Appointment not found!</h2>"
                );

                response.getWriter().println(
                    "<p>You cannot cancel this appointment.</p>"
                );

                response.getWriter().println(
                    "<a href='myAppointments.jsp'>Back to Appointments</a>"
                );
            }


            ps.close();

            con.close();


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                "text/html"
            );

            response.getWriter().println(
                "<h2>Cancellation Failed!</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}