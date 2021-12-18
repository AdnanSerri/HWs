function showErrorMessage(message , showOrHide) {
    var errorHandler = document.getElementById('errorAlert');
    errorHandler.innerHTML = message;
    errorHandler.classList.add(showOrHide);
}

function showInfoMessage(message, showOrHide) {
    var infoHandler = document.getElementById('infoAlert');
    infoHandler.innerHTML = message;
    infoHandler.classList.add(showOrHide);
}

function hideHomeButton() {
    var home_button = document.getElementById('home_button');
    console.log(home_button);
    home_button.classList.add("d-none");
}