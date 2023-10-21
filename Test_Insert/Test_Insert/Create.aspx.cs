using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Test_Insert
{
    public partial class Create : System.Web.UI.Page
    {
        //string con = "data source=(LocalDB)\MSSQLLocalDB;AttachDbFilename;database=Database1;integrated security=True";
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Test_Insert"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        
        
        protected void SaveButton_Click(object sender, EventArgs e)
        {

            


            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Test_Insert"].ConnectionString))
            {
                connection.Open();
                var invoiceDetailsTable = (HtmlTable)FindControl("invoiceDetailsTable");

                var x = invoiceDetailsTable.Rows.Cast<HtmlTableRow>();
                var invoiceList = new List<Invoice>();
                int i = 0;
                int count = invoiceDetailsTable.Rows.Cast<HtmlTableRow>().Skip(1).Take(invoiceDetailsTable.Rows.Count - 2).Count();

                foreach (HtmlTableRow row in invoiceDetailsTable.Rows.Cast<HtmlTableRow>().Skip(1).Take(invoiceDetailsTable.Rows.Count - 2))
                {

                    
                    var checkBox = (HtmlInputCheckBox)row.FindControl("CheckBox1");
                    if (checkBox != null && !checkBox.Checked)
                    {
                        int index = i++;
                        if (index <= count)
                        {
                            string itemName = row.Cells[1].InnerText;

                            HtmlInputText quantity = (HtmlInputText)row.FindControl("TextQuantity" + i);
                            HtmlInputText unitPrice = (HtmlInputText)row.FindControl("TextUnitPrice" + i);

                            if (quantity.Value == "" || unitPrice.Value == "")
                            {
                                goto Label1;
                            }
                            var total = int.Parse(quantity.Value) * decimal.Parse(unitPrice.Value);

                            var invoice = new Invoice
                            {
                                Item_Name = itemName,
                                Quntity = int.Parse(quantity.Value),
                                Unit_Price = decimal.Parse(unitPrice.Value),
                                Total = total
                            };

                            // Add the invoice to the list
                            invoiceList.Add(invoice);
                        Label1: string xff = "come here ";
                        }
                    }
                }


                // Insert the invoices into the database
                string query = "INSERT INTO Invoice (Item_name, Quntity, Unit_price, Total) VALUES (@ItemName, @Quantity, @UnitPrice, @Total)";
                foreach (Invoice invoice in invoiceList)
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ItemName", invoice.Item_Name);
                        command.Parameters.AddWithValue("@Quantity", invoice.Quntity);
                        command.Parameters.AddWithValue("@UnitPrice", invoice.Unit_Price);
                        command.Parameters.AddWithValue("@Total", invoice.Total);

                        command.ExecuteNonQuery();
                    }
                }

                // Save the new rows added dynamic in the database 
                string jsonData = Request["data"];
                SaveNewRowsInDB(jsonData);

                if (invoiceList.Count != 0)
                {
                    
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Save " + invoiceList.Count + " Row');", true);

                }
                 
                

            }

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public void SaveNewRowsInDB(string jsonData)
        {


            if (jsonData != null)
            {
                List<Invoice> invoiceList = JsonConvert.DeserializeObject<List<Invoice>>(jsonData);


                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Test_Insert"].ConnectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Invoice (Item_name, Quntity, Unit_price, Total) VALUES (@ItemName, @Quantity, @UnitPrice, @Total)";

                    foreach (Invoice invoice in invoiceList)
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@ItemName", invoice.Item_Name);
                            command.Parameters.AddWithValue("@Quantity", invoice.Quntity);
                            command.Parameters.AddWithValue("@UnitPrice", invoice.Unit_Price);
                            command.Parameters.AddWithValue("@Total", invoice.Total);

                            command.ExecuteNonQuery();
                        }
                    }


                }

                //Response.StatusCode = 200;
                //Response.Write(+invoiceList.Count()+" Rows added dynamic saved successfully!");
                //Response.End();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + invoiceList.Count + " Rows added dynamic saved successfully!');", true);

            }

        }
    }
}