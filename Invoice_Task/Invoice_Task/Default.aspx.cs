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
             

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var myinvoice = new Invoice
            {
                Item_Name = "Iphone 14",
                Quntity = 2,
                Unit_Price = 2,
                Total = 4
            };
            db.Invoices.Add(myinvoice);
            db.SaveChanges();
        }
    }
}