<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="Test_Insert.Create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Style/style.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style5 {
            left: 0px;
            top: 0px;
            width: 26px;
            height: 31px;
        }
    </style>
  
</head>
 <body >
    <form id="form1" runat="server">
        <div>
    
          <div class="content-body" style="margin-left:0px">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col">
                        <h4>Create Invoice</h4>
                    </div>
                    <div class="col">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a>
                            </li>
                            <!-- <li class="breadcrumb-item"><a href="javascript:void(0)">Pages</a>
                            </li> -->
                            <li class="breadcrumb-item active">Create Invoice</li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                         
                                        <%--<asp:Button class="btn btn-primary btn-sl-lg mr-3" ID="SaveButton" runat="server" Text="Save bill in DB" OnClick="SaveButton_Click" Width="193px" />--%>
                                        <asp:Button class="btn btn-primary btn-sl-lg mr-3" ID="Button1" runat="server" Text="Save bill in DB"  OnClick="SaveButton_Click" Width="193px" />
                                        <asp:Button class="btn btn-danger btn-sl-lg mr-3" ID="DeleteButton" runat="server" Text="Delete selected rows" OnClientClick="deleteSelectedRows(); return false;" Width="240px" />
                                        <button class="btn btn-danger btn-sl-lg mr-3" id="addNewRowButton" type="button" runat="server" onclick="addNewRow()">Add New Row</button>
                                         <%--<button class="btn btn-danger btn-sl-lg mr-3" id="" type="button" runat="server" onclick="saveRowsInDB()">AddRow</button>--%>

                                    </div>
                                </div>

                               

                                    <div class="row mt-5">
                                        <div class="col-lg-12">
                                            <div class="create-invoice-table table-responsive" >
                                                <table id="invoiceDetailsTable" class="table invoice-details-table" runat="server" style="min-width: 620px;">
                                                    <thead>
                                                        <tr>
                                                            <th ID="Label1" >Manage</th>
                                                            <th ID="Label2" >Items</th>
                                                            <th ID="Label3" >Quantity</th>
                                                            <th ID="Label4" >Unit Price</th>
                                                            <th>Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody  id="invoiceDetailsBody" >

                                                     <%--Existing commented-out code for a sample item row --%>
                                                         <tr>
                                                            <td> 
                                                            <input id="CheckBox1"  runat="server" type="checkbox" class="auto-style5" />
                                                            
                                                            </td>
                                                            <td>Item</td>
                                                            <td>
                                                                <input runat="server" class="inputQuantity" type="text" id="TextQuantity1" style="text-align:center;" onchange="calculateRowTotal(this.closest(&quot;tr&quot;))"/>
                                                            </td>
                                                            <td>
                                                                <input runat="server" class="inputUnit" type="text" id="TextUnitPrice1" style="text-align:center;" onchange="calculateRowTotal(this.closest(&quot;tr&quot;))"/>
                                                            </td>
                                                            <td><span class="totalRow">0.00</span>
                                                            </td>
                                                         </tr>
                                                        <tr>
                                                            <td> 
                                                            <input id="CheckBox2"  runat="server" type="checkbox" class="auto-style5" />
                                                            
                                                            </td>
                                                            <td>Item</td>
                                                            <td>
                                                                <input  runat="server" class="inputQuantity" type="text" id="TextQuantity2" style="text-align:center;" onchange="calculateRowTotal(this.closest(&quot;tr&quot;))"/>
                                                            </td>
                                                            <td>
                                                                <input  runat="server" class="inputUnit" type="text" id="TextUnitPrice2" style="text-align:center;" onchange="calculateRowTotal(this.closest(&quot;tr&quot;))"/>
                                                            </td>
                                                            <td><span class="totalRow">0.00</span>
                                                            </td>
                                                         </tr>
                                                        <tr>
                                                            <td> 
                                                            <input id="CheckBox3"  runat="server" type="checkbox" class="auto-style5" />
                                                            
                                                            </td>
                                                            <td>Item</td>
                                                            <td>
                                                                <input  runat="server" class="inputQuantity" type="text" id="TextQuantity3" style="text-align:center;" onchange="calculateRowTotal(this.closest(&quot;tr&quot;))"/>
                                                            </td>
                                                            <td>
                                                                <input  runat="server" class="inputUnit" type="text" id="TextUnitPrice3" style="text-align:center;" onchange="calculateRowTotal(this.closest(&quot;tr&quot;))"/>
                                                            </td>
                                                            <td><span class="totalRow">0.00</span>
                                                            </td>
                                                         </tr>
                                                        
                                                      <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td>Net</td>
                                                            <td class="text-primary net-total"><span style="font-family: 'Bahnschrift SemiBold'; color: #0000FF; font-size: large; font-weight: bold;">0.000</span></td>
                                                        </tr>
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div> 
     


     </div>

