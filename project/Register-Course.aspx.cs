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

public partial class Register_course : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();

    string str_conn;

    int i;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager")
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_comm.Connection = sql_conn;

            sql_adp.SelectCommand = new SqlCommand();
            sql_adp.SelectCommand.Connection = sql_conn;
            try
            {
                sql_adp.SelectCommand.CommandType = CommandType.StoredProcedure;
                sql_adp.SelectCommand.CommandText = "sp_sel_tch";

                if (!IsPostBack)
                {
                    sql_conn.Open();
                    sql_adp.Fill(ds, "selected_tch");
                    sql_conn.Close();
                    drdtch.DataSource = ds;
                    drdtch.DataMember = "selected_tch";
                    drdtch.DataTextField = "name_teacher";
                    drdtch.DataValueField = "teacher_id";
                    drdtch.DataBind();
                    
                

                drddaymin.Items.Clear();
                drddaytrm.Items.Clear();
                drdmonmin.Items.Clear();
                drdmontrm.Items.Clear();
                drdyearmin.Items.Clear();
                drdyeartrm.Items.Clear();

                for (i = 86; i <= 87; i++)
                {
                    drdyearmin.Items.Add("13" + i.ToString());
                    drdyeartrm.Items.Add("13" + i.ToString());
                }
                    
                for (i = 1; i <= 12; i++)
                {
                    drdmonmin.Items.Add(i.ToString());
                    drdmontrm.Items.Add(i.ToString());
                }

                for (i = 1; i <= 31; i++)
                {
                    drddaymin.Items.Add(i.ToString());
                    drddaytrm.Items.Add(i.ToString());
                }
                }
            }
            catch(Exception exp)
            {
                sql_conn.Close();
                lbl_er.Text = exp.Message;
            }
        }
        else
        {
            Response.Redirect("ManagerER.aspx");
        }
    }
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        String dem, det;

        dem = drdyearmin.Text + "/" + drdmonmin.Text + "/" + drddaymin.Text;
        det = drdyeartrm.Text + "/" + drdmontrm.Text + "/" + drddaytrm.Text;

        try
        {
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.CommandText = "sp_ins_crs_rgs";

            sql_comm.Parameters.AddWithValue("@crsid", txtid.Text.Trim());
            sql_comm.Parameters.AddWithValue("@nam", txtname.Text.Trim());
            sql_comm.Parameters.AddWithValue("@unit", txtunit.Text.Trim());
            sql_comm.Parameters.AddWithValue("@price", txtprice.Text.Trim());
            sql_comm.Parameters.AddWithValue("@tech", drdtch.Text.Trim());
            sql_comm.Parameters.AddWithValue("@comm", txtprice.Text.Trim());
            sql_comm.Parameters.AddWithValue("@dem", dem.Trim());
            sql_comm.Parameters.AddWithValue("@det", det.Trim());
            sql_comm.Parameters.AddWithValue("@cqm", txt_cntq_min.Text.Trim());
            sql_comm.Parameters.AddWithValue("@cqt", txt_cntq_trm.Text.Trim());
            if (rbl_add.Items[0].Selected)
                sql_comm.Parameters.AddWithValue("@crsadd","1" );
            else
                sql_comm.Parameters.AddWithValue("@crsadd","0");
       
            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();
            lbl_er.Text = "عملیات با موفقیت انجام شد.";

            txtid.Text = "";
            txtname.Text = "";
            txtunit.Text = "";
            txtprice.Text = "";
            txtprice.Text = "";
            txt_cntq_min.Text = "";
            txt_cntq_trm.Text = "";
        }
        catch (SqlException sexp)
        {
            sql_conn.Close();
            if (sexp.ErrorCode == -2146232060)
                lbl_er.Text = "کد استاد تکراری است";
            else lbl_er.Text = "خطا در ثبت عملیات.";
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
            lbl_er.Text = exp.Message;
        }
    }
    protected void drdmonmin_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i;
        if (Convert.ToInt32(drdmonmin.SelectedItem.Text) <= 6)
        {
            drddaymin.Items.Clear();
            for (i = 1; i <= 31; i++)
                drddaymin.Items.Add(i.ToString());
        }
        else if (Convert.ToInt32(drdmonmin.SelectedItem.Text) > 6 && Convert.ToInt32(drdmonmin.SelectedItem.Text) <= 11)
        {
            drddaymin.Items.Clear();
            for (i = 1; i <= 30; i++)
                drddaymin.Items.Add(i.ToString());
        }
        else
        {
            drddaymin.Items.Clear();
            for (i = 1; i <= 29; i++)
                drddaymin.Items.Add(i.ToString());
        }
    }
    protected void drdmontrm_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i;
        if (Convert.ToInt32(drdmontrm.SelectedItem.Text) <= 6)
        {
            drddaytrm.Items.Clear();
            for (i = 1; i <= 31; i++)
                drddaytrm.Items.Add(i.ToString());
        }
        else if (Convert.ToInt32(drdmontrm.SelectedItem.Text) > 6 && Convert.ToInt32(drdmontrm.SelectedItem.Text) <= 11)
        {
            drddaytrm.Items.Clear();
            for (i = 1; i <= 30; i++)
                drddaytrm.Items.Add(i.ToString());
        }
        else
        {
            drddaytrm.Items.Clear();
            for (i = 1; i <= 29; i++)
                drddaytrm.Items.Add(i.ToString());
        }
    }
}
