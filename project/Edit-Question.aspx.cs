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

public partial class Edit_Question : System.Web.UI.Page
{
    int aa;

    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    SqlCommand sql_comm = new SqlCommand();

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
      
        aa = Convert.ToInt32(Request.QueryString["id"]);

        edit_panel.Visible = false;
        if (Session["owner"] == "teacher")
        {
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_conn.ConnectionString = str_conn;
                sql_adp.SelectCommand = new SqlCommand();
                sql_adp.SelectCommand.Connection = sql_conn;
                sql_adp.SelectCommand.CommandType = CommandType.StoredProcedure;
                sql_comm.Connection = sql_conn;
                sql_comm.CommandType = CommandType.StoredProcedure;

                sql_adp.SelectCommand.CommandText = "sp_sel_qst";
                sql_adp.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());

                sql_conn.Open();
                sql_adp.Fill(ds, "selected_qst");
                sql_conn.Close();

                grd_qst.DataSource = ds;
                grd_qst.DataMember = "selected_qst";
                grd_qst.DataBind();
                if (ds.Tables["selected_qst"].Rows.Count == 0)
                    lbl_er.Text = "هیچ اطلاعاتی یافت نشد.";
                ds.Clear();
            }
            catch (Exception exp)
            {
                sql_conn.Close();
                lbl_er.Text = exp.Message;
            }
            ////////////////////////////////aaaaaaaaaaaaaaaa
            if (Request.QueryString["id"] != null)
            {
                edit_panel.Visible = true;
                  try
                {
                    sql_comm.CommandText = "sp_sel_one_qst";
                    sql_comm.Parameters.AddWithValue("@id_quest", Request.QueryString["id"]);
                    sql_adp.SelectCommand = sql_comm;

                    sql_conn.Open();
                    sql_adp.Fill(ds, "t2");
                    sql_conn.Close();

                    if (!IsPostBack)
                    {
                        txt_question.Text = ds.Tables["t2"].Rows[0].ItemArray[1].ToString().Trim();
                        Txt_ans_a.Text = ds.Tables["t2"].Rows[0].ItemArray[2].ToString().Trim();
                        txt_ans_b.Text = ds.Tables["t2"].Rows[0].ItemArray[3].ToString().Trim();
                        txt_ans_c.Text = ds.Tables["t2"].Rows[0].ItemArray[4].ToString().Trim();
                        txt_ans_d.Text = ds.Tables["t2"].Rows[0].ItemArray[5].ToString().Trim();
                        char ch;
                        ch = Convert.ToChar(ds.Tables["t2"].Rows[0].ItemArray[6].ToString().Trim());
                        rbl_ans.SelectedIndex = Convert.ToInt32(ch) - 1;
                        drpdwn_q_type.Text = ds.Tables["t2"].Rows[0].ItemArray[7].ToString().Trim();



                        //////////////////////////////////

                        if (drpdwn_q_type.SelectedIndex > 2)
                        {
                            drd_chapter.Visible = true;
                            lbl_chapter.Visible = true;
                            try
                            {
                                sql_adp.SelectCommand.Parameters.Clear();
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
                            catch (SqlException exp)
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
                }
                 catch (Exception exp)
                {
                     edit_panel.Visible = false;
                     sql_conn.Close();
                     lbl_er.Text = "خطا در انجام عملیات !";
                }
            }
        
        }
        else
        {
            Response.Redirect("teacherER.aspx");
        }
        
        ////////////////////////////////aaaaaaaaaaaaaaaa
    }//page load end
   /// <summary>
   /// ////////////////////////////////uuuuuuuuuuuuuuuuuu begin
   /// </summary>
   /// <param name="sender"></param>
   /// <param name="e"></param>
    protected void btn_upd_quest_Click(object sender, EventArgs e)
    {
            try
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_adp.SelectCommand = new SqlCommand();
            sql_adp.SelectCommand.Connection = sql_conn;
            sql_adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            sql_comm.Connection = sql_conn;

             ////////
            sql_comm.Parameters.Clear();
            sql_comm.CommandText = "sp_upd_qst";
            sql_comm.Parameters.AddWithValue("@id_quest", aa);
            sql_comm.Parameters.AddWithValue("@crsid",Session["crsid"].ToString());

            if (drd_chapter.Visible == true)
            {
                sql_comm.Parameters.AddWithValue("@chid",Convert.ToInt32(drd_chapter.SelectedValue));
            }
            else
            {
                sql_comm.Parameters.AddWithValue("@chid", 0);
            }

            sql_comm.Parameters.AddWithValue("@qst", txt_question.Text.Trim());
            sql_comm.Parameters.AddWithValue("@a", Txt_ans_a.Text.Trim());
            sql_comm.Parameters.AddWithValue("@b", txt_ans_b.Text.Trim());
            sql_comm.Parameters.AddWithValue("@c", txt_ans_c.Text.Trim());
            sql_comm.Parameters.AddWithValue("@d", txt_ans_d.Text.Trim());
            sql_comm.Parameters.AddWithValue("@ans", rbl_ans.SelectedValue.Trim());
            sql_comm.Parameters.AddWithValue("@qsttyp", drpdwn_q_type.SelectedValue.Trim());

            sql_conn.Open();
            sql_comm.ExecuteNonQuery() ;
            sql_conn.Close();
            lbl_er.Text = "عملیات با موفقیت انجام شد.";

                //////////////////////////////////

            sql_adp.SelectCommand.Parameters.Clear();
            sql_adp.SelectCommand.CommandText = "sp_sel_qst";
            sql_adp.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());

            sql_conn.Open();
            sql_adp.Fill(ds, "selected_qst");
            sql_conn.Close();

            grd_qst.DataSource = ds;
            grd_qst.DataMember = "selected_qst";
            grd_qst.DataBind();
            ds.Clear();

            edit_panel.Visible = false;
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = "خطا در انجام عملیات !";
        }
    }
    //////////////////////
    protected void drpdwn_q_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpdwn_q_type.SelectedIndex > 2)
        {
            drd_chapter.Visible = true;
            lbl_chapter.Visible = true;
            try
            {
                sql_adp.SelectCommand.Parameters.Clear();
                sql_adp.SelectCommand.CommandText = "sp_sel_chapter";
                sql_adp.SelectCommand.Parameters.AddWithValue("@crsid",Session["crsid"].ToString());

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
            catch (Exception exp)
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
    /// <summary>
    ///
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        int i, row_selected = 0;
        CheckBox chk = new CheckBox();

        for (i = 0; i <= grd_qst.Rows.Count - 1; i++)
        {
            chk = (CheckBox)grd_qst.Rows[i].FindControl("choose");
            if (chk.Checked)
            {
                row_selected += 1;
                sql_adp.SelectCommand.Parameters.Clear();
                sql_adp.SelectCommand.CommandText = "sp_del_qst";
                sql_adp.SelectCommand.Parameters.AddWithValue("@id_quest",grd_qst.Rows[i].Cells[0].Text);
                try
                {
                    sql_conn.Open();
                    sql_adp.Fill(ds);
                    sql_conn.Close();
                    ds.Clear();
                    lbl_mess.Text = "عملیات با موفقیت انجام شد.";
                    ////////////////
                   
                }
                catch (Exception exp)
                {
                    sql_conn.Close();
                    lbl_mess.Text = "خطا در انجام عملیات!";
                }
            }
            if (row_selected == 0)
                lbl_er.Text = "برای حذف حداقل یک سوال را انتخاب کنید";
        }
        
        sql_adp.SelectCommand.Parameters.Clear();
        sql_adp.SelectCommand.CommandText = "sp_sel_qst";
        sql_adp.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());

        sql_conn.Open();
        sql_adp.Fill(ds, "selected_qst");
        sql_conn.Close();

        grd_qst.DataSource = ds;
        grd_qst.DataMember = "selected_qst";
        grd_qst.DataBind();
        ds.Clear();
            }

     
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void lbtn_logoff_Click(object sender, EventArgs e)
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
            lbl_er.Text = "خطا در انجام عملیات!";
        }
    }
}
