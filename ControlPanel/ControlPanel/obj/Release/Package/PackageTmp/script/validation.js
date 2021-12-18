//Form Field
var firstNameField = document.getElementById("first_name");
var LastNameField = document.getElementById("last_name");
var MiddleInitialField = document.getElementById("middle_initial");
var CityField = document.getElementById("city");
var StateField = document.getElementById("state");
var ZipField = document.getElementById("zip");
var EmailField = document.getElementById("email");
var UserNameField = document.getElementById("username");
var PasswordField = document.getElementById("password");
var ConfirmPasswordField = document.getElementById("c_password");
var CommentsField = document.getElementById("comments");
var TermsField = document.getElementById("terms");

// All Required Field
var RequiredInputField = document.querySelectorAll("input:required");

//Form
var RegisterForm = document.getElementById("register");


// Add Event On Change Value To Validation Required Field
for (var i = 0; i < RequiredInputField.length; i++)
    RequiredInputField[i].addEventListener("input", function () {

        //Not Empity (Required)
        if (this.value == "")
            this.nextElementSibling.innerHTML = this.previousElementSibling.innerHTML + " Is Required";
        else
            this.nextElementSibling.innerHTML = "";
    });

// Allow  Only 5 - 10 Character In Zip Field
ZipField.addEventListener('input', function () {

    //Legnth Between 5-10
    if (this.value.length < 5 || this.value.length > 10)
        this.nextElementSibling.innerHTML = "You Must Input Only From 5 - 10 Character";
    else
        this.nextElementSibling.innerHTML = "";
});

// Email Validation
EmailField.addEventListener('input', function () {

        //Length < 6
    if (this.value.length < 6)
        this.nextElementSibling.innerHTML = "Email Must Has 6 Character At Least";

        // Contains @ 
    else if (this.value.indexOf('@') == -1)
        this.nextElementSibling.innerHTML = "Email Must Has @ Symbol";

        // Contains Dot After  @
    else if (this.value.indexOf('@') != -1 && this.value.indexOf('.', this.value.indexOf('@'))==-1)
        this.nextElementSibling.innerHTML = "Email Must Has dot after @ Symbol";

    else
        this.nextElementSibling.innerHTML = "";
});

//Confirmation Password
ConfirmPasswordField.addEventListener('input', function () {

    //Password And Confirm Is Math
    if (this.value != PasswordField.value)
        this.nextElementSibling.innerHTML = "Dosen't Match With Password !";
    else
        this.nextElementSibling.innerHTML = "";
});


//Comments Validation
CommentsField.addEventListener('input', function () {
    if (this.value.length > 100) {
        this.nextElementSibling.innerHTML = "Comments Is Too Long .. We Allow Only 100 Character";
        this.value=this.value.substr(0, 100);
    }
    else
        this.nextElementSibling.innerHTML = "";
});



//On Submit Form (Validation)
RegisterForm.addEventListener('submit', function (event) {
    event.preventDefault();

    if (!TermsField.checked)
        TermsField.nextElementSibling.innerHTML = "Must Agree To Terms !";
    else
        TermsField.nextElementSibling.innerHTML = "";

    if (IsValid())
        this.submit();    


});

function IsValid() {
    var errors = document.querySelectorAll('.error');
    //If All Error Not Visiable
    for (var i = 0; i < errors.length; i++) 
        if (errors[i].innerHTML != "")
            return false;

    return true;
}


