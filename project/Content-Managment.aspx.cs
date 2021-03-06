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

public partial class Content_Managment : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_da = new SqlDataAdapter();
    SqlCommand sql_comm = new SqlCommand();

    string str_conn;
    int r;
    int[] cnt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "teacher")
        {
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_da.SelectCommand = new SqlCommand();
                sql_da.SelectCommand.Connection = sql_conn;
                sql_da.SelectCommand.CommandType = CommandType.StoredProcedure;
                sql_comm.Connection = sql_conn;

                sql_da.SelectCommand.CommandText = "sp_sel_chapter";
                sql_da.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());

                sql_conn.Open();
                sql_da.Fill(ds, "sel_chapter");
                sql_conn.Close();

                r = ds.Tables[0].Rows.Count;
                cnt = new int[r];
                for (int i = 0; i <= r - 1; i++)
                    cnt[i] = Convert.ToInt32(ds.Tables[0].Rows[i].ItemArray.GetValue(4).ToString());

                if (!IsPostBack)
                {
                    drd_chapter.DataSource = ds;
                    drd_chapter.DataMember = "sel_chapter";
                    drd_chapter.DataTextField = "ch_name";
                    drd_chapter.DataValueField = "ch_id";
                    drd_chapter.DataBind();
                
                
                drd_sec.Items.Clear();
                
                
                for (int i = 1; i <= cnt[0]; i++)
                    drd_sec.Items.Add(i.ToString());
                ds.Clear();

                }


            }
            catch (Exception exp)
            {
                sql_conn.Close();
                lbl_er.Text = "خطا در انجام عملیات.";
            }
        }
        else
        {
            Response.Redirect("teacherER.aspx");
        }
        
    }
    protected void drd_chapter_SelectedIndexChanged(object sender, EventArgs e)
    {
        drd_sec.Items.Clear();
        for (int i = 1; i <= cnt[drd_chapter.SelectedIndex]; i++)
            drd_sec.Items.Add(i.ToString());
    }
    protected void Btn_srch_Click(object sender, EventArgs e)
    {
        try
        {
            sql_da.SelectCommand.Parameters.Clear();
            sql_da.SelectCommand.CommandText = "sp_sel_cnt";
            sql_da.SelectCommand.Parameters.AddWithValue("@ch_id", drd_chapter.SelectedValue);
            sql_da.SelectCommand.Parameters.AddWithValue("@sec_count", drd_sec.SelectedItem.Text);

            sql_conn.Open();
            sql_da.Fill(ds, "sel_cnt");
            sql_conn.Close();

            if (ds.Tables["sel_cnt"].Rows.Count == 0)
            {
                lbl_er.Text = "به این بخش محتوایی اختصاص داده نشده است.";
                btn_ok.Visible = true;
                btn_edt.Visible = false;
                txt_title.Text = "";
                txt_cnt.Text = "";
            }
            else
            {
                txt_title.Text = ds.Tables["sel_cnt"].Rows[0].ItemArray.GetValue(2).ToString().Trim();
                txt_cnt.Text = ds.Tables["sel_cnt"].Rows[0].ItemArray.GetValue(3).ToString().Trim();
                Session["secid"] = ds.Tables["sel_cnt"].Rows[0].ItemArray.GetValue(0).ToString().Trim();

                btn_ok.Visible = false;
                btn_edt.Visible = true;
                drd_chapter.Enabled = false;
                drd_sec.Enabled = false;
                lbl_er.Text = "";

            }
            txt_cnt.Enabled = true;
            txt_title.Enabled = true;
        }
        catch
        {
        }
        
    }
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        try
        {
                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_ins_cnt";
                sql_da.SelectCommand.Parameters.AddWithValue("@chid", drd_chapter.SelectedValue);

                sql_conn.Open();
                sql_da.Fill(ds);
                sql_conn.Close();
                

                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_sel_max_secid";

                sql_conn.Open();
                sql_da.Fill(ds, "tbl_max");
                sql_conn.Close();

                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_upd_cnt";
                sql_da.SelectCommand.Parameters.AddWithValue("@sec_count", drd_sec.SelectedItem.Text);
                sql_da.SelectCommand.Parameters.AddWithValue("@title", txt_title.Text.Trim());
                sql_da.SelectCommand.Parameters.AddWithValue("@cnt", txt_cnt.Text.Trim());
                sql_da.SelectCommand.Parameters.AddWithValue("@secid", Convert.ToInt32(ds.Tables["tbl_max"].Rows[0].ItemArray[0].ToString()));

                sql_conn.Open();
                sql_da.Fill(ds);
                sql_conn.Close();

                lbl_er.Text = "عملیات با موفقیت انجام شد.";
                txt_title.Text = "";
                txt_cnt.Text = "";

             
        }
        catch (Exception exp)
        {
            txt_title.Text = "";
            txt_cnt.Text = "";
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات.";
        }
    }
    protected void btn_edt_Click(object sender, EventArgs e)
    {
        try
        {
            sql_da.SelectCommand.Parameters.Clear();
            sql_da.SelectCommand.CommandText = "sp_upd_cnt2";

            sql_da.SelectCommand.Parameters.AddWithValue("@secid", Session["secid"].ToString());
            sql_da.SelectCommand.Parameters.AddWithValue("@sec_count", drd_sec.SelectedItem.Text);
            sql_da.SelectCommand.Parameters.AddWithValue("@title", txt_title.Text);
            sql_da.SelectCommand.Parameters.AddWithValue("@cnt", txt_cnt.Text);

            sql_conn.Open();
            sql_da.Fill(ds);
            sql_conn.Close();
            txt_title.Text = "";
            txt_cnt.Text = "";
            lbl_er.Text = "عملیات با موفقیت انجام شد.";
            drd_chapter.Enabled = true;
            drd_sec.Enabled = true;
        }
        catch (Exception exp)
        {
            txt_title.Text = "";
            txt_cnt.Text = "";
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات.";
            lbl_er.Text = exp.Message;
        }
        
    }
    protected void lbtn_logoff_Click1(object sender, EventArgs e)
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
            Response.Redirect("LogOut.aspx");
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
}
