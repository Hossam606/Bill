<%@ Page Title="Create" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Invoice_Task.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col p-md-0">
                        <h4>Create Invoice</h4>
                    </div>
                    <div class="col p-md-0">
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
                                         
                                        <asp:Button class="btn btn-primary btn-sl-lg mr-3" ID="Button1" runat="server" Text="Save bill in DB" OnClick="Button1_Click" Width="193px" />
                                        <asp:Button class="btn btn-info  " ID="Button2" runat="server" Text="Delete selected rows" />
                                           
                                    </div>
                                </div>

                                <div class="row mt-5">
                                    <div class="col-lg-12">
                                        <div class="create-invoice-table table-responsive">
                                            <table class="table invoice-details-table" style="min-width: 620px;">
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
                                                        <%--<td><input type="checkbox"  /></td>--%>
                                                        <td><asp:CheckBox ID="CheckBox1" runat="server" /> </td>
                                                        <td class="muted-text">item 1</td>
                                                       
                                                        <td class="quantity muted-text">
                                                            <asp:TextBox ID="TextQuantity" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>
                                                            <%--<input  style="text-align:center;" value="1" type="text">--%>
                                                        </td>
                                                        <td class="unit-price muted-text">
                                                            <%--<input  style="text-align:center;" value="1" type="text">--%>
                                                            <asp:TextBox ID="TextUnitPrice" style="text-align:center;" runat="server" onchange="calculateRowTotal(this.closest('tr'))"></asp:TextBox>
                                                        </td>
                                                        <td class="text-primary total"><span>0.00</span></td>

                                                    </tr>
                                                    <tr>
                                                        <%--<td><input type="checkbox"  /></td>--%>
                                                        <td><asp:CheckBox ID="CheckBox2" runat="server" /> </td>
                                                        <td class="muted-text">item 1</td>
                                                       
                                                        <td class="muted-text">
                                                            <asp:TextBox ID="TextBox1" style="text-align:center;" runat="server"></asp:TextBox>
                                                            <%--<input  style="text-align:center;" value="1" type="text">--%>
                                                        </td>
                                                        <td class="muted-text">
                                                            <%--<input  style="text-align:center;" value="1" type="text">--%>
                                                            <asp:TextBox ID="TextBox2" style="text-align:center;" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="text-primary"><span>0.00</span></td>

                                                    </tr>
                                                    <tr>
                                                        <%--<td><input type="checkbox"  /></td>--%>
                                                        <td><asp:CheckBox ID="CheckBox3" runat="server" /> </td>
                                                        <td class="muted-text">item 1</td>
                                                       
                                                        <td class="muted-text">
                                                            <asp:TextBox ID="TextBox3" style="text-align:center;" runat="server"></asp:TextBox>
                                                            <%--<input  style="text-align:center;" value="1" type="text">--%>
                                                        </td>
                                                        <td class="muted-text">
                                                            <%--<input  style="text-align:center;" value="1" type="text">--%>
                                                            <asp:TextBox ID="TextBox4" style="text-align:center;" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="text-primary"><span>0.00</span></td>

                                                    </tr>
                                                     
                                                     
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td>Net</td>
                                                        <td class="text-primary"><span>0.000</span></td>
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
