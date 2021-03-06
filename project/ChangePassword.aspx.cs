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

public partial class _Default : System.Web.UI.Page
{
    SqlCommand sql_comm = new SqlCommand();
    DataSet ds = new DataSet();
    SqlConnection sql_conn = new SqlConnection();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    string str_conn; 
    


    protected void Page_Load(object sender, EventArgs e)
    {
        /////////////////////////////////////////
        if (Session["owner"] == "student")
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;
        }
        else
            Response.Redirect("studentER.aspx");
    }
    protected void lbtn_logoff_Click1(object sender, EventArgs e)
    {
        try
        {
            sql_comm.Parameters.Clear();
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.CommandText = "sp_upd_std_online2";
            sql_comm.Parameters.AddWithValue("@online", false);
            sql_comm.Parameters.AddWithValue("@usr", Session["usr"].ToString());
            sql_comm.Parameters.AddWithValue("@pwd", Session["pwd"].ToString());
            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();

            Session.Abandon();
            Response.Redirect("LogOut.aspx");
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lb_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void btnregester_Click(object sender, EventArgs e)
    {
        if (Session["pwd"].ToString() == Txtoldpass.Text)
            {
                sql_comm.Parameters.AddWithValue("@user", Session["usr"].ToString());
                sql_comm.Parameters.AddWithValue("@npass", Txtnewpass.Text);
                try
                {
                    sql_comm.CommandType = CommandType.StoredProcedure;
                    sql_comm.CommandText = "hsp_cheng_pass";                    
                    sql_conn.Open();
                    sql_comm.ExecuteNonQuery();
                    sql_conn.Close();
                    Txtnewpass.Text = "";
                    Txtoldpass.Text = "";
                    Txtrepeatpass.Text = "";
                    lb_er.Text = "عملیات با موفقیت انجام شد.";
                    
                }
                catch (Exception exp)
                {
                    lb_er.Text = "خطا در انجام عملیات !";
                }
            }
            else
            {
                lb_er.Text = "رمز قبلی که وارد کردید درست نیست";
            }       
    }
}