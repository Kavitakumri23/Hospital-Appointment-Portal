<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);

    if (sessionObj == null ||
        sessionObj.getAttribute("patientId") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    String patientName =
            (String) sessionObj.getAttribute("patientName");

    int patientId =
            (Integer) sessionObj.getAttribute("patientId");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Patient Dashboard</title>

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


    <!-- Dashboard -->

    <div class="container">

        <h1>
            Patient Dashboard
        </h1>

        <h2>
            Welcome, <%= patientName %>!
        </h2>

        <p>
            Your Patient ID:
            <strong><%= patientId %></strong>
        </p>

        <br>

        <hr>

        <br>

        <h2>
            Hospital Services
        </h2>


        <div class="card">

            <h3>
                Find Doctors
            </h3>

            <p>
                View available doctors and
                their specializations.
            </p>

            <br>

            <a href="doctors.jsp">
                View Doctors
            </a>

        </div>


        <div class="card">

            <h3>
                Book Appointment
            </h3>

            <p>
                Schedule an appointment
                with a doctor.
            </p>

            <br>

            <a href="bookAppointment.jsp">
                Book Appointment
            </a>

        </div>


        <div class="card">

            <h3>
                My Appointments
            </h3>

            <p>
                View and manage your
                existing appointments.
            </p>

            <br>

            <a href="myAppointments.jsp">
                View Appointments
            </a>

        </div>


        <br><br>

        <hr>

        <br>

        <a href="logout">
            Logout
        </a>

    </div>

</body>

</html>