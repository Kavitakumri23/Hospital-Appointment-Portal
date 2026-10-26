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

    <title>Book Appointment</title>

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


    <!-- Appointment Form -->

    <div class="container">

        <h1>
            Book Appointment
        </h1>

        <p>
            Select a doctor and choose your preferred
            appointment date and time.
        </p>

        <br>


        <form action="bookAppointment" method="post">

            <!-- Patient ID -->

            <input type="hidden"
                   name="patientId"
                   value="<%= patientId %>">


            <!-- Doctor -->

            <label>
                Select Doctor:
            </label>

            <br>

            <select name="doctorId" required>

                <option value="">
                    -- Select Doctor --
                </option>

<%
                try {

                    Connection con =
                            DBConnection.getConnection();

                    String sql =
                        "SELECT doctor_id, name, specialization " +
                        "FROM doctors";

                    PreparedStatement ps =
                            con.prepareStatement(sql);

                    ResultSet rs =
                            ps.executeQuery();

                    while (rs.next()) {
%>

                <option value="<%= rs.getInt("doctor_id") %>">

                    <%= rs.getString("name") %>
                    -
                    <%= rs.getString("specialization") %>

                </option>

<%
                    }

                    rs.close();
                    ps.close();
                    con.close();

                } catch (Exception e) {
%>

                <option value="">
                    Error loading doctors
                </option>

<%
                }
%>

            </select>


            <br><br>


            <!-- Date -->

            <label>
                Appointment Date:
            </label>

            <br>

            <input type="date"
       name="appointmentDate"
       min="<%= java.time.LocalDate.now() %>"
       required>


            <br><br>


            <!-- Time -->

            <label>
                Appointment Time:
            </label>

            <br>

            <input type="time"
                   name="appointmentTime"
                   required>


            <br><br>


            <!-- Submit -->

            <button type="submit">
                Book Appointment
            </button>

        </form>


        <br>

        <a href="patientDashboard.jsp">
            ← Back to Dashboard
        </a>

    </div>

</body>

</html>