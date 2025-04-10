<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>SkillTracker – Resume Skill Analyzer</title>
  <link rel="stylesheet" href="style.css">
  <style>
    body {
      background: #f4f4f4;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }

    .container {
      background: #fff;
      padding: 30px 40px;
      border-radius: 10px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
      width: 100%;
      max-width: 500px;
    }

    h1, p {
      text-align: center;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
      margin-top: 20px;
    }

    input[type="text"],
    input[type="email"] {
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }

    .custom-upload-label {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 12px;
      background-color: #6C63FF;
      color: white;
      border-radius: 6px;
      font-weight: bold;
      cursor: pointer;
      justify-content: center;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .custom-upload-label:hover {
      background-color: #574fd6;
      transform: scale(1.03);
    }

    .custom-upload-label svg {
      width: 20px;
      height: 20px;
      fill: white;
    }

    input[type="file"] {
      display: none;
    }

    .upload-msg {
      margin-top: 8px;
      font-size: 14px;
      font-weight: 500;
      color: #28a745;
      display: flex;
      align-items: center;
      gap: 8px;
      animation: fadeIn 0.3s ease-in-out;
      word-break: break-word;
    }

    .upload-msg svg {
      width: 18px;
      height: 18px;
      fill: #28a745;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(4px); }
      to { opacity: 1; transform: translateY(0); }
    }

    button {
      padding: 12px;
      background-color: #6c63ff;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background 0.3s;
    }

    button:hover {
      background-color: #574fd6;
    }

    .footer {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
      color: #777;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>SkillTracker</h1>
    <p>Analyze your resume and discover your top skills</p>

    <form name="skillForm" onsubmit="return validateForm()" action="RegisterServlet" method="post" enctype="multipart/form-data">
      <input type="text" name="name" placeholder="Full Name" required />
      <input type="email" name="email" placeholder="Email Address" required />
      <input type="text" name="phone" placeholder="Phone Number" required />
      <input type="text" name="subject" placeholder="Subject" required />

      <label for="resume" class="custom-upload-label">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M14.59 2.59a2 2 0 0 0-2.83 0L6 8.34V20a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V8.34l-5.41-5.75zM12 4.75L16.25 9H13v5h-2V9H7.75L12 4.75z"/></svg>
        Upload Resume (PDF)
      </label>
      <input type="file" id="resume" name="resume" accept=".pdf" required onchange="showUploadMessage()">
      <p id="upload-msg" class="upload-msg"></p>

      <button type="submit">Analyze</button>
    </form>
    <div style="text-align:center; margin-top: 20px;">
    <a href="admin.jsp" style="color:#6c63ff; font-weight:bold;">Admin Login</a>
</div>

    <div class="footer">
      <p>&copy; 2025 SkillTracker. All rights reserved.</p>
    </div>
  </div>

  <script>
    function showUploadMessage() {
      const fileInput = document.getElementById('resume');
      const uploadMsg = document.getElementById('upload-msg');
      if (fileInput.files.length > 0) {
        uploadMsg.innerHTML = `
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M20.29 5.71a1 1 0 0 0-1.42 0L10 14.59l-4.29-4.3a1 1 0 1 0-1.42 1.42l5 5a1 1 0 0 0 1.42 0l10-10a1 1 0 0 0 0-1.42z"/>
          </svg>
          Uploaded: ${fileInput.files[0].name}`;
      } else {
        uploadMsg.innerText = "";
      }
    }

    function validateForm() {
      return true;
    }
  </script>
</body>
</html>
