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

public partial class list_student_unavailable : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();
    SqlCommand sql_comm = new SqlCommand();

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager")
        {
            str_conn = ConfigurationManager.AppSettings.Get(0);
            sql_conn.ConnectionString = str_conn;
            sql_adp.SelectCommand = new SqlCommand();
            sql_comm.Connection = sql_conn;

            sql_adp.SelectCommand.Connection = sql_conn;

            sql_adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            
                try
                {
                    sql_adp.SelectCommand.CommandText = "sp_sel_std_un";

                    sql_conn.Open();
                    sql_adp.Fill(ds, "selected_std");
                    sql_conn.Close();

                    grd_std.DataSource = ds;
                    grd_std.DataMember = "selected_std";
                    grd_std.DataBind();
                    ds.Clear();
                    if (grd_std.Rows.Count == 0)
                        lbl_er.Text = "هیچ اطلاعاتی یافت نشد.";
                }
                catch (Exception exp)
                {
                    sql_conn.Close();
                    lbl_er.Text = "خطا در انجام عملیات!";
                }
            
        }
        else
        {
            Response.Redirect("managerER.aspx");
        }
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
            lbl_er.Text = "خطا در انجام عملیات!";
        }
    }

    protected void btn_ok_Click(object sender, EventArgs e)
    {
        int i, row_selected = 0;
        CheckBox chk = new CheckBox();

        for (i = 0; i <= grd_std.Rows.Count - 1; i++)
        {
            chk = (CheckBox)grd_std.Rows[i].FindControl("choose");

            if (chk.Checked)
            {
                row_selected++;
                sql_adp.SelectCommand.Parameters.Clear();
                sql_adp.SelectCommand.CommandText = "sp_upd_std_un";
                sql_adp.SelectCommand.Parameters.AddWithValue("@pid", grd_std.Rows[i].Cells[2].Text);
               try
                {
                    sql_conn.Open();
                    sql_adp.Fill(ds);
                    sql_conn.Close();
                    ds.Clear();
                   
                    lbl_er.Text = "عملیات با موفقیت انجام شد.";

                    

                }
                catch(Exception exp)
                {
                    sql_conn.Close();
                    lbl_er.Text = "خطا در انجام عملیات!";
                }
            }
            if (row_selected == 0)
            {
                lbl_er.Text = "حداقل یک دانشجو انتخاب کنید";
            }
        }

        sql_adp.SelectCommand.CommandText = "sp_sel_std_un";
        sql_adp.SelectCommand.Parameters.Clear();
        sql_conn.Open();
        sql_adp.Fill(ds, "selected_std");
        sql_conn.Close();

        grd_std.DataSource = ds;
        grd_std.DataMember = "selected_std";
        grd_std.DataBind();
        ds.Clear();
        if (grd_std.Rows.Count == 0)
            lbl_er.Text = "هیچ اطلاعاتی یافت نشد.";
    }
}
