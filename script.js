function validateForm() {
    let name = document.forms["skillForm"]["name"].value.trim();
    let email = document.forms["skillForm"]["email"].value.trim();
    let phone = document.forms["skillForm"]["phone"].value.trim();
    let skill = document.forms["skillForm"]["skill"].value.trim();

    if (name === "" || email === "" || phone === "" || skill === "") {
        alert("All fields are required!");
        return false;
    }

    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!email.match(emailPattern)) {
        alert("Enter a valid email address");
        return false;
    }

    let phonePattern = /^[0-9]{10}$/;
    if (!phone.match(phonePattern)) {
        alert("Enter a valid 10-digit phone number");
        return false;
    }

    return true;
}
