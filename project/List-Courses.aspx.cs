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

public partial class List_Course : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    SqlCommand sql_comm = new SqlCommand();

    string str_conn;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager")
        {
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_adp.SelectCommand = new SqlCommand();
                sql_adp.SelectCommand.Connection = sql_conn;
                sql_comm.Connection = sql_conn;

                sql_adp.SelectCommand.CommandType = CommandType.StoredProcedure;
                sql_adp.SelectCommand.CommandText = "sp_sel_crs3";

                sql_conn.Open();
                sql_adp.Fill(ds, "selected_crs");
                sql_conn.Close();

                grd_crs.DataSource = ds;
                grd_crs.DataMember = "selected_crs";
                grd_crs.DataBind();
                if (ds.Tables[0].Rows.Count == 0)
                {
                    lbl_er.Text = "هیچ اطلاعاتی یافت نشد.";
                }
                ds.Clear();
            }
            catch (Exception exp)
            {
                sql_conn.Close();
                lbl_er.Text = "خطا در انجام عملیات !";
            }
        }
        else
        {
            Response.Redirect("managerER.aspx");
        }
    }
    protected void lbtn_logoff_Click1(object sender, EventArgs e)
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
