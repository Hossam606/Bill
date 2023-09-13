using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //SqlConnection _conn=new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
             
        } 
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();

                foreach (TableRow row in invoiceDetailsTable.Rows)
                {
                    // Skip the header row
                    if (row.TableSection == TableRowSection.TableHeader)
                        continue;

                    //CheckBox checkBox = (CheckBox)row.FindControl("CheckBox1");
                    //if (checkBox.Checked)
                    //{
                    string itemName = row.Cells[1].Text;
                    int quantity = int.Parse(((TextBox)row.FindControl("TextQuantity")).Text);
                    decimal unitPrice = decimal.Parse(((TextBox)row.FindControl("TextUnitPrice")).Text);
                    decimal total = Convert.ToDecimal(row.Cells[4].Text);

                    // Insert the data into the database
                    string query = "INSERT INTO Invoice (Item_name, Quantity, Unit_price, Total) VALUES (@ItemName, @Quantity, @UnitPrice, @Total)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ItemName", itemName);
                        command.Parameters.AddWithValue("@Quantity", quantity);
                        command.Parameters.AddWithValue("@UnitPrice", unitPrice);
                        command.Parameters.AddWithValue("@Total", total);

                        command.ExecuteNonQuery();
                    }
                    //}
                }

                connection.Close();
            }

        }
    }
}