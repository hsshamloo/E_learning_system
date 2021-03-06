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

public partial class sel_crs : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    DataSet ds = new DataSet();
    SqlDataAdapter sql_adp = new SqlDataAdapter();

    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["status"] == "reg" )
        {
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_adp.SelectCommand = new SqlCommand();
                sql_adp.SelectCommand.Connection = sql_conn;

                sql_adp.SelectCommand.CommandType = CommandType.StoredProcedure;
                sql_adp.SelectCommand.CommandText = "sp_sel_crs";

                sql_conn.Open();
                sql_adp.Fill(ds, "selected_crs");
                sql_conn.Close();
            
                grd_crs.DataSource = ds;
                grd_crs.DataMember = "selected_crs";
                grd_crs.DataBind();
                if (ds.Tables["selected_crs"].Rows.Count == 0)
                    lbl_er.Text = "هیچ اطلاعاتی یافت نشد.";
            }
            catch(Exception exp)
            {
                sql_conn.Close();
                lbl_er.Text = exp.Message;
            }
        }
        else{
            Response.Redirect("StudentER.aspx");
        }
    }
    protected void btn_next_Click(object sender, EventArgs e)
    {
        int i,row_selected = 0;
        CheckBox chk = new CheckBox();

        for (i = 0; i <= grd_crs.Rows.Count - 1; i++)
        {
            chk = (CheckBox)grd_crs.Rows[i].FindControl("choose");
            if (chk.Checked)
            {
                row_selected++;
                Session["crs_selected_id" + row_selected.ToString()] = grd_crs.Rows[i].Cells[0].Text;
                Session["full_payment"] = Convert.ToInt32(Session["full_payment"]) + Convert.ToInt32(grd_crs.Rows[i].Cells[3].Text);       
            }
        }
        if (row_selected == 0)
        {
            lbl_er.Text = "حداقل یک درس انتخاب کنید";
        }
        else
        {
            Session["cnt_crs_selected"] = row_selected;

            Session["status"] = "reg_comp";

            Response.Redirect("Register3rd.aspx");
        }
    }
}
