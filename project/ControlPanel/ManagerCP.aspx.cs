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

public partial class ManagerCP : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    SqlDataReader sql_rd;
    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        str_conn = ConfigurationManager.AppSettings.Get(0);
        sql_conn.ConnectionString = str_conn;
        sql_comm.Connection = sql_conn;    

        if (Session["owner"] == "super_manager")
        {
            lblusr.Text = "نام کاربری :  " + Session["usr"].ToString();
            lbl_lst_log.Text = "آخرین ورود شما  :  " + Session["last_login"].ToString();
        }
        else
        {
            Response.Redirect("../ManagerER.aspx"); 
        }
        
    }
    protected void lbtn_logout_Click(object sender, EventArgs e)
    {
        try
        {
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.CommandText = "sp_upd_mng_online2";
            sql_comm.Parameters.AddWithValue("@online", false);
            sql_comm.Parameters.AddWithValue("@usr", Session["usr"].ToString());
            sql_comm.Parameters.AddWithValue("@pwd", Session["pwd"].ToString());
            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();
            Session.Abandon();

            Session.Abandon();
            Response.Redirect("../Login/Login.aspx");
        }
        catch(Exception exp)
        {
            sql_conn.Close();
        }
        
    }
}
