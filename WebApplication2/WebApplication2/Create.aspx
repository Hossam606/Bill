<%@ Page Title="Create" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    
          <div class="content-body" runat="server">
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
 
  
                                    </div>
                                </div>

                                <div class="row mt-5">
                                    <div class="col-lg-12">
                                        <div class="create-invoice-table table-responsive">
                                            <table id="invoiceDetailsTable" class="table invoice-details-table" runat="server" style="min-width: 620px;">
                                                <thead>
                                                    <tr>
                                                        
                                                        <th><asp:Label ID="LabelMan" runat="server" Text="Manage"></asp:Label></th>
                                                        <th><asp:Label ID="LabelItem" runat="server" Text="Items"></asp:Label></th>
                                                       
                                                        <th>
                                                            <asp:Label ID="LabelQuan" runat="server" Text="Quantity"></asp:Label></th>
                                                        <th>
                                                            <asp:Label ID="LabelUnit_Price" runat="server" Text="Unit Price"></asp:Label></th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                   <tr>
                                                       <%--<td><asp:CheckBox ID="CheckBox1" runat="server" /> </td>--%>
                                                       <td><input type="checkbox" ID="CheckBox1" runat="server"/></td>

                                                       <td class="muted-text">item 1</td>
                                                       <td class="quantity muted-text">
                                                           <asp:TextBox ID="TextQuantity" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>
                                                       </td>
                                                       <td class="unit-price muted-text">
                                                           <asp:TextBox ID="TextUnitPrice" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>
                                                       </td>
                                                       <td class="text-primary total"><span>0.00</span></td>
                                                   </tr>
                                                   <tr>
                                                       <%--<td><asp:CheckBox ID="CheckBox2" runat="server" /> </td>--%>
                                                       <td><input type="checkbox" ID="CheckBox2" runat="server"/></td>

                                                       <td class="muted-text">item 1</td>
                                                       <td class="quantity muted-text">
                                                           <asp:TextBox ID="TextBox1" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>
                                                       </td>
                                                       <td class="unit-price muted-text">
                                                           <asp:TextBox ID="TextBox2" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>
                                                       </td>
                                                       <td class="text-primary total"><span>0.00</span></td>
                                                   </tr>
                                                   <tr>
                                                       <%--<td><asp:CheckBox ID="CheckBox3" runat="server" /> </td>--%>
                                                       <td><input type="checkbox" ID="CheckBox3" runat="server"/></td>
                                                       <td class="muted-text">item 1</td>
                                                       <td class="quantity muted-text">
                                                           <asp:TextBox ID="TextBox3" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>
                                                       </td>
                                                       <td class="unit-price muted-text">
                                                           <asp:TextBox ID="TextBox4" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>
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
     


    


    <script src="js/JavaScript.js"></script>
</asp:Content>
