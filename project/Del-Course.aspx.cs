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

public partial class Del_Course : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    SqlDataReader sql_dr;
    SqlCommand sql_comm = new SqlCommand();
    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager")
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_adp.SelectCommand = new SqlCommand();
            sql_adp.SelectCommand.Connection = sql_conn;
            sql_comm.Connection = sql_conn;
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_adp.SelectCommand.CommandType = CommandType.StoredProcedure;

            if (!IsPostBack)
            {
                try
                {

                    sql_adp.SelectCommand.CommandText = "sp_sel_crs2";

                    sql_conn.Open();
                    sql_adp.Fill(ds, "crs_selected");
                    sql_conn.Close();

                    drdcrs_name.DataSource = ds;
                    drdcrs_name.DataMember = "crs_selected";
                    drdcrs_name.DataValueField = "crs_id";
                    drdcrs_name.DataTextField = "crs_name";
                    drdcrs_name.DataBind();
                    ds.Clear();
                }
                catch (Exception exp)
                {
                    sql_conn.Close();
                    lbl_er.Text = "خطا در انجام عملیات !";
                }
            }
        }

        else
        {
            Response.Redirect("managerER.aspx");
        }
    }
    
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        if (txtid.Text == "")
        {
            lbl_er.Text = "ابتدا جستجو کنید!";
        }
        else

        try
        {
           
            sql_comm.CommandText = "sp_del_crs";

            sql_comm.Parameters.AddWithValue("@crsid", txtid.Text.Trim());

            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();

            //***********Refresh Data*********************************************

       
            sql_adp.SelectCommand.CommandText = "sp_sel_crs2";

            sql_conn.Open();
            sql_adp.Fill(ds, "crs_selected");
            sql_conn.Close();

            drdcrs_name.DataSource = ds;
            drdcrs_name.DataMember = "crs_selected";
            drdcrs_name.DataValueField = "crs_id";
            drdcrs_name.DataTextField = "crs_name";
            drdcrs_name.DataBind();
            ds.Clear();
            txt_addcrs.Text = "";
            txt_cntq_min.Text = "";
            txt_cntq_trm.Text = "";
            txtid.Text = "";
            txtname.Text = "";
            txtprice.Text = "";
            txt_date_trm.Text = "";
            txt_date_min.Text = "";
            txtcomment.Text = "";
            txtunit.Text = "";
            txt_tchname.Text = "";

            lbl_er.Text = "عملیات با موفقیت انجام شد.";
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void btn_srch_Click(object sender, EventArgs e)
    {
        try
        {
            lbl_er.Text = "";
            sql_comm.CommandText = "sp_sel_crs2_op";
            sql_comm.Parameters.AddWithValue("@crsid", drdcrs_name.SelectedValue.Trim());

            sql_conn.Open();
            sql_dr = sql_comm.ExecuteReader();
            sql_dr.Read();

            string Sel = sql_dr["add_crs"].ToString().Trim();

            txtid.Text = sql_dr["crs_id"].ToString().Trim();
            txtname.Text = sql_dr["crs_name"].ToString().Trim();
            txtprice.Text = sql_dr["price"].ToString().Trim();
            txt_cntq_min.Text = sql_dr["cnt_qst_min"].ToString().Trim();
            txt_cntq_trm.Text = sql_dr["cnt_qst_trm"].ToString().Trim();
            txt_date_min.Text = sql_dr["date_exam_min"].ToString().Trim();
            txt_date_trm.Text = sql_dr["date_exam_trm"].ToString().Trim();
            txt_tchname.Text = sql_dr["name_teacher"].ToString().Trim();
            txtunit.Text = sql_dr["unit"].ToString().Trim();
            txtcomment.Text = sql_dr["comment"].ToString().Trim();

            if (Sel == "1")
            {
                txt_addcrs.Text = "بلی";
            }
            else
            {
                txt_addcrs.Text = "خیر";
            }
            sql_dr.Close();
            sql_conn.Close();
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void btn_cnl_Click(object sender, EventArgs e)
    {

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
