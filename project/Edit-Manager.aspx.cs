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

public partial class Edit_Manager : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    SqlDataReader sql_rd;

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager")
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;
            sql_comm.CommandType = CommandType.StoredProcedure;
        }
        else
        {
            Response.Redirect("ManagerER.aspx");
        }
    }
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        try
        {
            sql_comm.CommandText = "sp_upd_mng_online2";
            sql_comm.Parameters.AddWithValue("@online", false);
            sql_comm.Parameters.AddWithValue("@usr", Session["usr"].ToString());
            sql_comm.Parameters.AddWithValue("@pwd", Session["pwd"].ToString());
            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();
            sql_comm.Parameters.Clear();

            sql_comm.CommandText = "sp_upd_mng";
            if (txtpwdprv.Text == Session["pwd"].ToString())
            {
                sql_comm.Parameters.AddWithValue("@pwd", txtpwdprv.Text.Trim());
            sql_comm.Parameters.AddWithValue("@usr2", txtusr.Text.Trim());
            sql_comm.Parameters.AddWithValue("@pwd2", txtpwd.Text.Trim());
            sql_comm.Parameters.AddWithValue("@usr", Session["usr"].ToString());

            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();

            Session.Abandon();

            lbl_er.Text = "عملیات با موفقیت انجام شد -- لطفا دوباره وارد شوید.";
            txtusr.Text = "";
            }
            else
            {
                lbl_er.Text = "کلمه عبور قبلی اشتباه است.";
            }
            
        }
        catch(Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void lbtn_logoff_Click(object sender, EventArgs e)
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
            Response.Redirect("LogOut.aspx");
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
}
