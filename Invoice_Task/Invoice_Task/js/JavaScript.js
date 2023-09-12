
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