</form>
<script src="Js/JavaScript.js"></script>

     <script>

         var counter = 4;

         function addNewRow() {
             debugger;
             var tableBody = document.querySelector("#invoiceDetailsTable tbody");
             console.log("counter = " + tableBody);
             // Create a new row
             var newRow = document.createElement("tr");

             // Create cells for the row
             var manageCell = document.createElement("td");
             var itemsCell = document.createElement("td");
             var quantityCell = document.createElement("td");
             var unitPriceCell = document.createElement("td");
             var totalCell = document.createElement("td");

             // Set the HTML content of the cellss
             manageCell.innerHTML = "<td><input class='auto-style5' type='checkbox' id='CheckBox" + counter + " ' /></td>";
             itemsCell.innerHTML = "Item";
             quantityCell.innerHTML = "<input  class='inputQuantity' type='text'  id='TextQuantity" + counter + "' style='text-align:center;' onchange='calculateRowTotal(this.closest(\"tr\"))' />";
             unitPriceCell.innerHTML = "<input  class='inputUnit' type='text'  id='TextUnitPrice" + counter + "' style='text-align:center;' onchange='calculateRowTotal(this.closest(\"tr\"))' />";
             totalCell.innerHTML = "<span class='totalRow'>0.00</span></td>";

             console.log("counter = " + counter);
             // Append the cells to the row
             newRow.appendChild(manageCell);
             newRow.appendChild(itemsCell);
             newRow.appendChild(quantityCell);
             newRow.appendChild(unitPriceCell);
             newRow.appendChild(totalCell);
             counter++;

             

             var lastRow = tableBody.lastElementChild;
             tableBody.insertBefore(newRow, lastRow);

             

         }         

         function saveRowsInDB() {
             debugger;
             var table = document.getElementById("invoiceDetailsTable");
             var rows = table.getElementsByTagName("tr");

             // Prepare the data to be sent
             var data = [];
             for (var i = 1; i < rows.length; i++) {
                 var row = rows[i];
                 var checkbox = row.querySelector("input[type=checkbox]");

                 if (checkbox && !checkbox.checked) {
                     var item = {
                         itemName: row.cells[1].innerText,
                         quantity: row.querySelector(".inputQuantity").value,
                         unitPrice: row.querySelector(".inputUnit").value
                     };
                     data.push(item);
                 }
             }
             //var xhr = new XMLHttpRequest();
             //xhr.open("POST", "Create.aspx?data=" + encodeURIComponent(JSON.stringify(data)), true);
             //xhr.setRequestHeader("Content-Type", "application/json");
             //console.log("status" + xhr.status);
             //console.log("status" + xhr.readyState);
             //xhr.onreadystatechange = function () {
             //    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
             //        // Display success message or perform any other actions
             //        console.log("Rows saved successfully!");
             //    }
             //};
             //xhr.send();

             // Send the data to the server
             var xhr = new XMLHttpRequest();
             xhr.open("POST", "Create.aspx", true);
             xhr.setRequestHeader("Content-Type", "application/json");
             console.log("status" + xhr.status);
             console.log("status" + xhr.readyState);
             xhr.onreadystatechange = function () {
                 if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                     // Display success message or perform any other actions
                     console.log("Rows saved successfully!");
                 }
             };
             //xhr.send("data=" + JSON.stringify(data));
             xhr.send(JSON.stringify(data)); // Pass the data as a query parameter
         }
          


         function calculateRowTotal(row) {
             var quantity = parseInt(row.querySelector('.inputQuantity').value);
             var unitPrice = parseFloat(row.querySelector('.inputUnit').value);
             var total = quantity * unitPrice;
             row.querySelector('.totalRow').textContent = total.toFixed(2);
             calculateBillNet();
         }

         function calculateBillNet() {
             var totalElements = document.querySelectorAll('.invoice-details-table .totalRow');
             var netTotal = 0;

             for (var i = 0; i < totalElements.length; i++) {
                 var total = parseFloat(totalElements[i].textContent);
                 netTotal += total;
             }

             document.querySelector('.invoice-details-table .net-total span').textContent = netTotal.toFixed(3);
         }


         function deleteSelectedRows() {
             var table = document.getElementById("invoiceDetailsTable");
             var checkboxes = table.querySelectorAll('input[type="checkbox"]:checked');

             for (var i = 0; i < checkboxes.length; i++) {
                 var row = checkboxes[i].closest("tr");
                 table.deleteRow(row.rowIndex);
             }
         }
     </script>

      
     
</body>
</html>
