using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Invoice_Task
{
    public partial class Default : System.Web.UI.Page
    {
        Invoice_TaskEntities db =new Invoice_TaskEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            var all = from i in db.Invoices
                      select i.Item_Name;
            string x ="ssds";
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            List<Invoice> invoicesList = new List<Invoice>();
            
            foreach (TableRow row in invoiceDetailsTable.Rows)
            {
                // Skip the header row
                if (row.TableSection == TableRowSection.TableHeader)
                    continue;
            
                Invoice invoice = new Invoice();

                invoice.Item_Name = row.Cells[1].Text;
                invoice.Quntity = Convert.ToInt32(((TextBox)row.Cells[2].FindControl("TextQuantity")).Text);
                invoice.Unit_Price = Convert.ToDecimal(((TextBox)row.Cells[3].FindControl("TextUnitPrice")).Text);
                invoice.Total = Convert.ToDecimal(row.Cells[4].Text);

                
                invoicesList.Add(invoice);
            }

            // Save the invoices to the database
             
                db.Invoices.AddRange(invoicesList);
                db.SaveChanges();
             
        }

         
    }
}