using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    /// <summary>
    /// this web form to test the conection with database
    /// </summary>
    public partial class TestConnection : System.Web.UI.Page
    {
        SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            _conn.Open();
            SqlCommand cmd = new SqlCommand("select * from invoice", _conn);
            cmd.ExecuteNonQuery();

            _conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            _conn.Open();
            SqlCommand cmd = new SqlCommand("insert into invoice values('" + TextBox2.Text + "','" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')", _conn);
            cmd.ExecuteNonQuery();
            _conn.Close();
        }
    }
}