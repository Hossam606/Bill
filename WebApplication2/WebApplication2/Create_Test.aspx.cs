using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    /// <summary>
    /// this web form to test the Create whitout header and footer
    /// </summary>
    public partial class Test : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Invoice_TaskEntities"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Invoice_TaskEntities"].ConnectionString))
            {
                connection.Open();
                var invoiceDetailsTable = (HtmlTable)FindControl("invoiceDetailsTable");
                var x = invoiceDetailsTable.Rows.Cast<HtmlTableRow>();

                foreach (HtmlTableRow row in invoiceDetailsTable.Rows.Cast<HtmlTableRow>().Skip(1).Take(invoiceDetailsTable.Rows.Count - 2))
                {
                    
                    var checkBox = (HtmlInputCheckBox)row.FindControl("CheckBox1");
                    if (!checkBox.Checked  )
                    {
                        //if(invoiceDetailsTable.Rows.Cast<HtmlTableRow>()) 
                        string itemName = row.Cells[1].InnerText;
                        HtmlInputText quantity = (HtmlInputText)row.FindControl("TextQuantity");
                        HtmlInputText unitPrice = (((HtmlInputText)row.FindControl("TextUnitPrice")));

                        var total = double.Parse(quantity.Value) * double.Parse(unitPrice.Value);


                        // Insert the data into the database
                        string query = "INSERT INTO Invoice (Item_name, Quntity, Unit_price, Total) VALUES (@ItemName, @Quantity, @UnitPrice, @Total)";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@ItemName", itemName);
                            command.Parameters.AddWithValue("@Quantity", double.Parse(quantity.Value));
                            command.Parameters.AddWithValue("@UnitPrice", double.Parse(unitPrice.Value));
                            command.Parameters.AddWithValue("@Total", total);

                            command.ExecuteNonQuery();
                        }

                    } 
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Save');", true);

            }





        }


    }
}