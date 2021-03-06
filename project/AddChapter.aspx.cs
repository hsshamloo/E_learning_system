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
public partial class AddChapter : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    SqlDataReader sql_dr;
    SqlCommand sql_comm = new SqlCommand();
    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        ///////////////////////////////////////////////
        if (Session["owner"] == "teacher")
        {
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_comm.Connection = sql_conn;
                sql_comm.CommandType = CommandType.StoredProcedure;
                Txtdarcname.Text = Session["crsname"].ToString();
            }
            catch (Exception exp)
            {
                Lbmsg.Text = "خطا در انجام عملیات !";
            }
        }
        else
        {
            Response.Redirect("teacherER.aspx");
        }
    }
    protected void btnregester_Click(object sender, EventArgs e)
    {
        try
        {
            sql_comm.Parameters.Clear();
            sql_comm.CommandText = "sp_sel_dup_chapter";
            sql_comm.Parameters.AddWithValue("@chname", Txtfaslname.Text.Trim());
            sql_comm.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
            SqlDataReader dr;

            sql_conn.Open();
            dr = sql_comm.ExecuteReader();
            dr.Read();
            int cnt = Convert.ToInt32(dr["cnt"]);
            dr.Read();
            sql_conn.Close();

            if (cnt == 0)
            {
                sql_comm.Parameters.Clear();
                sql_comm.CommandText = "hsp_ins_chapt_rgs";
                sql_comm.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
                sql_conn.Open();
                sql_comm.ExecuteNonQuery();
                sql_conn.Close();
                Lbmsg.Text = "  اطلاعات فصل با موفقّیّت ثبت شد  ";
                //////////////////////
                sql_comm.Parameters.Clear();
                sql_comm.CommandText = "hsp_upd_chapt_rgs_cnt";

                sql_comm.Parameters.AddWithValue("@chname", Txtfaslname.Text.Trim());
                sql_comm.Parameters.AddWithValue("@countsec", Txtbakhshnumber.Text);
                sql_comm.Parameters.AddWithValue("@link", Txtfasllink.Text);
                sql_comm.Parameters.AddWithValue("@countquiz", Txtquiznumber.Text);
                sql_conn.Open();
                sql_comm.ExecuteNonQuery();
                sql_conn.Close();
                Lbmsg.Text = "  اطلاعات فصل با موفقّیّت ثبت شد  ";

            }
            else
                Lbmsg.Text = "نام فصل برای این درس قبلا تعریف شده است.";
        }       
        catch (Exception exp)
        {
            sql_conn.Close();
            Lbmsg.Text ="خطا در انجام عملیات !";
        }
    }



    protected void lbtn_logoff_Click1(object sender, EventArgs e)
    {
        
        try
        {
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.CommandText = "sp_upd_tch_online2";
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
            Lbmsg.Text = "خطا در انجام عملیات !";
        }
    }
}
