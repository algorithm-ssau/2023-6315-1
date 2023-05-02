var bttn = document.getElementById("submitButton");

function addCustomer() {
    let name = document.getElementById("name").value;
    let address = document.getElementById("address").value;
    let phone = document.getElementById("phone").value;

    let xhr = new XMLHttpRequest();
    let params = name + '&' + address + '&' + phone;
    xhr.open("GET", 'http://25.19.103.131:5000/customer_add/' + params, true);
    xhr.send();
}

bttn.onclick = addCustomer;