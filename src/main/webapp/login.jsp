<!DOCTYPE html>
<html>

<head>

    <title>Patient Login</title>

    <link rel="stylesheet"
          href="style.css">

</head>

<body>

    <div class="navbar">

        <a href="index.jsp">
            Hospital Portal
        </a>

        <a href="login.jsp">
            Patient Login
        </a>

        <a href="register.jsp">
            Register
        </a>

        <a href="doctors.jsp">
            Doctors
        </a>

    </div>


    <div class="container">

        <h1>Patient Login</h1>

        <p>
            Login to access your hospital account
            and manage your appointments.
        </p>

        <br>

        <form action="login" method="post">

            <label>Email:</label>
            <br>

            <input type="email"
                   name="email"
                   required>

            <br><br>


            <label>Password:</label>
            <br>

            <input type="password"
                   name="password"
                   required>

            <br><br>

            <button type="submit">
                Login
            </button>

        </form>

        <br>

        <p>
            New patient?
            <a href="register.jsp">
                Register Here
            </a>
        </p>

        <br>

        <a href="index.jsp">
            ← Back to Home
        </a>

    </div>

</body>

</html>