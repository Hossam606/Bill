
function calculateRowTotal(row) {
        var quantity = parseInt(row.querySelector('.quantity input').value);
    var unitPrice = parseFloat(row.querySelector('.unit-price input').value);
    var total = quantity * unitPrice;
        row.querySelector('.total span').textContent = total.toFixed(2);
        calculateBillNet();
}

function calculateBillNet() {
    var totalElements = document.querySelectorAll('.invoice-details-table .total span');
    var netTotal = 0;

    for (var i = 0; i < totalElements.length; i++) {
        var total = parseFloat(totalElements[i].textContent);
        netTotal += total;
    }

    document.querySelector('.invoice-details-table .net-total span').textContent = netTotal.toFixed(3);
}

//function deleteSelectedRows() {
//    var table = document.querySelector('.invoice-details-table');
//    var checkboxes = table.querySelectorAll('input[type="checkbox"]');

//    // Loop through the checkboxes and delete the selected rows
//    for (var i = checkboxes.length - 1; i >= 0; i--) {
//        if (checkboxes[i].checked) {
//            var row = checkboxes[i].parentNode.parentNode; 
//            row.parentNode.removeChild(row);  
//        }
//    }
//}
function deleteSelectedRows() {
    var table = document.getElementById("invoiceDetailsTable");
    var checkboxes = table.querySelectorAll('input[type="checkbox"]:checked');

    for (var i = 0; i < checkboxes.length; i++) {
        var row = checkboxes[i].closest("tr");
        table.deleteRow(row.rowIndex);
    }
}

