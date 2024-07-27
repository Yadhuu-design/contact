<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>Festalive</title>

<%@ page import="java.sql.*"%>
<%
HttpSession httpSession = request.getSession(false);
	if (httpSession == null || httpSession.getAttribute("user") == null) {
		response.sendRedirect("login.jsp");
		return;
	}

	// Database connection parameters
	String dbUrl = "jdbc:mysql://192.168.18.245:3306/javadb_168";
	String dbUser = "javadb_168";
	String dbPassword = "Sp3cJa5A2k24";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	int userCount = 0;
	int eventCount = 0;
	int bookingCount = 0;
	double totalBookingAmount = 0.0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();

		// Query to get user count
		rs = stmt.executeQuery("SELECT COUNT(*) AS count FROM festalive_user");
		if (rs.next()) {
			userCount = rs.getInt("count");
		}

		// Query to get event count
		rs = stmt.executeQuery("SELECT COUNT(*) AS count FROM concerts");
		if (rs.next()) {
			eventCount = rs.getInt("count");
		}

		// Query to get order count
		// Uncomment the following lines if the orders table exists
		rs = stmt.executeQuery("SELECT COUNT(*) AS count FROM bookings");
		if (rs.next()) {
			bookingCount = rs.getInt("count");
		}

		rs = stmt.executeQuery("SELECT SUM(c.ticket_price) AS total_amount " + "FROM bookings b "
				+ "JOIN concerts c ON b.concert_id = c.concert_id");
		if (rs.next()) {
			totalBookingAmount = rs.getDouble("total_amount");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
%>

<!-- Additional CSS -->
<style>
.navbar-vertical {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	width: 250px;
	padding-top: 20px;
	background-color: #f8f9fa;
	border-right: 1px solid #dee2e6;
	animation: slideIn 0.5s ease-out;
}

.navbar-vertical .nav-link {
	color: #000;
	transition: background-color 0.3s, color 0.3s;
}

.navbar-vertical .nav-link:hover {
	background-color: #007bff;
	color: #fff;
}

.navbar-brand {
	color: #dc3545; /* Red color */
	font-weight: bold;
	transition: color 0.3s ease;
}

.navbar-brand:hover {
	color: #c82333; /* Darker red on hover */
}

.profile-image {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 100px;
	height: 100px;
}

.card-body-relative {
	position: relative;
	min-height: 150px; /* Adjust this value as needed */
}

.cards-container {
	margin-left: 260px; /* margin to the right of the vertical navbar */
	padding-top: 20px;
}

@
keyframes slideIn {from { transform:translateX(-100%);
	opacity: 0;
}

to {
	transform: translateX(0);
	opacity: 1;
}

}
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}
}
</style>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">

	<nav class="navbar navbar-vertical">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Festalive</a>
			<ul class="navbar-nav flex-column">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">Dashboard</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false">Event
						Management</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="addevent.jsp">Add
								Event</a></li>
						<li><a class="dropdown-item" href="viewevent.jsp">View
								Events</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false">User</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="viewusers.jsp">View
								Users</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false">Bookings</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="adminviewbookings.jsp">View
								Bookings</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>

	<div class="container mt-5 cards-container">
		<div class="row">
			<div class="col-md-4">
				<div class="card text-white bg-primary mb-3">
					<div class="card-header">Registered Users</div>
					<div class="card-body card-body-relative">
						<img src="images/profile_pic.jpg" alt="User Profile Image"
							class="img-fluid rounded-circle mb-3 profile-image">
						<h5 class="card-title"><%=userCount%></h5>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card text-white bg-primary mb-3">
					<div class="card-header">Scheduled Events</div>
					<div class="card-body card-body-relative">
						<img src="images/product.jpg" alt="Event Image"
							class="img-fluid rounded-circle mb-3 profile-image">
						<h5 class="card-title"><%=eventCount%></h5>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card text-white bg-primary mb-3">
					<div class="card-header">Booked Events</div>
					<div class="card-body card-body-relative">
						<img src="images/orders.jpg" alt="Orders Image"
							class="img-fluid rounded-circle mb-3 profile-image">
						<h5 class="card-title"><%=bookingCount%></h5>
						<!-- Replace with actual orderCount if available -->
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-primary mb-3">
					<div class="card-header">Booking Amount</div>
					<div class="card-body card-body-relative">
						<img src="images/orders.jpg" alt="Orders Image"
							class="img-fluid rounded-circle mb-3 profile-image">
						<h5 class="card-title"><%=totalBookingAmount%></h5>
						<!-- Replace with actual orderCount if available -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
