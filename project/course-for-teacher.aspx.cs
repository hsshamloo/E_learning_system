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

public partial class course_for_teacher : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    SqlDataReader sql_rd;
    DataSet ds = new DataSet();
    SqlDataAdapter da = new SqlDataAdapter();
    SqlDataAdapter da2 = new SqlDataAdapter();

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "teacher")
        {
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_comm.Connection = sql_conn;
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = sql_conn;
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                    da.SelectCommand.CommandText = "sp_sel_crs_for_tch";
                    da.SelectCommand.Parameters.AddWithValue("@tchid", Session["usr"].ToString());

                    sql_conn.Open();
                    da.Fill(ds, "sel_crs");
                    sql_conn.Close();

                    grd_crs.DataSource = ds;
                    grd_crs.DataBind();
                    if (grd_crs.Rows.Count == 0)
                        lbl_er.Text = "هیچ اطلاعاتی یافت نشد.";
                    da.SelectCommand.Parameters.Clear();


                    if (Request.QueryString["id"] != null)
                {
                    da.SelectCommand.CommandText = "sp_sel_std_for_crs";
                    da.SelectCommand.Parameters.AddWithValue("@crs_id", Request.QueryString["id"]);

                    sql_conn.Open();
                    da.Fill(ds, "selected_std");
                    sql_conn.Close();

                    grd_std.DataSource = ds;
                    grd_std.DataMember = "selected_std";
                    grd_std.DataBind();

                    if (grd_std.Rows.Count == 0)
                        lbl_er.Text = "هیچ اطلاعاتی یافت نشد.";
                    da.SelectCommand.Parameters.Clear();
                }
            }
            catch (Exception exp)
            {
                sql_conn.Close();
                lbl_er.Text = "خطا در انجام عملیات !";
            }
        }
        else
        {
            Response.Redirect("teacherER.aspx");
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
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
}
