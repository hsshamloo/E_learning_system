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

public partial class Edit_Teacher : System.Web.UI.Page
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
                    sql_adp.SelectCommand.CommandText = "sp_sel_tch";

                    sql_conn.Open();
                    sql_adp.Fill(ds, "tch_selected");
                    sql_conn.Close();

                    drdtch_name.DataSource = ds;
                    drdtch_name.DataMember = "tch_selected";
                    drdtch_name.DataValueField = "teacher_id";
                    drdtch_name.DataTextField = "name_teacher";
                    drdtch_name.DataBind();
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
            sql_comm.CommandText = "sp_sel_tch_op";
            sql_comm.Parameters.AddWithValue("@tchid", drdtch_name.SelectedValue.Trim());

            sql_conn.Open();
            sql_dr = sql_comm.ExecuteReader();
            sql_dr.Read();

            txtid.Text = sql_dr["teacher_id"].ToString().Trim();
            txtname.Text = sql_dr["name_teacher"].ToString().Trim();
            txtpwd.Text = sql_dr["pwd"].ToString().Trim();
            lbledu.Text = sql_dr["education"].ToString().Trim();
            txtage.Text = sql_dr["age"].ToString().Trim();
            txttel.Text = sql_dr["tel"].ToString().Trim();
            txtemail.Text = sql_dr["email"].ToString().Trim();
            txtaddr.Text = sql_dr["addr_living"].ToString().Trim();
            

            sql_dr.Close();
            sql_conn.Close();
            lbl_er.Text = "";
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        if (txtid.Text == "")
        {
            lbl_er.Text = "ابتدا جستجو کنید !";
        }
        else
        try
        {
            sql_comm.CommandText = "sp_upd_tch";

            sql_comm.Parameters.AddWithValue("@tchid", drdtch_name.SelectedValue.Trim());
            sql_comm.Parameters.AddWithValue("@nam", txtname.Text.Trim());
            sql_comm.Parameters.AddWithValue("@tel", txttel.Text.Trim());
            sql_comm.Parameters.AddWithValue("@email", txtemail.Text.Trim());
            sql_comm.Parameters.AddWithValue("@age", txtage.Text.Trim());
            sql_comm.Parameters.AddWithValue("@edu", drd_edu.Text.Trim());
            sql_comm.Parameters.AddWithValue("@addr", txtaddr.Text.Trim());
            sql_comm.Parameters.AddWithValue("@pwd", txtpwd.Text.Trim());

            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();

            //***********Refresh Data*********************************************

            sql_adp.SelectCommand.CommandText = "sp_sel_tch";

            sql_conn.Open();
            sql_adp.Fill(ds, "tch_selected");
            sql_conn.Close();

            drdtch_name.DataSource = ds;
            drdtch_name.DataMember = "tch_selected";
            drdtch_name.DataValueField = "teacher_id";
            drdtch_name.DataTextField = "name_teacher";
            drdtch_name.DataBind();
            ds.Clear();
            txtaddr.Text = "";
            txtage.Text = "";
            txtemail.Text = "";
            txtid.Text = "";
            txtname.Text = "";
            txtpwd.Text = "";
            txttel.Text = "";
            lbledu.Text = "";

            lbl_er.Text = "عملیات با موفقیت انجام شد!";
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
