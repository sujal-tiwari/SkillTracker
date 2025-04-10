# SkillTracker – Resume Skill Analyzer 🧠📄

SkillTracker is a resume skill analyzer web application built using **JSP**, **JDBC**, and **MySQL**. It allows job seekers to upload resumes and recruiters to search candidate profiles based on specific skills. It features admin login, resume uploads, and skill-based search functionality.

---

## 🔧 Technologies Used

- **Frontend**: HTML, CSS, JSP
- **Backend**: Java (JDBC), Servlet (DB Connection), MySQL
- **Database**: MySQL
- **Server**: Apache Tomcat
- **Tools**: Eclipse IDE, GitHub

---

## ⚙️ Features

✅ Resume Upload with Skill Extraction  
✅ Store Candidate Details in MySQL  
✅ Admin Login (Simple authentication)  
✅ Skill-based Candidate Search  
✅ Download Uploaded Resumes  
✅ Clean, Modern UI with Responsive Design

---

## 📁 Project Structure
SkillTracker/ │ ├── index.jsp # Main upload form ├── register.jsp # Resume data input ├── store.jsp # Data insertion logic ├── view.jsp # Admin dashboard ├── adminlogin.jsp # Admin login ├── success.jsp # Upload success message ├── error.jsp # Error fallback page │ ├── style.css # Stylesheet ├── script.js # Frontend script │ ├── WEB-INF/ │ ├── web.xml # Servlet config │ └── lib/ # All required JARs │ └── src/ └── main/ └── java/ └── com/ ├── DBConnection.java # Database connection class └── RegisterServlet.java # Servlet to handle upload

---

## 🛠 How to Run

1. **Clone or download** this repository.
2. **Open in Eclipse IDE** as a Dynamic Web Project.
3. Import MySQL `.sql` script and create a DB named `skilltracker`.
4. Edit `DBConnection.java` and update your DB username/password.
5. Add required JAR files to `WEB-INF/lib` (like MySQL Connector, PDFBox).
6. Run the project on **Apache Tomcat 9**.
7. Access via:  
   `http://localhost:8081/SkillTracker/`

---

## 🔐 Admin Login

> You can change credentials inside `adminlogin.jsp`.
> Username: admin
Password: admin123


---

## 📂 Sample MySQL Table

```sql
CREATE DATABASE IF NOT EXISTS skilltracker;
USE skilltracker;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    skill TEXT NOT NULL,
    resume VARCHAR(255)
);
📸 Screenshots
![admin png](https://github.com/user-attachments/assets/9abd2fe7-455a-4e2e-b2f5-b4c86d17f231)

👤 About Me
Sujal Tiwari
📧 sujaltiwari27@gmail.com
🎓 B.Tech CSE | Web Developer | Open to Opportunities
🌐 Portfolio
🔗 LinkedIn-sujal-tiwari-1372b3247


---
⭐ Give this repo a star if you found it helpful!

