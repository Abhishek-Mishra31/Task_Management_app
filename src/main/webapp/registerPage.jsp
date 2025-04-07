
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register - User Management System</title>
        <style>
            body {
                background: linear-gradient(135deg, #667eea, #764ba2);
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                font-family: 'Poppins', sans-serif;
                margin: 0;
            }

           
            .container {
                background: white;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
                text-align: center;
                width: 100%;
                max-width: 400px;
            }

            
            h2 {
                color: #333;
                margin-bottom: 20px;
            }

            h2 u {
                text-decoration: none;
                border-bottom: 3px solid #007bff;
                padding-bottom: 5px;
            }

            
            form {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

           
            input {
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 16px;
                width: 100%;
                transition: 0.3s;
                text-align: center;
            }

            input:focus {
                border-color: #007bff;
                box-shadow: 0px 0px 10px rgba(0, 123, 255, 0.5);
                outline: none;
            }

            
            button {
                background: #007bff;
                color: white;
                padding: 12px;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                transition: 0.3s;
                font-weight: bold;
            }

            button:hover {
                background: #0056b3;
                transform: scale(1.05);
            }

          
            p {
                margin-top: 15px;
                font-size: 14px;
            }

            p a {
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
            }

            p a:hover {
                text-decoration: underline;
            }

            
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .container {
                animation: fadeIn 0.5s ease-in-out;
            }

        </style>
    </head>
    <body>

        <div class="container">
            <h2>Create an Account</h2>
            <div id="registerForm">
                <h2><u>Register</u></h2>
                <form id="register_Form" onsubmit="register(event)">
                    <input type="hidden" name="action" value="register">
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <button type="submit">Register</button>
                </form>
                <p>Already have an account? <a href="index.html">Login here</a></p>
            </div>
        </div>

        <script>
            function register(event) {
                event.preventDefault();
                const form = new FormData(document.getElementById('register_Form'));

                fetch("NewServlet", {
                    body: new URLSearchParams(form),
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    }
                }).then((res) => {
                    if (res.redirected) {
                        window.location.href = res.url;
                        return Promise.reject("Redirected");
                    }
                    return res.text();
                }).then(data => {
                    alert(data);
                }).catch(error => console.error("Registration Error:", error));
            }
        </script>

    </body>
</html>

