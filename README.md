# 🎓 Student Course Enrollment System

> A centralized, high-performance web platform engineered for students to seamlessly manage course registrations, track financial statements, and maintain academic records.

[Version]<img width="263" height="65" alt="image" src="https://github.com/user-attachments/assets/0f6f65a3-4b8b-4821-ab54-636e92c42cd2" />

[Platform]<img width="886" height="344" alt="image" src="https://github.com/user-attachments/assets/7eb84e63-29f2-4ecc-bc3a-8d54c42dc9f2" />

[Language]<img width="728" height="95" alt="image" src="https://github.com/user-attachments/assets/737f21b5-e1c7-479d-879d-a3d05860a9a9" />

---

## 📌 Overview

The **Student Course Enrollment System** is a full-stack web application built with **ASP.NET Web Forms** and **C#**, backed by **SQL Server (LocalDB)**. It provides students with a unified interface to handle everything from course registration and schedule management to payment tracking and profile configuration — all in one place.

---

## 📸 Screenshots

### 📚 Course Enrollment
> Browse available courses and register in real-time. Enrolled courses are listed with timestamps.

<img width="1328" height="783" alt="image" src="https://github.com/user-attachments/assets/62e45e6f-8ba3-46ba-a602-f17bf7c57148" />

---

### ➕➖ Add / Drop Course
> Select any course and choose to add or drop it. Full add/drop history is tracked with dates and actions.

<img width="1312" height="773" alt="image" src="https://github.com/user-attachments/assets/7faccf0c-352c-4c56-8fcb-f5ad601685c0" />

---

### 💳 Payment
> Enter tuition amounts and process payments instantly. Full payment history with dates and status shown below.

<img width="1367" height="674" alt="image" src="https://github.com/user-attachments/assets/10a4b577-80aa-42df-bc1b-f46c1a0b8a32" />

---

### 📊 Student Statement
> A combined academic and financial summary — enrolled courses and payment history in one view.

<img width="1420" height="773" alt="image" src="https://github.com/user-attachments/assets/f12d8d62-d4ff-4c15-a9fa-d72a3213cb15" />

---

### 📩 Enquiry / Contact Us
> Submit queries or support requests directly to administrators through the built-in messaging form.

<img width="931" height="639" alt="image" src="https://github.com/user-attachments/assets/4b864492-c6e9-415c-8ee8-0a28cf6a0c47" />

---

### 👤 My Profile
> View and update personal details, bank information, and change account password securely.

<img width="1015" height="561" alt="image" src="https://github.com/user-attachments/assets/32d4e44f-4426-4301-8edd-d4cbba7e7f1e" />

---

## ✨ Key Features

### 🔐 Login & Authentication
Secure student sign-in with encrypted credential validation and session handling to protect user data and prevent unauthorized access.

### 📚 Course Enrollment
Browse all available modules and seamlessly register for courses in real-time with instant database synchronization.

### ➕➖ Add / Drop Courses
Manage your academic schedule flexibly — add new subjects or drop existing ones with full history tracking and immediate database updates.

### 💳 Payment Management
Track tuition fees, process financial transactions, and maintain detailed payment ledgers showing amount, date, and payment status.

### 👤 Profile Controls
Update personal information including name and bank details, manage account passwords, and configure individual account settings.

### 📩 Enquiry Submission
Send direct queries and support requests to system administrators instantly through a built-in messaging interface.

### 📊 Academic Statements
View a combined summary of enrolled courses and complete payment history — your full academic and financial record in one place.

---

## 🛠️ Technologies Used

| Layer        | Technology                         |
|--------------|------------------------------------|
| Frontend     | HTML, CSS, Bootstrap               |
| Backend      | C# (ASP.NET Web Forms)             |
| Database     | SQL Server (LocalDB)               |
| Platform     | ASP.NET Web Forms (.NET Framework) |

---

## 📁 Project Structure

```
Student-Enrollment-System-Project/
│
├── Pages/                  # ASP.NET Web Form pages (.aspx)
│   ├── Login.aspx
│   ├── Dashboard.aspx
│   ├── Enrollment.aspx
│   ├── AddDrop.aspx
│   ├── Payment.aspx
│   ├── Profile.aspx
│   ├── Enquiry.aspx
│   └── Statement.aspx
│
├── App_Code/               # C# backend logic / code-behind files
├── App_Data/               # SQL Server LocalDB database files
├── Scripts/                # JavaScript files
├── Styles/                 # CSS / Bootstrap stylesheets
├── Web.config              # Application configuration
└── README.md
```

> ⚠️ Update this structure to match your actual project layout if it differs.

---

## 🚀 Getting Started

### Prerequisites

- [Visual Studio 2019/2022](https://visualstudio.microsoft.com/)
- .NET Framework 4.x
- SQL Server LocalDB (included with Visual Studio)

### Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/teja866/Student-Enrollment-System-Project.git
   cd Student-Enrollment-System-Project
   ```

2. **Open in Visual Studio**
   - Launch Visual Studio
   - Open the `.slnx` solution file

3. **Configure the Database**
   - Open `Web.config` and verify the connection string points to your LocalDB instance
   - Run the provided SQL scripts (if any) to initialize the database schema and seed data

4. **Run the Application**
   - Press `F5` or click **Start** in Visual Studio
   - The application will launch in your default browser at `https://localhost:443xx/`

---

## 🎯 Objective

To provide a **user-friendly, centralized interface** for students to efficiently manage course registration, financial payments, and personal information — reducing administrative overhead and improving the overall academic experience.

---

## 📊 System Summary

| Metric       | Value              |
|--------------|--------------------|
| Modules      | 7                  |
| Core Tools   | 4                  |
| Platform     | ASP.NET Web Forms  |
| Target Users | Students           |

---

## 👨‍💻 Author

**Teja** — [@teja866](https://github.com/teja866)

---

## 📄 License

This project is developed as an **Academic Project (v2.0)** and is intended for educational purposes.
