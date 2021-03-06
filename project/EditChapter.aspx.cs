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

public partial class EditChapter : System.Web.UI.Page
{
    SqlCommand sql_comm = new SqlCommand();
    DataSet ds = new DataSet();
    SqlConnection sql_conn = new SqlConnection();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        //////////////////////////////////////////////////////////////////////////
        if (Session["owner"] == "teacher")
        {
            if (!IsPostBack)
            {
                try
                {
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
                    sql_adp.Fill(ds, "t1");
                    sql_conn.Close();        
                    drdfasl.Items.Clear();
                    drdfasl.DataSource = ds;
                    drdfasl.DataTextField = "ch_name";
                    drdfasl.DataValueField = "ch_id";
                    drdfasl.DataBind();
                    if (drdfasl.Items.Count > 0)
                    {
                        Txtfaslname.Text = ds.Tables["t1"].Rows[drdfasl.SelectedIndex].ItemArray[0].ToString().Trim();
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
                    ds.Clear();
                }
                catch (Exception exp)
                {
                    lb_er.Text = "خطا در انجام عملیات !";
                }
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
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_comm.Parameters.Clear();
            sql_conn.ConnectionString = str_conn;
             sql_comm.Connection = sql_conn;
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
            lb_er.Text = exp.Message;//"خطا در انجام عملیات !";
        }
    }
    protected void btnregester_Click(object sender, EventArgs e)
    {
        try
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;
            sql_comm.CommandType = CommandType.StoredProcedure;                
            sql_comm.Parameters.Clear();
            sql_comm.CommandText = "hsp_sel_dup_chapter";
            sql_comm.Parameters.AddWithValue("@chname", Txtfaslname.Text.Trim());
            sql_comm.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
            sql_comm.Parameters.AddWithValue("@chid", drdfasl.SelectedValue);
            SqlDataReader dr;

            sql_conn.Open();
            dr = sql_comm.ExecuteReader();
            dr.Read();
            int cnt = Convert.ToInt32(dr["cnt"]);
            dr.Read();
            sql_conn.Close();

            if (cnt == 0)
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_comm.Connection = sql_conn;
                sql_comm.CommandType = CommandType.StoredProcedure;
                sql_comm.Parameters.Clear();
                sql_comm.Parameters.AddWithValue("@chid",drdfasl.SelectedValue );
                sql_comm.Parameters.AddWithValue("@chname",Txtfaslname.Text.Trim());
                sql_comm.Parameters.AddWithValue("@countsec", Txtbakhshnumber.Text);
                sql_comm.Parameters.AddWithValue("@link", Txtfasllink.Text.Trim());
                sql_comm.Parameters.AddWithValue("@countquiz", Txtkoeznumber.Text);
                sql_comm.CommandText = "hsp_upd_chap";

                sql_conn.Open();
                sql_comm.ExecuteNonQuery();
                sql_conn.Close();
                lb_er.Text = "عملیات با موفقیت انجام شد.";

                sql_comm.Parameters.Clear();
                sql_comm.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
                sql_comm.CommandText = "hsp_srch_chap";
                sql_adp.SelectCommand = sql_comm;
                sql_conn.Open();
                sql_adp.Fill(ds, "t1");
                sql_conn.Close();
                drdfasl.Items.Clear();
                drdfasl.DataSource = ds;
                drdfasl.DataTextField = "ch_name";
                drdfasl.DataValueField = "ch_id";
                drdfasl.DataBind();
                if (drdfasl.Items.Count > 0)
                {
                    Txtfaslname.Text = ds.Tables["t1"].Rows[drdfasl.SelectedIndex].ItemArray[0].ToString().Trim();
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
                ds.Clear();
               
                ds.Clear();
                


            }
            else
                lb_er.Text = "نام فصل برای این درس قبلا تعریف شده است.";          
        }        
        catch (Exception exp)
        {
            sql_conn.Close();
            lb_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void drdfasl_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;
            sql_comm.CommandType = CommandType.StoredProcedure;
            ds.Clear();
            sql_comm.Parameters.Clear();
            Txtdarcname.Text = Session["crsname"].ToString();
            sql_comm.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
            sql_comm.CommandText = "hsp_srch_chap";
            sql_adp.SelectCommand = sql_comm;
            sql_conn.Open();
            sql_adp.Fill(ds, "t1");
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
                Txtfaslname.Text = ds.Tables["t1"].Rows[drdfasl.SelectedIndex].ItemArray[0].ToString().Trim();
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
            lb_er.Text = "خطا در انجام عملیات !";
        }

    }
}
