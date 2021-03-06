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

public partial class TeacherCP : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    SqlDataReader sql_rd;
    DataSet ds = new DataSet();
    SqlDataAdapter da = new SqlDataAdapter();

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;

            da.SelectCommand = new SqlCommand();
            da.SelectCommand.Connection = sql_conn;
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            if (Session["owner"] == "teacher")
            {
                lblusr.Text = "نام کاربری :  " + Session["usr"].ToString();
                lbl_lst_log.Text = "آخرین ورود شما  :  " + Session["last_login"].ToString();
            }
            else
            {
                Response.Redirect("../TeacherER.aspx");
            }
            if (!IsPostBack)
            {
                da.SelectCommand.CommandText = "sp_sel_crs_for_tch";
                da.SelectCommand.Parameters.AddWithValue("@tchid", Session["usr"].ToString());

                sql_conn.Open();
                da.Fill(ds, "sel_crs");
                sql_conn.Close();


                drd_crs_sel.DataSource = ds;
                drd_crs_sel.DataMember = "sel_crs";
                drd_crs_sel.DataTextField = "crs_name";
                drd_crs_sel.DataValueField = "crs_id";
                drd_crs_sel.DataBind();
                ds.Clear();
                Session["crsid"] = drd_crs_sel.SelectedValue;
                Session["crsname"] = drd_crs_sel.SelectedItem.Text;
                
            }
        }
       catch(Exception exp)
       {
            sql_conn.Close();
           
        }
    }
    protected void txtrptst_TextChanged(object sender, EventArgs e)
    {

    }
    protected void lbtn_logout_Click(object sender, EventArgs e)
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
            Response.Redirect("../Login/Login.aspx");
        }
        catch (Exception exp)
        {
            sql_conn.Close();
          
        }
    }
    protected void drd_crs_sel_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["crsid"] = drd_crs_sel.SelectedValue;
        Session["crsname"] = drd_crs_sel.SelectedItem.Text;
    }
}
