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

public partial class Register_Teacher : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager")
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;
        }
        else
        {
            Response.Redirect("managerER.aspx");
        }
    }
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        try
        {
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.CommandText = "sp_ins_tch_rgs";

            sql_comm.Parameters.AddWithValue("@tchid", txtid.Text.Trim());
            sql_comm.Parameters.AddWithValue("@pwd", txtpwd.Text.Trim());
            sql_comm.Parameters.AddWithValue("@nam", txtname.Text.Trim());
            sql_comm.Parameters.AddWithValue("@edu", drd_edu.Text.Trim());
            sql_comm.Parameters.AddWithValue("@age", txtage.Text.Trim());
            sql_comm.Parameters.AddWithValue("@tel", txttel.Text.Trim());
            sql_comm.Parameters.AddWithValue("@email", txtemail.Text.Trim());
            sql_comm.Parameters.AddWithValue("@addr", txtaddr.Text.Trim());

            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();
            lbl_er.Text = "عملیات با موفقیت انجام شد.";

            txt_dup_pwd.Text = "";
            txtaddr.Text = "";
            txtname.Text = "";
            txtpwd.Text = "";
            txttel.Text = "";
            txtid.Text = "";
            txtemail.Text = "";
            txtage.Text = "";

        }
        catch(SqlException sexp)
        {
            sql_conn.Close();
            if (sexp.ErrorCode == -2146232060)
                lbl_er.Text = "کد استاد تکراری است";
            else lbl_er.Text = "خطا در ثبت عملیات.";
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
            lbl_er.Text = exp.Message;
        }
    }
}
