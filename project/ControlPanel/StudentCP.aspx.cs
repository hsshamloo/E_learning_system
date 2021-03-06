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
    DataSet ds = new DataSet();
    SqlDataAdapter sql_da = new SqlDataAdapter();

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["owner"] == "student")
      {
        try
        {
            Session["no_ref"] = "0";
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;
            sql_da.SelectCommand = new SqlCommand();
            sql_da.SelectCommand.Connection = sql_conn;
            sql_da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (!IsPostBack)
            {
                sql_da.SelectCommand.CommandText = "sp_sel_crs_std";
                sql_da.SelectCommand.Parameters.AddWithValue("@usr", Session["usr"].ToString());

                sql_conn.Open();
                sql_da.Fill(ds, "crs_selected");
                sql_conn.Close();

                drd_crs.DataSource = ds;
                drd_crs.DataMember = "crs_selected";
                drd_crs.DataTextField = "crs_name";
                drd_crs.DataValueField = "crs_id";
                drd_crs.DataBind();
                ds.Clear();

                Session["crsname"] = drd_crs.SelectedItem.Text;
                Session["crsid"] = drd_crs.SelectedValue;
            }
            
        }
        catch
        {
        }
            lblusr.Text = "نام کاربری :" + Session["usr"].ToString();
            lbl_lst_log.Text = "آخرین ورود شما :" + Session["last_login"].ToString();
      }
        else
        {
            Response.Redirect("../studentER.aspx"); 
        }
    }
    protected void lbtn_logout_Click(object sender, EventArgs e)
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
            Response.Redirect("../Login/Login.aspx");
        }
        catch(Exception exp)
        {
            sql_conn.Close();
            Response.Write(exp.Message);
        }
        
    }
    protected void drd_crs_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["crsname"] = drd_crs.SelectedItem.Text;
        Session["crsid"] = drd_crs.SelectedValue;
    }
}
