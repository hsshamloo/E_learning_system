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

public partial class Learn_Course : System.Web.UI.Page
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
                lbl_crs.Text = Session["crsname"].ToString();
                

                if(Request.QueryString["namechapter"] != null)
                {
                    Session["chname"] = Request.QueryString["namechapter"];
                    lbl_ch.Text = Session["chname"].ToString();
                    Session["ch_id"] = Request.QueryString["id"];
                }
                lbl_ch.Text = Session["chname"].ToString();
                

                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_comm.Connection = sql_conn;
                sql_da.SelectCommand = new SqlCommand();
                sql_da.SelectCommand.Connection = sql_conn;
                sql_da.SelectCommand.CommandType = CommandType.StoredProcedure;

                
                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_sel_qz_for_std";
                sql_da.SelectCommand.Parameters.AddWithValue("@chid", Session["ch_id"].ToString());
                sql_da.SelectCommand.Parameters.AddWithValue("@usr", Session["usr"].ToString());

                sql_conn.Open();
                sql_da.Fill(ds, "sec_qz_g");
                sql_conn.Close();

                if(ds.Tables["sec_qz_g"].Rows.Count != 0)
                    lbl_quiz.Text = ds.Tables["sec_qz_g"].Rows[0].ItemArray[0].ToString();

                if (Request.QueryString["id"] != null)
                {
                    sql_da.SelectCommand.Parameters.Clear();
                    sql_da.SelectCommand.CommandText = "sp_sel_sec";
                    sql_da.SelectCommand.Parameters.AddWithValue("@chid", Request.QueryString["id"]);

                    sql_conn.Open();
                    sql_da.Fill(ds, "sec_selected");
                    sql_conn.Close();

                    grd_sec.DataSource = ds;
                    grd_sec.DataMember = "sec_selected";
                    grd_sec.DataBind();
                    ds.Clear();
                    Session["ch_id"] = Request.QueryString["id"];
                }
                else
                {
                    sql_da.SelectCommand.Parameters.Clear();
                    sql_da.SelectCommand.CommandText = "sp_sel_sec";
                    sql_da.SelectCommand.Parameters.AddWithValue("@chid", Session["ch_id"].ToString());

                    sql_conn.Open();
                    sql_da.Fill(ds, "sec_selected");
                    sql_conn.Close();

                    grd_sec.DataSource = ds;
                    grd_sec.DataMember = "sec_selected";
                    grd_sec.DataBind();
                    ds.Clear();
                }
                

                if (Request.QueryString["id_sec"] != null)
                {
                    sql_da.SelectCommand.Parameters.Clear();
                    sql_da.SelectCommand.CommandText = "sp_sel_cnt";
                    sql_da.SelectCommand.Parameters.AddWithValue("@ch_id", Session["ch_id"]);
                    sql_da.SelectCommand.Parameters.AddWithValue("@sec_count", Request.QueryString["id_sec"]);

                    sql_conn.Open();
                    sql_da.Fill(ds, "cnt_selected");
                    sql_conn.Close();

                    txt_cnt.Text = ds.Tables["cnt_selected"].Rows[0].ItemArray.GetValue(3).ToString();
                    lbl_sec.Text = ds.Tables["cnt_selected"].Rows[0].ItemArray.GetValue(2).ToString();

                    ds.Clear();
                }
            }
            catch
            {
                sql_conn.Close();
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
            Response.Redirect("../logout.aspx");
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            Response.Write(exp.Message);
        }
    }
}
