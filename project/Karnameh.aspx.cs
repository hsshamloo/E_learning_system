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

public partial class Karnameh : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlDataAdapter sql_da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    SqlCommand sql_comm = new SqlCommand();

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "student")
        {
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_da.SelectCommand = new SqlCommand();
                sql_da.SelectCommand.Connection = sql_conn;
                sql_da.SelectCommand.CommandType = CommandType.StoredProcedure;

                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "hsp_kar";
                sql_da.SelectCommand.Parameters.AddWithValue("@usr", Session["usr"].ToString());

                sql_conn.Open();
                sql_da.Fill(ds, "sel_kar");
                sql_conn.Close();


                GridView1.DataSource = ds;
                GridView1.DataMember = "sel_kar";
                GridView1.DataBind();

            }
            catch
            {
            }
            
        }
        else
        {
            Response.Redirect("studentER.aspx");
        }
    }
    protected void lbtn_logoff_Click(object sender, EventArgs e)
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
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
}
