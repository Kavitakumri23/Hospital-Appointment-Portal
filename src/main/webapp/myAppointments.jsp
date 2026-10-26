<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.hospital.util.DBConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Check patient session
    HttpSession patientSession = request.getSession(false);

    if (patientSession == null ||
        patientSession.getAttribute("patientId") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    int patientId =
            (Integer) patientSession.getAttribute("patientId");
%>

<!DOCTYPE html>
<html>

<head>

    <title>My Appointments</title>

    <link rel="stylesheet"
          href="style.css">

    <style>

        .status-booked {
            background-color: #d4edda;
            color: #155724;
            padding: 6px 12px;
            border-radius: 15px;
            font-weight: bold;
            display: inline-block;
        }

        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
            padding: 6px 12px;
            border-radius: 15px;
            font-weight: bold;
            display: inline-block;
        }

    </style>

</head>

<body>

    <!-- Navigation Bar -->

    <div class="navbar">

        <a href="index.jsp">
            Hospital Portal
        </a>

        <a href="patientDashboard.jsp">
            Dashboard
        </a>

        <a href="doctors.jsp">
            Doctors
        </a>

        <a href="myAppointments.jsp">
            My Appointments
        </a>

        <a href="logout">
            Logout
        </a>

    </div>


    <!-- Appointment List -->

    <div class="container">

        <h1>
            My Appointments
        </h1>

        <p>
            View and manage your hospital appointments.
        </p>


        <table>

            <tr>

                <th>
                    Appointment ID
                </th>

                <th>
                    Doctor Name
                </th>

                <th>
                    Specialization
                </th>

                <th>
                    Date
                </th>

                <th>
                    Time
                </th>

                <th>
                    Status
                </th>

                <th>
                    Action
                </th>

            </tr>


<%

    String sql =
        "SELECT a.appointment_id, " +
        "d.name AS doctor_name, " +
        "d.specialization, " +
        "a.appointment_date, " +
        "a.appointment_time, " +
        "a.status " +
        "FROM appointments a " +
        "JOIN doctors d " +
        "ON a.doctor_id = d.doctor_id " +
        "WHERE a.patient_id = ? " +
        "ORDER BY a.appointment_date, a.appointment_time";


    try {

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1, patientId);

        ResultSet rs =
                ps.executeQuery();


        while (rs.next()) {

            String status =
                    rs.getString("status");

%>

            <tr>

                <td>
                    <%= rs.getInt("appointment_id") %>
                </td>


                <td>
                    <%= rs.getString("doctor_name") %>
                </td>


                <td>
                    <%= rs.getString("specialization") %>
                </td>


                <td>
                    <%= rs.getDate("appointment_date") %>
                </td>


                <td>
                    <%= rs.getTime("appointment_time") %>
                </td>


                <!-- Status -->

                <td>

<%
                    if ("Booked".equals(status)) {
%>

                    <span class="status-booked">
                        Booked
                    </span>

<%
                    } else {
%>

                    <span class="status-cancelled">
                        Cancelled
                    </span>

<%
                    }
%>

                </td>


                <!-- Action -->

                <td>

<%
                    if (!"Cancelled".equals(status)) {
%>

                    <form action="cancelAppointment"
                          method="post"
                          onsubmit="return confirm('Are you sure you want to cancel this appointment?');">

                        <input type="hidden"
                               name="appointmentId"
                               value="<%= rs.getInt("appointment_id") %>">

                        <button type="submit">
                            Cancel
                        </button>

                    </form>

<%
                    } else {
%>

                    <span>
                        Already Cancelled
                    </span>

<%
                    }
%>

                </td>

            </tr>

<%
        }


        rs.close();

        ps.close();

        con.close();


    } catch (Exception e) {

%>

            <tr>

                <td colspan="7">

                    Error:
                    <%= e.getMessage() %>

                </td>

            </tr>

<%
    }

%>

        </table>


        <br>
        <br>


        <a href="bookAppointment.jsp">
            Book New Appointment
        </a>

        <br>
        <br>


        <a href="patientDashboard.jsp">
            ← Back to Dashboard
        </a>

    </div>

</body>

</html>