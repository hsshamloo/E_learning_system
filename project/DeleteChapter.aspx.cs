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

public partial class DeleteChapter : System.Web.UI.Page
{
    SqlCommand sql_comm = new SqlCommand();
    DataSet ds = new DataSet();
    SqlConnection sql_conn = new SqlConnection();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    string str_conn;


    protected void Page_Load(object sender, EventArgs e)
    {
        ////////////////////////////////////////////////////

        if (Session["owner"] == "teacher")
        {
          try
          {
              sql_comm.Parameters.Clear();
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;
            sql_comm.CommandType = CommandType.StoredProcedure;            
            ds.Clear();            
            Txtdarcname.Text = Session["crsname"].ToString();
            sql_comm.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
            sql_comm.CommandText = "hsp_srch_chap";
            sql_adp.SelectCommand = sql_comm;
            sql_conn.Open();
            sql_adp.Fill(ds,"t1");
            sql_conn.Close();
            if (!IsPostBack)
            {
                drdfasl.Items.Clear();
                drdfasl.DataSource = ds;
                drdfasl.DataTextField = "ch_name";
                drdfasl.DataValueField = "ch_id";
                drdfasl.DataBind();
            }
            if (drdfasl.Items.Count > 0)
            {
                Txtbakhshnumber.Text = ds.Tables["t1"].Rows[drdfasl.SelectedIndex].ItemArray[1].ToString().Trim();
                Txtfasllink.Text = ds.Tables["t1"].Rows[drdfasl.SelectedIndex].ItemArray[2].ToString().Trim();
                Txtkoeznumber.Text = ds.Tables["t1"].Rows[drdfasl.SelectedIndex].ItemArray[3].ToString().Trim();                
            }
            else
            {
                Txtbakhshnumber.Text = "";
                Txtfasllink.Text = "";
                Txtkoeznumber.Text = "";
                btnregester.Enabled = false;
            }
          }
          catch (Exception exp)
          {
            lb_er.Text= "خطا در انجام عملیات !";
          }
        }
        else
        {
            Response.Redirect("teacherER.aspx");
        } 
    }
   
    protected void drdfasl_SelectedIndexChanged(object sender, EventArgs e)
    {    
    }
    protected void lbtn_logoff_Click1(object sender, EventArgs e)
    {
       // try
        {
            sql_comm.Parameters.Clear();
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
       // catch (Exception exp)
        {
         //   sql_conn.Close();
           // lb_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void btnregester_Click(object sender, EventArgs e)
    {
        try 
        {
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.Parameters.Clear();
            sql_comm.CommandText = "hsp_del_chap";
            sql_comm.Parameters.AddWithValue("@chid",drdfasl.SelectedItem.Value);
            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();
            lb_er.Text = "عملیات با موفقیت انجام شد.";
            sql_comm.Parameters.Clear();
            sql_comm.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
            sql_comm.CommandText = "hsp_srch_chap";
            sql_adp.SelectCommand = sql_comm;
            ds.Clear();
            sql_conn.Open();
            sql_adp.Fill(ds, "t1");
            sql_conn.Close();
            drdfasl.Items.Clear();
            drdfasl.DataSource = ds;
            drdfasl.DataTextField = "ch_name";
            drdfasl.DataBind();
            if (drdfasl.Items.Count > 0)
            {
                Txtbakhshnumber.Text = ds.Tables["t1"].Rows[0].ItemArray[1].ToString().Trim();
                Txtfasllink.Text = ds.Tables["t1"].Rows[0].ItemArray[2].ToString().Trim();
                Txtkoeznumber.Text = ds.Tables["t1"].Rows[0].ItemArray[3].ToString().Trim();
            }
            else
            {
                Txtbakhshnumber.Text = "";
                Txtfasllink.Text = "";
                Txtkoeznumber.Text = "";
                btnregester.Enabled = false;
            }                
        }
       catch(Exception exp)
       {
           lb_er.Text ="خطا در انجام عملیات !";
       }   
                
    }
}
