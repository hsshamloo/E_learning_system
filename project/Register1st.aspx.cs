using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class RegisterF : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    SqlDataReader sql_rd;
    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        int i;

        str_conn = ConfigurationManager.AppSettings.Get(0);
        sql_conn.ConnectionString = str_conn;
        sql_comm.Connection = sql_conn;
        if (!IsPostBack)
        {
            drdday.Items.Clear();
            drdmon.Items.Clear();
            drdyear.Items.Clear();
            for (i = 1; i <= 9; i++)
                drdyear.Items.Add("130" + i.ToString());
            for (i = 10; i <= 65; i++)
                drdyear.Items.Add("13" + i.ToString());
            for (i = 1; i <= 12; i++)
                drdmon.Items.Add(i.ToString());
            for (i = 1; i <= 31; i++)
                drdday.Items.Add(i.ToString());
        }
    }
    protected void btnnext_Click(object sender, EventArgs e)
    {
        
        try
        {
            sql_conn.Open();
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.CommandText = "sp_dup_usrid_std";
            sql_comm.Parameters.AddWithValue("@usrid", txtusr.Text.Trim());

            sql_rd = sql_comm.ExecuteReader();
            sql_rd.Read();
            if (sql_rd.GetValue(0).ToString() == "0")
            {
                sql_rd.Close();
                sql_conn.Close();
                sql_comm.Parameters.Clear();
                sql_conn.Open();
                sql_comm.CommandType = CommandType.StoredProcedure;
                sql_comm.CommandText = "sp_dup_pid";
                sql_comm.Parameters.AddWithValue("@pid", txtp_id.Text.Trim());

                sql_rd = sql_comm.ExecuteReader();
                sql_rd.Read();
                if (sql_rd.GetValue(0).ToString() == "0")
                {
                    sql_rd.Close();
                    sql_conn.Close();

                    
                    Session["usr"] = txtusr.Text.Trim();
                    Session["pwd"] = txtpwd.Text.Trim();
                    Session["bty"] = drdyear.Text.Trim();
                    Session["btm"] = drdmon.Text.Trim();
                    Session["btd"] = drdday.Text.Trim();
                    Session["email"] = txtemail.Text.Trim();
                    Session["pid"] = txtp_id.Text.Trim();
                    Session["tel"] = txttel.Text.Trim();
                    Session["fthnam"] = txt_father.Text.Trim();
                    Session["fname"] = txtname.Text.Trim();
                    Session["lname"] = txtfamily.Text.Trim();
                    Session["status"] = "reg";
                    Response.Redirect("Register2nd.aspx");
                }
                else
                {
                    lbler.Text = "شماره دانشجویی تکراری است !";
                    txtp_id.Text = "";
                }
                
            }
            else
            {
                lbler.Text = "نام کاربری تکراری است !";
                txtusr.Text = "";
            }
            
        }
        catch(SqlException exp)
        {
            sql_conn.Close();
            lbler.Text = exp.Message;
        }
        
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        txt_father.Text = "";
        txtemail.Text = "";
        txtfamily.Text = "";
        txtname.Text = "";
        txtp_id.Text = "";
        txtpwd.Text = "";
        txtpwd_dup.Text = "";
        txttel.Text = "";
        txtusr.Text = "";
        drdday.SelectedIndex = 0;
        drdmon.SelectedIndex = 0;
        drdyear.SelectedIndex = 0;
    }
    protected void drdmon_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i;
        if (Convert.ToInt32(drdmon.SelectedItem.Text) <= 6)
        {
            drdday.Items.Clear();
            for (i = 1; i <= 31; i++)
                drdday.Items.Add(i.ToString());
        }
        else if (Convert.ToInt32(drdmon.SelectedItem.Text) > 6 && Convert.ToInt32(drdmon.SelectedItem.Text) <= 11)
        {
            drdday.Items.Clear();
            for (i = 1; i <= 30; i++)
                drdday.Items.Add(i.ToString());
        }
        else
        {
            drdday.Items.Clear();
            for (i = 1; i <= 29; i++)
                drdday.Items.Add(i.ToString());
        }
    }
}
