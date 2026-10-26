<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.hospital.util.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

    <title>Available Doctors</title>

    <link rel="stylesheet"
          href="style.css">

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


    <!-- Doctors -->

    <div class="container">

        <h1>
            Available Doctors
        </h1>

        <p>
            View our available doctors and their
            specializations.
        </p>


        <table>

            <tr>

                <th>
                    Doctor ID
                </th>

                <th>
                    Doctor Name
                </th>

                <th>
                    Specialization
                </th>

                <th>
                    Phone
                </th>

                <th>
                    Available Time
                </th>

            </tr>

<%

    String sql =
        "SELECT * FROM doctors";

    try {

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql);

        ResultSet rs =
                ps.executeQuery();

        while (rs.next()) {

%>

            <tr>

                <td>
                    <%= rs.getInt("doctor_id") %>
                </td>

                <td>
                    <%= rs.getString("name") %>
                </td>

                <td>
                    <%= rs.getString("specialization") %>
                </td>

                <td>
                    <%= rs.getString("phone") %>
                </td>

                <td>
                    <%= rs.getString("available_time") %>
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

                <td colspan="5">

                    Error:
                    <%= e.getMessage() %>

                </td>

            </tr>

<%
    }

%>

        </table>

        <br><br>

        <a href="patientDashboard.jsp">
            ← Back to Dashboard
        </a>

    </div>

</body>

</html>