<%@  Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Test.aspx.cs" Inherits="WebApplication2.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create</title>
    <link href="css/style.css" rel="stylesheet" />
</head> 
<body>
    <form id="form1" runat="server">
        <div>
    
          <div class="content-body" runat="server" style="margin-left:0px">
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
                                         
                                        <asp:Button class="btn btn-primary btn-sl-lg mr-3" ID="SaveButton" runat="server" Text="Save bill in DB" OnClick="SaveButton_Click" Width="193px" />
                                        <asp:Button class="btn btn-danger btn-sl-lg mr-3" ID="DeleteButton" runat="server" Text="Delete selected rows" OnClientClick="deleteSelectedRows(); return false;" />

                                        <%--<button class="btn btn-primary btn-sl-lg mr-3" id="SaveButton" runat="server" onclick="SaveButton_Click" >Save bill in DB</button>--%> 
<%--                                        <button class="btn btn-info "  id="DeleteButton" runat="server"  OnClientClick="deleteSelectedRows(); return false;>Delete selected rows</button>--%>
  
                                    </div>
                                </div>

                                <div class="row mt-5">
                                    <div class="col-lg-12">
                                        <div class="create-invoice-table table-responsive">
                                            <table id="invoiceDetailsTable" class="table invoice-details-table" runat="server" style="min-width: 620px;">
                                                 <thead>
                                                    <%--<tr>
                                                        
                                                        <th><asp:Label ID="Label1" runat="server" Text="Manage"></asp:Label></th>
                                                         
                                                        <th><asp:Label ID="Label2" runat="server" Text="Itemskk"></asp:Label></th>
                                                       
                                                        <th>
                                                            <asp:Label ID="Label3" runat="server" Text="Quantity"></asp:Label></th>
                                                        <th>
                                                            <asp:Label ID="Label4" runat="server" Text="Unit Price"></asp:Label></th>
                                                        <th>Total</th>
                                                    </tr>--%>
                                                     <tr>
                                                        <th ID="Label1" runat="server">Manage</th>
                                                        <th ID="Label2" runat="server">Items</th>
                                                       
                                                        <th ID="Label3" runat="server" >Quantity</th>
                                                        <th ID="Label4" runat="server">Unit Price</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                   <tr>
                                                        
                                                       <td> 
                                                           <%--<input type="checkbox" ID="CheckBox1" runat="server"/>--%>
                                                       <input id="CheckBox1"  runat="server" type="checkbox" />

                                                       </td>
                                                       <td id="item1" class="muted-text">item 1</td>
                                                       <td class="quantity muted-text">
                                                           <%--<asp:TextBox ID="TextQuantity" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>--%>
                                                           <input runat="server" id="TextQuantity" type="text" style="text-align:center;" onchange="calculateRowTotal(this.closest('tr'))"/>
                                                       </td>
                                                       <td class="unit-price muted-text">
                                                           <%--<asp:TextBox ID="TextUnitPrice" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>--%>
                                                           <input runat="server" id="TextUnitPrice" type="text" style="text-align:center;" onchange="calculateRowTotal(this.closest('tr'))"/>
                                                       </td>
                                                       <td class="text-primary total"><span>0.00</span></td>
                                                    </tr>
                                                   <tr>
                                                       
                                                       <%--<td><input type="checkbox" ID="CheckBox2" runat="server"/></td>--%>
                                                      <td> 
                                                          <input id="CheckBox2"  runat="server" type="checkbox" />
                                                      </td>
                                                       
                                                       <td class="muted-text">item 2</td>
                                                       <td class="quantity muted-text">
                                                           <%--<asp:TextBox ID="TextBox1" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>--%>
                                                           <input runat="server" id="TextBox1" type="text" style="text-align:center;" onchange="calculateRowTotal(this.closest('tr'))"/>

                                                       </td>
                                                       <td class="unit-price muted-text">
                                                           <%--<asp:TextBox ID="TextBox2" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>--%>
                                                           <input runat="server" id="TextBox2" type="text" style="text-align:center;" onchange="calculateRowTotal(this.closest('tr'))"/>
                                                       </td>
                                                       <td class="text-primary total"><span>0.00</span></td>
                                                   </tr>
                                                   <tr>
                                                        
                                                       <td><input type="checkbox" id="CheckBox3" runat="server"/></td>
                                                       <td class="muted-text">item 3</td>
                                                       <td class="quantity muted-text">
                                                           <%--<asp:TextBox ID="TextBox3" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>--%>
                                                           <input runat="server" id="TextBox3" type="text" style="text-align:center;" onchange="calculateRowTotal(this.closest('tr'))"/>
                                                       </td>
                                                       <td class="unit-price muted-text">
                                                           <%--<asp:TextBox ID="TextBox4" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>--%>
                                                           <input runat="server" id="TextBox4" type="text" style="text-align:center;" onchange="calculateRowTotal(this.closest('tr'))"/>
                                                       </td>
                                                       <td class="text-primary total"><span>0.00</span></td>
                                                   </tr>
                                                     
                                                     <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td>Net</td>
                                                        <td class="text-primary net-total"><span>0.000</span></td>
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
    <script src="js/JavaScript.js"></script>
 
    
</body>
</html>
