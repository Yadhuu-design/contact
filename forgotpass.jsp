<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Festalive</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">   
    <style>
        body {
            padding-top: 20px;
            background-color: #f8f9fa; /* Light gray background */
        }
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 100%;
            max-width: 400px;
        }
        .btn-primary {
            width: 100%;
            padding: 0.75rem;
            font-size: 1rem;
        }
    </style>
    <script type="text/javascript">
        function validateForm() {
            var email = document.getElementById('email').value.trim();
            var password = document.getElementById('password').value;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

            if (!emailRegex.test(email)) {
                alert('Please enter a valid email address.');
                document.getElementById('email').focus();
                return false;
            }

            if (!passwordRegex.test(password)) {
                alert('Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, one number, and one special character.');
                document.getElementById('password').focus();
                return false;
            }

            return true; // Submit the form
        }
    </script>
</head>
<body>
    <div class="container form-container">
        <div class="form-card">
            <h2 class="text-center mb-4">Forgot Your Password?</h2>
            <form action="" method="" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="email" class="form-label">Email Address</label>
                    <input class="form-control" type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">New Password</label>
                    <input class="form-control" type="password" id="password" name="password" required>
                </div>
                <button class="btn btn-primary" type="submit">Save Password</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
