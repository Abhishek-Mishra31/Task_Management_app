<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.task_management_system.model.Tasks"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<%
    
    HttpSession userSession = request.getSession(false);
    List<Tasks> tasks = (List<Tasks>) userSession.getAttribute("tasks");
    if (tasks == null) {
        tasks = new java.util.ArrayList<>();
    }

  
    if (userSession == null || userSession.getAttribute("username") == null) {
        response.sendRedirect("index.html");
        return;
    }
    String username = (String) userSession.getAttribute("username");
%>

<!DOCTYPE html>
<html>
    <style>
       
        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            flex-direction: column;
            padding: 20px;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            width: 95%;
            max-width: 1000px;
            text-align: center;
        }

        h2, h3 {
            color: #333;
            margin-bottom: 15px;
        }

   
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        input {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            width: 80%;
            transition: 0.3s;
        }

        input:focus {
            border-color: #007bff;
            box-shadow: 0px 0px 10px rgba(0, 123, 255, 0.5);
            outline: none;
        }

      
        button {
            background: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease-in-out;
            font-weight: bold;
        }

        button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }

        .delete-btn {
            background: red;
        }

        .delete-btn:hover {
            background: darkred;
        }

       
        .logout-btn {
            background: red;
            margin-top: 15px;
            padding: 10px 15px;
        }

        .logout-btn:hover {
            background: darkred;
        }

        table {
            width: 100%;
            margin-top: 15px;
            border-collapse: collapse;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
            text-align: left;
        }

        th, td {
            border: none;
            padding: 15px;
            text-align: center;
        }

        th {
            background: #007bff;
            color: white;
            font-size: 18px;
            text-transform: uppercase;
        }

        td {
            font-size: 16px;
            background: #f9f9f9;
            color: #333;
        }

        tr:nth-child(even) {
            background: #eef7ff;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 10px;
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

    </style>
</head>
<body>

    <div class="container">
        <h2>Welcome, <%= username%>!</h2>
        <h3>Task Management Dashboard</h3>

      
        <form id="addTaskForm" onsubmit="addTask(event)">
            <input type="hidden" name="action" value="addTask">
            <input type="text" name="title" placeholder="Task Title" required>
            <br>
            <br>
            <input type="text" name="description" placeholder="Task Description" required>
            <br>
            <br>
            <input type="text" name="category" placeholder="Task category" required>
            <button type="submit">Add Task</button>
        </form>

      
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Tasks task : tasks) {%>
                <tr>
                    <td><%= task.getId()%></td>
                    <td><%= task.getTitle()%></td>
                    <td><%= task.getDescription()%></td>
                    <td><%= task.getCategory()%></td>
                    <td class="btn-group">
                        
                        <form onsubmit="updateTask(event)">
                            <input type="hidden" name="action" value="updateTask">
                            <input type="hidden" name="id" value="<%= task.getId()%>">
                            <input type="text" name="title" placeholder="New Title" required>
                            <input type="text" name="description" placeholder="New Description" required>
                            <input type="text" name="category" placeholder="New category" required>
                            <button type="submit">Update</button>
                        </form>

                        <form onsubmit="deleteTask(event)">
                            <input type="hidden" name="action" value="deleteTask">
                            <input type="hidden" name="id" value="<%= task.getId()%>">
                            <button type="submit" class="delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>

      
        <form action="NewServlet" method="post">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <script>
        function addTask(event) {
            event.preventDefault();
            const form = new FormData(document.getElementById('addTaskForm'));

            fetch("NewServlet", {
                method: 'POST',
                body: new URLSearchParams(form),
                headers: {"Content-Type": "application/x-www-form-urlencoded"}
            }).then(res => {
                if (res.redirected) {
                    window.location.href = res.url;
                    return Promise.reject("Redirected");
                }
                return res.text();
            }).then(data => {
                alert(data);
                location.reload();
            }).catch(error => console.error("Error adding task:", error));
        }

        function updateTask(event) {
            event.preventDefault();
            const form = event.target;
            const formData = new FormData(form);

            fetch("NewServlet", {
                method: 'POST',
                body: new URLSearchParams(formData),
                headers: {"Content-Type": "application/x-www-form-urlencoded"}
            }).then((res) => {
                if (res.redirected) {
                    window.location.href = res.url;
                    return Promise.reject("Redirected");
                }
            }).then((data) => {
                alert(data);
            })
                    .catch(error => console.error("Error updating task:", error));
        }

        function deleteTask(event) {
            event.preventDefault();
            const form = event.target;
            const formData = new FormData(form);

            if (confirm("Are you sure you want to delete this task?")) {
                fetch("NewServlet", {
                    method: 'POST',
                    body: new URLSearchParams(formData),
                    headers: {"Content-Type": "application/x-www-form-urlencoded"}
                }).then(res => res.text())
                        .then(data => {
                            location.reload();
                        })
                        .catch(error => console.error("Error deleting task:", error));
            }
        }
    </script>

</body>
</html>

