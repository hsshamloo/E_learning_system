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

public partial class Edit_Course : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    SqlDataReader sql_dr;
    SqlCommand sql_comm = new SqlCommand();
    string str_conn;

    int i;
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

                    sql_adp.SelectCommand.CommandText = "sp_sel_tch";

                    sql_conn.Open();
                    sql_adp.Fill(ds, "tch_selected");
                    sql_conn.Close();

                    drdtch.DataSource = ds;
                    drdtch.DataMember = "tch_selected";
                    drdtch.DataValueField = "teacher_id";
                    drdtch.DataTextField = "name_teacher";
                    drdtch.DataBind();
                    ds.Clear();

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
                catch (Exception exp)
                {
                    sql_conn.Close();
                    lbl_er.Text = "خطا در انجام عملیات!";
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
            lbl_er.Text = "";
            sql_comm.CommandText = "sp_sel_crs2_op";
            sql_comm.Parameters.AddWithValue("@crsid", drdcrs_name.SelectedValue.Trim());

            sql_conn.Open();
            sql_dr = sql_comm.ExecuteReader();
            sql_dr.Read();

            bool sel = true;

            txt_min.Text = sql_dr["date_exam_min"].ToString().Trim();
            txt_trm.Text = sql_dr["date_exam_trm"].ToString().Trim();

            txtid.Text = sql_dr["crs_id"].ToString().Trim();
            txtname.Text = sql_dr["crs_name"].ToString().Trim();
            txtprice.Text = sql_dr["price"].ToString().Trim();
            txt_cntq_min.Text = sql_dr["cnt_qst_min"].ToString().Trim();
            txt_cntq_trm.Text = sql_dr["cnt_qst_trm"].ToString().Trim();
            txt_tch.Text = sql_dr["name_teacher"].ToString().Trim();
            txtunit.Text = sql_dr["unit"].ToString().Trim();
            txtcomment.Text = sql_dr["comment"].ToString().Trim();
            if (sql_dr["add_crs"].ToString() == "1")
            {
                rbl_add.Items[0].Selected = sel;
                rbl_add.Items[1].Selected = !sel;
            }
            else
            {
                rbl_add.Items[1].Selected = sel;
                rbl_add.Items[0].Selected = !sel;
            }


            sql_dr.Close();
            sql_conn.Close();

            sql_adp.SelectCommand.CommandText = "sp_sel_tch";

            sql_conn.Open();
            sql_adp.Fill(ds, "tch_selected");
            sql_conn.Close();

            drdtch.DataSource = ds;
            drdtch.DataMember = "tch_selected";
            drdtch.DataValueField = "teacher_id";
            drdtch.DataTextField = "name_teacher";
            drdtch.DataBind();
            ds.Clear();
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات!";
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
            sql_comm.CommandText = "sp_upd_crs";

            string dem = drdyearmin.Text + "/" + drdmonmin.Text + "/" + drddaymin.Text;
            string det = drdyeartrm.Text + "/" + drdmontrm.Text + "/" + drddaytrm.Text;

            sql_comm.Parameters.AddWithValue("@crsid", txtid.Text.Trim());
            sql_comm.Parameters.AddWithValue("@nam", txtname.Text.Trim());
            sql_comm.Parameters.AddWithValue("@unit", txtunit.Text.Trim());
            sql_comm.Parameters.AddWithValue("@price", txtprice.Text.Trim());
            sql_comm.Parameters.AddWithValue("@tchid", drdtch.SelectedValue);
            sql_comm.Parameters.AddWithValue("@comm", txtcomment.Text.Trim());
            sql_comm.Parameters.AddWithValue("@det", det);
            sql_comm.Parameters.AddWithValue("@dem", dem);
            sql_comm.Parameters.AddWithValue("@cqt", txt_cntq_trm.Text.Trim());
            sql_comm.Parameters.AddWithValue("@cqm", txt_cntq_min.Text.Trim());
            sql_comm.Parameters.AddWithValue("@addcrs", rbl_add.SelectedItem.Value.Trim());

            sql_conn.Open();
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();

            //*********************Refresh Data****************************

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
            rbl_add.ClearSelection();
            txt_cntq_min.Text = "";
            txt_cntq_trm.Text = "";
            txtid.Text = "";
            txtname.Text = "";
            txtprice.Text = "";
            txtcomment.Text = "";
            txtunit.Text = "";
            txt_tch.Text = "";
            txt_min.Text = "";
            txt_trm.Text = "";
            drdtch.Items.Clear();

            lbl_er.Text = "عملیات با موفقیت انجام شد!";
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات!";
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
            lbl_er.Text = "خطا در انجام عملیات!";
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
