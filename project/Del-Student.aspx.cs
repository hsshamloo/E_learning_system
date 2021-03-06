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

public partial class Del_Student : System.Web.UI.Page
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

                    sql_adp.SelectCommand.CommandText = "sp_sel_std";

                    sql_conn.Open();
                    sql_adp.Fill(ds, "std_selected");
                    sql_conn.Close();

                    drdstd.DataSource = ds;
                    drdstd.DataMember = "std_selected";
                    drdstd.DataValueField = "usr";
                    drdstd.DataTextField = "usr";
                    drdstd.DataBind();
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
    protected void btn_srch_Click(object sender, EventArgs e)
    {
        try
        {

            sql_comm.CommandText = "sp_sel_std_op";
            sql_comm.Parameters.AddWithValue("@usr", drdstd.SelectedValue.Trim());

            sql_conn.Open();
            sql_dr = sql_comm.ExecuteReader();
            sql_dr.Read();

            txtname.Text = sql_dr["f_name"].ToString().Trim();
            txtfamily.Text = sql_dr["l_name"].ToString().Trim();
            txtp_id.Text = sql_dr["p_id"].ToString().Trim();
            txt_father.Text = sql_dr["father_name"].ToString().Trim();
            txtbd.Text = sql_dr["birth_day"].ToString().Trim();
            txtbm.Text = sql_dr["birth_month"].ToString().Trim();
            txtby.Text = sql_dr["birth_year"].ToString().Trim();
            txttel.Text = sql_dr["tel"].ToString().Trim();
            txtemail.Text = sql_dr["email"].ToString().Trim();
            txtusr.Text = sql_dr["usr"].ToString().Trim();
            
            sql_dr.Close();
            sql_conn.Close();
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void btnnext_Click(object sender, EventArgs e)
    {
        if (txtusr.Text == "")
        {
            lbl_er.Text = "ابتدا جستجو کنید!";
        }
        else
        try
        {

            sql_comm.CommandText = "sp_del_std";

            sql_comm.Parameters.AddWithValue("@usr", txtusr.Text.Trim());

            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();

            //***********Refresh Data*********************************************

            

                sql_adp.SelectCommand.CommandText = "sp_sel_std";

                sql_conn.Open();
                sql_adp.Fill(ds, "std_selected");
                sql_conn.Close();

                drdstd.DataSource = ds;
                drdstd.DataMember = "std_selected";
                drdstd.DataValueField = "usr";
                drdstd.DataTextField = "usr";
                drdstd.DataBind();
                ds.Clear();
           
            
            txt_father.Text = "";
            txtbd.Text = "";
            txtemail.Text = "";
            txtbm.Text = "";
            txtname.Text = "";
            txttel.Text = "";
            txtby.Text = "";
            txtfamily.Text = "";
            txtp_id.Text = "";
            txtusr.Text = "";
            lbl_er.Text = "عملیات با موفقیت انجام شد.";
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void lbtn_logoff_Click(object sender, EventArgs e)
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
