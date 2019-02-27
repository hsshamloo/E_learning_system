using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page 
{
    SqlCommand sql_comm = new SqlCommand();
    DataSet ds = new DataSet();
    SqlConnection sql_conn = new SqlConnection();    
    SqlDataAdapter sql_adp = new SqlDataAdapter();  
    string str_conn;

  
    protected void Page_Load(object sender, EventArgs e)
    {
        ///////////////////////////////////
        if (Session["owner"] == "student")
        {
            sql_comm.Parameters.AddWithValue("@user", Session["usr"].ToString());
            sql_comm.Parameters.AddWithValue("@pass", Session["pwd"].ToString());
            try
            {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_comm.Connection = sql_conn;
                sql_comm.CommandType = CommandType.StoredProcedure;

                if (!IsPostBack)
                {
                    sql_comm.CommandText = "hsp_readstd_chen_prop";
                    sql_adp.SelectCommand = sql_comm;
                    sql_conn.Open();
                    sql_adp.Fill(ds, "t1");
                    sql_conn.Close();
                    Txtdaneshjoid.Text = ds.Tables["t1"].Rows[0].ItemArray[0].ToString().Trim();
                    Txtname.Text = ds.Tables["t1"].Rows[0].ItemArray[1].ToString().Trim();
                    Txtfamily.Text = ds.Tables["t1"].Rows[0].ItemArray[2].ToString().Trim();
                    Txtfathername.Text = ds.Tables["t1"].Rows[0].ItemArray[3].ToString().Trim();
                    int i;
                    Drdday.Items.Clear();
                    Drdmonth.Items.Clear();
                    Drdyear.Items.Clear();
                    for (i = 1; i <= 9; i++)
                        Drdyear.Items.Add("130" + i.ToString());
                    for (i = 10; i <= 70; i++)
                        Drdyear.Items.Add("13" + i.ToString());
                    for (i = 1; i <= 12; i++)
                        Drdmonth.Items.Add(i.ToString());
                    for (i = 1; i <= 31; i++)
                        Drdday.Items.Add(i.ToString());
                    Drdday.Text = ds.Tables["t1"].Rows[0].ItemArray[6].ToString().Trim();
                    Drdmonth.Text = ds.Tables["t1"].Rows[0].ItemArray[5].ToString().Trim();
                    Drdyear.Text = ds.Tables["t1"].Rows[0].ItemArray[4].ToString().Trim();
                    Txtmail.Text = ds.Tables["t1"].Rows[0].ItemArray[7].ToString().Trim();
                    Txtphon.Text = ds.Tables["t1"].Rows[0].ItemArray[8].ToString().Trim();
                    ds.Clear();
                }
            }
            catch (Exception exp)
            {
                Lbmsg.Text = exp.Message;// "خطا در انجام عملیات !";
            }
        }
        else
        {
            Response.Redirect("studentER.aspx");
        }
    }
    protected void btnregester_Click(object sender, EventArgs e)
    {
        try
        {
            sql_comm.Parameters.Clear();
            sql_comm.CommandText = "hsp_writestd_chen_prop";
            sql_comm.Parameters.AddWithValue("@user",Session["usr"].ToString());
            sql_comm.Parameters.AddWithValue("@pass",Session["pwd"].ToString());                    
            sql_comm.Parameters.AddWithValue("@name",Txtname.Text.Trim());
            sql_comm.Parameters.AddWithValue("@family",Txtfamily.Text.Trim());
            sql_comm.Parameters.AddWithValue("@father",Txtfathername.Text.Trim());
            sql_comm.Parameters.AddWithValue("@bthy",Drdyear.Text.Trim());
            sql_comm.Parameters.AddWithValue("@bthm",Drdmonth.Text.Trim());
            sql_comm.Parameters.AddWithValue("@bthd",Drdday.Text.Trim());
            sql_comm.Parameters.AddWithValue("@email", Txtmail.Text.Trim());
            sql_comm.Parameters.AddWithValue("@tel",Txtphon.Text.Trim());
            sql_conn.Open();            
            sql_comm.ExecuteNonQuery();
            sql_conn.Close();
            Lbmsg.Text = "مشخصات جدید شما با موفقییت ثبت شد";
        }
        catch (Exception exp)
        {
            Lbmsg.Text = "خطا در انجام عملیات !"; 
        }
        
        


    }
    protected void Drdmonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i;
        if (Convert.ToInt32(Drdmonth.SelectedItem.Text) <= 6)
        {
            Drdday.Items.Clear();
            for (i = 1; i <= 31; i++)
                Drdday.Items.Add(i.ToString());
        }
        else if (Convert.ToInt32(Drdmonth.SelectedItem.Text) > 6 && Convert.ToInt32(Drdmonth.SelectedItem.Text) <= 11)
        {
            Drdday.Items.Clear();
            for (i = 1; i <= 30; i++)
                Drdday.Items.Add(i.ToString());
        }
        else
        {
            Drdday.Items.Clear();
            for (i = 1; i <= 29; i++)
                Drdday.Items.Add(i.ToString());
        }

    }
    protected void lbtn_logoff_Click1(object sender, EventArgs e)
    {
        try
        {
            sql_comm.Parameters.Clear();
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.CommandText = "sp_upd_std_online2";
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
            Lbmsg.Text = "خطا در انجام عملیات !";
        }
    }
}
