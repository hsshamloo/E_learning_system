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
using PersianUtils;
using System.Data.SqlClient;


public partial class INDEX_ : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    SqlDataReader sql_rd;
    string str_conn;

    string date;

    protected void Page_Load(object sender, EventArgs e)
    {


        str_conn = ConfigurationManager.AppSettings.Get(0);
        sql_conn.ConnectionString = str_conn;
        sql_comm.Connection = sql_conn;

        CalendarUtils.SetCalendar();
        date = Calendar1.TodaysDate.Date.ToString();
        date = date.Substring(0, 10);
        Session["current_date"] = date;

        if (Session["owner"] == "super_manager" || Session["owner"] == "teacher" || Session["owner"] == "teacher")
        {
            lblusr.Text = " نام کاربری : " + Session["usr"].ToString();
            lbtn_logout.Visible = true;
        }
        else
        {
            lblusr.Text = "کاربر مهمان";
            lbtn_logout.Visible = false;
        }
        
    }
    protected void lbtn_logout_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["owner"] == "super_manager")
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
                Response.Redirect("index.aspx");
            }
            else if (Session["owner"] == "teacher")
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
                Response.Redirect("index.aspx");
            }
            else if (Session["owner"] == "student")
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
                Response.Redirect("index.aspx");
            }
            else
                lbtn_logout.Visible = false;

        }
        catch (Exception exp)
        {
            sql_conn.Close();
            
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager")
            Response.Redirect("controlpanel/ManagerCp.aspx");
        else if (Session["owner"] == "teacher")
            Response.Redirect("controlpanel/TeacherCp.aspx");
        else if (Session["owner"] == "student")
            Response.Redirect("controlpanel/StudentCp.aspx");
        else
            Response.Redirect("index.aspx");
    }
}
