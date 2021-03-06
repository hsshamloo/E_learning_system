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

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    SqlCommand sql_comm = new SqlCommand();


    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "teacher")
        {
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_adp.SelectCommand = new SqlCommand();
                sql_adp.SelectCommand.Connection = sql_conn;
                sql_adp.SelectCommand.CommandType = CommandType.StoredProcedure;
                sql_comm.Connection = sql_conn;

                lbl_crs_name.Text = Session["crsname"].ToString();
            }
            catch
            {
            }
            
        }
        else
        {
            Response.Redirect("teacherER.aspx");
        }
    }
    protected void drpdwn_q_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpdwn_q_type.SelectedIndex > 2)
        {
            drd_chapter.Visible = true;
            lbl_chapter.Visible = true;
            try
            {
                sql_adp.SelectCommand.CommandText = "sp_sel_chapter";
                sql_adp.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
                sql_conn.Open();
                sql_adp.Fill(ds, "selected_chapter");
                sql_conn.Close();

                drd_chapter.DataSource = ds;
                drd_chapter.DataMember = "selected_chapter";
                drd_chapter.DataTextField = "ch_name";
                drd_chapter.DataValueField = "ch_id";
                drd_chapter.DataBind();
                ds.Clear();
            }
            catch(Exception exp)
            {
                sql_conn.Close();
                lbl_er.Text = "خطا در انجام عملیات !";
            }
        }
        else
        {
            drd_chapter.Visible = false;
            lbl_chapter.Visible = false;
        }
    }
    protected void btn_add_quest_Click(object sender, EventArgs e)
    {
      try
      {
          sql_adp.SelectCommand.CommandText = "sp_ins_qst";

          sql_adp.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());
          if (drd_chapter.Visible == true)
          {
              sql_adp.SelectCommand.Parameters.AddWithValue("@chid",drd_chapter.SelectedValue.Trim());
          }
          else
          {
              sql_adp.SelectCommand.Parameters.AddWithValue("@chid", 0);
          }

          sql_adp.SelectCommand.Parameters.AddWithValue("@a", Txt_ans_a.Text.Trim());
          sql_adp.SelectCommand.Parameters.AddWithValue("@b", txt_ans_b.Text.Trim());
          sql_adp.SelectCommand.Parameters.AddWithValue("@c", txt_ans_c.Text.Trim());
          sql_adp.SelectCommand.Parameters.AddWithValue("@d", txt_ans_d.Text.Trim());
          sql_adp.SelectCommand.Parameters.AddWithValue("@qst", txt_question.Text.Trim());
          sql_adp.SelectCommand.Parameters.AddWithValue("@ans", rbl_ans.SelectedValue.Trim());
          sql_adp.SelectCommand.Parameters.AddWithValue("@qsttyp", drpdwn_q_type.SelectedValue.Trim());

          sql_conn.Open();
          sql_adp.SelectCommand.ExecuteNonQuery();
          sql_conn.Close();
          lbl_er.Text = "عملیات با موفقیت انجام شد.";

          Txt_ans_a.Text = "";
          txt_ans_b.Text = "";
          txt_ans_c.Text = "";
          txt_ans_d.Text = "";
          txt_question.Text = "";
      }
      catch(Exception exp)
      {
         sql_conn.Close();
         lbl_er.Text = "خطا در انجام عملیات !";
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
