# 📌 User & Task Management System  

This is a **Java-based web application** built using **JSP, Servlets, Hibernate, and MySQL** for managing users and tasks. Users can **register, log in, and manage tasks** through a simple dashboard.  

---

## 🚀 Features  
✅ **User Authentication** (Sign up, Login, Logout)  
✅ **Task Management** (Add, Update, Delete Tasks)  
✅ **Session Handling** (User remains logged in)  
✅ **Database Connectivity** using Hibernate & MySQL  
✅ **Modern UI** with Glassmorphism Styling  
✅ **Full CRUD Operations** for Users & Tasks  

---

## 🛠️ Technologies Used  
- **Java EE (Servlets, JSP)**  
- **Hibernate (ORM)**  
- **MySQL (Database)**  
- **NetBeans (IDE)**  
- **Bootstrap & CSS (Frontend Styling)**  

---

## 📂 Project Structure  
```bash
UserTaskManagement/
├── src/
│   ├── com.abhishek.kumar.model/
│   │   ├── User.java
│   │   ├── Task.java
│   ├── com.abhishek.kumar.service/
│   │   ├── UserService.java
│   │   ├── TaskService.java
│   ├── com.abhishek.kumar.servlet/
│   │   ├── newServlet.java
├── WebContent/
│   ├── jsp/
│   │   ├── index.jsp
│   │   ├── register.jsp
│   │   ├── dashboard.jsp
│   ├── css/
│   │   ├── style.css
├── pom.xml
├── README.md
```

---
## 📌 Setup & Installation  

### 🔹 Prerequisites  
✔️ Java JDK 8+  
✔️ NetBeans 
✔️ Apache Tomcat (9.0 or higher)  
✔️ MySQL & MySQL Workbench  

### 🔹 Steps to Run the Project  

1️⃣ **Clone the Repository**  
```sh
git clone https://github.com/your-username/UserTaskManagement.git
```

2️⃣ Open in NetBeans or Eclipse 
 ```
open project -> project file
```
3️⃣ Configure Database (MySQL) 
 
**create a database named 'project'**
```
create database project
use database
```
**Update hibernate.cfg.xml with your MySQL username & password** 
 
4️⃣ Run the Project  
Right-click the project → Run on Server (Tomcat)  

5️⃣ Access the Web App  
Open browser and go to:
```
http://localhost:8080/UserTaskManagement
```
--- 
📌 API Endpoints
## 📌 API Endpoints  

| HTTP Method |&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp; Endpoints  | &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Description | 
  

| **POST**   |&nbsp; &nbsp; &nbsp; &nbsp;    `/UserServlet?action=register` &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  | Register a new user    |  
| **POST**   |&nbsp; &nbsp; &nbsp; &nbsp;  `/UserServlet?action=login`     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   | User login             |  
| **GET**    |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  `/TaskServlet?action=getAllTasks`  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Fetch all tasks |   
| **POST**   |&nbsp; &nbsp; &nbsp; &nbsp;  `/TaskServlet?action=addTask`   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Add a new task         |  
| **POST**   |&nbsp; &nbsp; &nbsp; &nbsp;  `/TaskServlet?action=updateTask`  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| Update a task         |  
| **POST**   |&nbsp; &nbsp; &nbsp; &nbsp;  `/TaskServlet?action=deleteTask`  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Delete a task         |   

---
## 📌 How It Works  

### 🟢 User Registration & Login  
1️⃣ New users register using **name, username, and password**.  
2️⃣ On login, credentials are **verified using Hibernate**.  
3️⃣ If valid, the user is **redirected to `dashboard.jsp`**.  

### 🟢 Task Management  
1️⃣ Users can **add a new task** (title, description).  
2️⃣ Tasks are **stored in the database** and displayed in the **dashboard**.  
3️⃣ Users can **update or delete tasks** as needed.  

---
## 📌 Database Schema  

```sql
CREATE DATABASE TaskManager;

USE TaskManager;

CREATE TABLE Tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100)
);

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

// add for some dummy tasks after that you will able to task after logged_in
INSERT INTO Tasks (title, description, category) VALUES
('Complete Project Report', 'Finalize and submit the final report for the AI project.', 'Work'),
('Grocery Shopping', 'Buy vegetables, fruits, milk, and other essentials.', 'Personal')
```
---

## 📌 Contributors  

👤 **Abhishek Mishra**  
[GitHub Profile](https://github.com/Abhishek-Mishra31)  

