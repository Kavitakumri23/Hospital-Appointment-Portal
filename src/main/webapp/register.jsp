<!DOCTYPE html>
<html>

<head>

    <title>Patient Registration</title>

    <link rel="stylesheet"
          href="style.css">

</head>

<body>

    <!-- Navigation Bar -->

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


    <!-- Registration Form -->

    <div class="container">

        <h1>Patient Registration</h1>

        <p>
            Create your patient account to book and
            manage hospital appointments.
        </p>

        <br>


        <form action="register" method="post">


            <label>Name:</label>
            <br>

            <input type="text"
                   name="name"
                   placeholder="Enter your full name"
                   required>

            <br><br>


            <label>Email:</label>
            <br>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

            <br><br>


            <label>Password:</label>
            <br>

            <input type="password"
                   name="password"
                   placeholder="Create a password"
                   required>

            <br><br>


            <label>Phone:</label>
            <br>

            <input type="text"
                   name="phone"
                   placeholder="Enter phone number">

            <br><br>


            <label>Address:</label>
            <br>

            <textarea name="address"
                      placeholder="Enter your address"></textarea>

            <br><br>


            <button type="submit">
                Register
            </button>

        </form>

        <br>


        <p>
            Already have an account?

            <a href="login.jsp">
                Login Here
            </a>
        </p>

        <br>

        <a href="index.jsp">
            ← Back to Home
        </a>

    </div>

</body>

</html>