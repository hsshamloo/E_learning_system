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

public partial class RegisterT : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    SqlDataReader sql_rd;

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["status"] == "reg_comp")
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;

            lbl_id.Text = Session["usr"].ToString();
            lbl_pid.Text = Session["pid"].ToString();
            lbl_price.Text = Session["full_payment"].ToString();
        }
        else
        {
            lbl_er.Text = "عملیات با خطا مواجه شد.";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
            try
            {
                sql_conn.Open();
                sql_comm.CommandType = CommandType.StoredProcedure;
                sql_comm.CommandText = "sp_ins_std_rgs";

                sql_comm.Parameters.AddWithValue("@usrid", Session["usr"]);
                sql_comm.Parameters.AddWithValue("@pwd", Session["pwd"]);
                sql_comm.Parameters.AddWithValue("@fnam", Session["fname"]);
                sql_comm.Parameters.AddWithValue("@lnam", Session["lname"]);
                sql_comm.Parameters.AddWithValue("@bty", Session["bty"]);
                sql_comm.Parameters.AddWithValue("@btm", Session["btm"]);
                sql_comm.Parameters.AddWithValue("@btd", Session["btd"]);
                sql_comm.Parameters.AddWithValue("@email", Session["email"]);
                sql_comm.Parameters.AddWithValue("@tel", Session["tel"]);
                sql_comm.Parameters.AddWithValue("@fthnam", Session["fthnam"]);

                sql_comm.ExecuteNonQuery();
                sql_comm.Parameters.Clear();
                sql_conn.Close();

                /////////////////////////////////////////

                sql_comm.CommandText = "sp_ins_pid_rgs";

                sql_comm.Parameters.AddWithValue("@usrid", Session["usr"]);
                sql_comm.Parameters.AddWithValue("@pid", Session["pid"]);
                
                sql_conn.Open();
                sql_comm.ExecuteNonQuery();
                sql_comm.Parameters.Clear();
                sql_conn.Close();

                /////////////////////////////////////////

                int i = 0;

                sql_comm.CommandText = "sp_ins_crs_selected";

                for (i = 1; i <= (int)Session["cnt_crs_selected"]; i++)
                {
                
                    sql_comm.Parameters.AddWithValue("@usrid", Session["usr"]);
                    sql_comm.Parameters.AddWithValue("@crsid", Session["crs_selected_id" + i.ToString()]);
                    sql_comm.Parameters.AddWithValue("@trm", "0");

                    sql_conn.Open();
                    sql_comm.ExecuteNonQuery();
                    sql_comm.Parameters.Clear();
                    sql_conn.Close();
                }

                Session.Abandon();
                lbl_er.Text = "عملیات با موفقیت انجام شد...<br>تا 24 ساعت آینده مدیر سایت اطلاعات شما را تایید خواهد کرد<br>بعد شما میتوانید به سیستم وارد شوید.";
            }
            catch(Exception exp)
            {
                Session.Abandon();
                sql_conn.Close();
                lbl_er.Text = "عملیات با خطا مواجه شد.";
            }
        }
    public void Page_Unload(object sender, EventArgs e)
    {
        
    }
        
}
