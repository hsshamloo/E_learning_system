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
using PersianUtils;

public partial class _Default : System.Web.UI.Page 
{
    SqlConnection sql_conn = new SqlConnection();
    SqlCommand sql_comm = new SqlCommand();
    SqlDataReader sql_rd;
    string str_conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager" || Session["owner"] == "teacher" || Session["owner"] == "student")
        {
            lblusr.Text = " نام کاربری : " + Session["usr"].ToString();
            lbtn_logout.Visible = true;
        }
        else
        {
            lblusr.Text = "کاربر مهمان";
            lbtn_logout.Visible = false;
        }

        string date;


        str_conn = ConfigurationManager.AppSettings.Get(0);
        //Response.Write(str_conn);
        sql_conn.ConnectionString = str_conn;
        sql_comm.Connection = sql_conn;
       
        CalendarUtils.SetCalendar();
        date = Calendar1.TodaysDate.Date.ToString();
        date = date.Substring(0, 10);
        Session["current_date"] = date;
    }


    protected void btn_ok_Click(object sender, EventArgs e)
    {
        int typ_usr;
        String usrid,usrpwd;

        try
        {
            typ_usr = drdusr_typ.SelectedIndex;
            usrid = txtusr.Text.Trim();
            usrpwd = txtpwd.Text.Trim();
            sql_conn.Open();

            switch (typ_usr)
            {
                ////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                    // For Student
                ////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////

                case 0:
                    sql_comm.CommandType = CommandType.StoredProcedure;
                    sql_comm.CommandText = "sp_login_std";
                    sql_comm.Parameters.AddWithValue("@usr", usrid);
                    sql_comm.Parameters.AddWithValue("@pwd", usrpwd);
                    
                    sql_rd = sql_comm.ExecuteReader();
                    sql_rd.Read();
                    if (sql_rd.HasRows != false)//اگر وجود دارد
                    {
                        if (sql_rd["online"].ToString() == "False")//اگر آنلاین نیست
                        {
                            Session["last_login"] = sql_rd["date_last_login"];
                            sql_comm.Parameters.Clear();
                            sql_rd.Close();

                            sql_comm.CommandText = "sp_upd_std_online";
                            sql_comm.Parameters.AddWithValue("@dll", Session["current_date"]);
                            sql_comm.Parameters.AddWithValue("@online", true);
                            sql_comm.Parameters.AddWithValue("@usr", usrid);
                            sql_comm.Parameters.AddWithValue("@pwd", usrpwd);

                            sql_comm.ExecuteNonQuery();

                            Session["owner"] = "student";
                            Session["usr"] = usrid;
                            Session["pwd"] = usrpwd;

                            Response.Redirect("../ControlPanel/StudentCP.aspx");
                        }
                        else if (Session["owner"] == "student")//اگر قبلا وارد شده
                        {
                            Response.Redirect("../ControlPanel/StudentCP.aspx");
                            txtpwd.Text = "";
                            txtusr.Text = "";
                        }
                    
                    else
                    {
                        sql_comm.Parameters.Clear();
                        sql_rd.Close();

                        sql_comm.CommandText = "sp_upd_std_online2";
                        sql_comm.Parameters.AddWithValue("@online", false);
                        sql_comm.Parameters.AddWithValue("@usr", usrid);
                        sql_comm.Parameters.AddWithValue("@pwd", usrpwd);


                        sql_comm.ExecuteNonQuery();
                        lbl_er.Text = "دوباره امتحان کنید !!!";
                    }
                    }
                    else
                    {
                        lbl_er.Text = "نام کاربری یا کلمه عبور اشتباه است !";
                        txtpwd.Text = "";
                        txtusr.Text = "";
                        sql_rd.Close();
                    }
                    break;


                ////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                    //For Teacher
                ////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////

                case 1:
                    sql_comm.CommandType = CommandType.StoredProcedure;
                    sql_comm.CommandText = "sp_login_tch";
                    sql_comm.Parameters.AddWithValue("@usrid", usrid);
                    sql_comm.Parameters.AddWithValue("@usrpwd", usrpwd);

                    sql_rd = sql_comm.ExecuteReader();
                    sql_rd.Read();
                    if (sql_rd.HasRows != false)//اگر وجود دارد
                    {
                        if (sql_rd["online"].ToString() == "False")//اگر آنلاین نیست
                        {
                            Session["last_login"] = sql_rd["date_last_login"];
                            sql_comm.Parameters.Clear();
                            sql_rd.Close();

                            sql_comm.CommandText = "sp_upd_tch_online";
                            sql_comm.Parameters.AddWithValue("@dll", Session["current_date"]);
                            sql_comm.Parameters.AddWithValue("@online", true);
                            sql_comm.Parameters.AddWithValue("@usr", usrid);
                            sql_comm.Parameters.AddWithValue("@pwd", usrpwd);

                            sql_comm.ExecuteNonQuery();

                            Session["owner"] = "teacher";
                            Session["usr"] = usrid;
                            Session["pwd"] = usrpwd;

                            Response.Redirect("../ControlPanel/TeacherCP.aspx");
                        }
                        else if (Session["owner"] == "teacher")//اگر قبلا وارد شده
                        {
                            Response.Redirect("../ControlPanel/TeacherCP.aspx");
                            txtpwd.Text = "";
                            txtusr.Text = "";
                        }
                    
                    else
                    {
                        sql_comm.Parameters.Clear();
                        sql_rd.Close();

                        sql_comm.CommandText = "sp_upd_tch_online2";
                        sql_comm.Parameters.AddWithValue("@online", false);
                        sql_comm.Parameters.AddWithValue("@usr", usrid);
                        sql_comm.Parameters.AddWithValue("@pwd", usrpwd);


                        sql_comm.ExecuteNonQuery();
                        lbl_er.Text = "دوباره امتحان کنید !!!";
                    }
                }
                    else
                    {
                        lbl_er.Text = "نام کاربری یا کلمه عبور اشتباه است !";
                        txtpwd.Text = "";
                        txtusr.Text = "";
                        sql_rd.Close();
                    }
                    break;


                ////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                ///////////////////// For Manager ///////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////

                case 2:
                    sql_comm.CommandType = CommandType.StoredProcedure;
                    sql_comm.CommandText = "sp_login_mng";
                    sql_comm.Parameters.AddWithValue("@usrid", usrid);
                    sql_comm.Parameters.AddWithValue("@usrpwd", usrpwd);

                    sql_rd = sql_comm.ExecuteReader();
                    sql_rd.Read();
                    if (sql_rd.HasRows != false)//اگر وجود دارد
                    {
                        if (sql_rd["online"].ToString() == "False")//اگر آنلاین نیست
                        {
                            Session["last_login"] = sql_rd["date_last_login"];
                            sql_comm.Parameters.Clear();
                            sql_rd.Close();

                            sql_comm.CommandText = "sp_upd_mng_online";
                            sql_comm.Parameters.AddWithValue("@dll", Session["current_date"]);
                            sql_comm.Parameters.AddWithValue("@online", true);
                            sql_comm.Parameters.AddWithValue("@usr", usrid);
                            sql_comm.Parameters.AddWithValue("@pwd", usrpwd);
                            
                            sql_comm.ExecuteNonQuery();

                            
                            Session["owner"] = "super_manager";
                            Session["usr"] = usrid;
                            Session["pwd"] = usrpwd;

                            Response.Redirect("../ControlPanel/ManagerCP.aspx");
                        }
                        else if (Session["owner"] == "super_manager")//اگر قبلا وارد شده
                        {
                            Response.Redirect("../ControlPanel/ManagerCP.aspx");
                            txtpwd.Text = "";
                            txtusr.Text = "";
                        }
                        else//اگر وارد شده و سشن ندارد
                        {
                            sql_comm.Parameters.Clear();
                            sql_rd.Close();

                            sql_comm.CommandText = "sp_upd_mng_online2";
                            sql_comm.Parameters.AddWithValue("@online", false);
                            sql_comm.Parameters.AddWithValue("@usr", usrid);
                            sql_comm.Parameters.AddWithValue("@pwd", usrpwd);

                            

                            sql_comm.ExecuteNonQuery();
                            lbl_er.Text = "دوباره امتحان کنید !!!";
                        }
                    }
                    else
                    {
                        lbl_er.Text = "نام کاربری یا کلمه عبور اشتباه است !";
                        txtpwd.Text = "";
                        txtusr.Text = "";
                        sql_rd.Close();
                    }
                    break;
            }
            
            sql_conn.Close();
        }
        catch(Exception exp)
        {
            sql_conn.Close();
            lbl_er.Text = exp.Message;
        }
        
    }
    
    protected void lbtn_forget_pwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
     
    }

    protected void lb_cp_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["owner"] == "super_manager")
            Response.Redirect("../controlpanel/ManagerCp.aspx");
        else if (Session["owner"] == "teacher")
            Response.Redirect("../controlpanel/TeacherCp.aspx");
        else if (Session["owner"] == "student")
            Response.Redirect("../controlpanel/StudentCp.aspx");
        else
            Response.Redirect("login.aspx");

    }
    protected void lbtn_logout_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["owner"] == "super_manager")
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

                Session.Abandon();
                Response.Redirect("../Login/Login.aspx");
            }
            else if (Session["owner"] == "teacher")
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
                Response.Redirect("../Login/Login.aspx");
            }
            else if (Session["owner"] == "student")
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
                Response.Redirect("../Login/Login.aspx");
            }
            else
                lbtn_logout.Visible = false;
            
        }
        catch (Exception exp)
        {
            sql_conn.Close();
            Response.Write(exp.Message);
        }
    }
}
