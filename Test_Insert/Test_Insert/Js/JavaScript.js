


//// Function to add a new row to the table
//function addRow() {
//    var table = document.getElementById("invoiceDetailsTable");
//    var newRow = table.insertRow(1); // Insert a new row as the second row in the table (index 1)

//    // Add cells to the new row
//    var checkboxCell = newRow.insertCell(0);
//    var itemCell = newRow.insertCell(1);
//    var quantityCell = newRow.insertCell(2);
//    var unitPriceCell = newRow.insertCell(3);
//    var totalCell = newRow.insertCell(4);

//    // Set the content of the cells
//    checkboxCell.innerHTML = '<input type="checkbox" />';
//    itemCell.innerHTML = 'New Item';
//    quantityCell.innerHTML = '<input type="text" style="text-align:center;" onchange="calculateRowTotal(this.closest(\'tr\'))" />';
//    unitPriceCell.innerHTML = '<input type="text" style="text-align:center;" onchange="calculateRowTotal(this.closest(\'tr\'))" />';
//    totalCell.innerHTML = '<span>0.00</span>';

    

//}

//// Add an event listener to the "Add Row" button
//document.getElementById("addRowButton2").addEventListener("click", addRow);