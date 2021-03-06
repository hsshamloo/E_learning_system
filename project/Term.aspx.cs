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

public partial class Quiz : System.Web.UI.Page
{
    SqlConnection sql_conn = new SqlConnection();
    SqlDataAdapter sql_da = new SqlDataAdapter();
    DataSet ds = new DataSet();

    string str_conn;
    int count_qst_for_trm;
    int count_qst;
    int count_ans_currect = 0,
            count_ans_incurrect = 0,
            count_asn_without = 0;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["owner"] == "student")
        {
                str_conn = ConfigurationManager.AppSettings.Get(0);
                sql_conn.ConnectionString = str_conn;
                sql_da.SelectCommand = new SqlCommand();
                sql_da.SelectCommand.Connection = sql_conn;
                sql_da.SelectCommand.CommandType = CommandType.StoredProcedure;

            /////////////////////////////////////
                sql_da.SelectCommand.CommandText = "sp_sel_trm_for_check";
                sql_da.SelectCommand.Parameters.AddWithValue("@usr", Session["usr"].ToString().Trim());
                sql_da.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString().Trim());

                sql_conn.Open();
                sql_da.Fill(ds, "sel_trm_chk");
                sql_conn.Close();

                string chk = ds.Tables["sel_trm_chk"].Rows[0].ItemArray[0].ToString();
            if(chk == "1")
            {
                lbl_er.Text = "شما قبلا این آزمون را داده اید.";
                btn_res.Enabled = false;
                grd_qst.Visible = false;
                ds.Clear();
            }
                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_count_trm";
                sql_da.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString().Trim());

                sql_conn.Open();
                sql_da.Fill(ds, "sel_cnt_trm");
                sql_conn.Close();

                count_qst = Convert.ToInt32(ds.Tables["sel_cnt_trm"].Rows[0].ItemArray.GetValue(0));
                ds.Clear();

                ///////////////////////////

                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_count_qst_trm";
                sql_da.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString().Trim());

                sql_conn.Open();
                sql_da.Fill(ds, "sel_cnt_qst_trm");
                sql_conn.Close();

                count_qst_for_trm = Convert.ToInt32(ds.Tables["sel_cnt_qst_trm"].Rows[0].ItemArray.GetValue(0));
                ds.Clear();

                ///////////////////////////////////
                if (!IsPostBack && Session["no_ref"] == "0")
                {
                    Random rnd_num = new Random();
                    bool f = false;

                    for (int i = 1; i <= count_qst_for_trm - count_qst; i++)
                    {
                        int num_rnd = rnd_num.Next(0, count_qst_for_trm);
                        for (int j = 1; j <= i; j++)
                        {
                            f = false;
                            if (Convert.ToInt32(Session["ar_num" + j]) == num_rnd)
                            {
                                f = true;
                                i = i - 1;
                                break;
                            }
                        }
                        if (f == false)
                        {
                            Session["ar_num" + i] = num_rnd;
                        }
                    }
                }

                ////////////////////////////////////////////////////

                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_sel_qst_for_trm";
                sql_da.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString().Trim());

                sql_conn.Open();
                sql_da.Fill(ds, "sel_qst");
                sql_conn.Close();
                if (ds.Tables["sel_qst"].Rows.Count == 0)
                    btn_res.Enabled = false;

                for (int i = 0; i <= count_qst_for_trm - 1; i++)
                    Session["current_ans" + i] = ds.Tables["sel_qst"].Rows[i].ItemArray.GetValue(6).ToString();
                
                /////////

                for (int i = 1; i <= count_qst_for_trm - count_qst; i++)
                {
                    ds.Tables["sel_qst"].Rows[Convert.ToInt32(Session["ar_num" + i])].Delete();
                    Session["current_ans" + Session["ar_num" + i]] = 0;
                }
                
                /////////

                grd_qst.DataSource = ds;
                grd_qst.DataMember = "sel_qst";
                grd_qst.DataBind();

                /////////////////////////////////////////
                
                ds.Clear();
            ///////////////////////////// enter initial info in 3 table//////////////////////////////////
               if(chk == "0")
               {
                   sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_ins_trm_exam";
                sql_da.SelectCommand.Parameters.AddWithValue("@usr", Session["usr"].ToString());
                sql_da.SelectCommand.Parameters.AddWithValue("@crsid", Session["crsid"].ToString());

                sql_conn.Open();
                sql_da.Fill(ds);
                sql_conn.Close();
                ds.Clear();
            ///////////////////////////// enter ch_id in tbl_exam_ch 1) the first get maximun exam ID

                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_sel_max_eid";
                sql_da.SelectCommand.Parameters.AddWithValue("@usr", Session["usr"].ToString());

                sql_conn.Open();
                sql_da.Fill(ds,"tbl_max");
                sql_conn.Close();

            /////////////////////////// 2) the 2nd and the end enter ch_id
                sql_da.SelectCommand.Parameters.Clear();
                sql_da.SelectCommand.CommandText = "sp_upd_type_for_exam_trm";
                sql_da.SelectCommand.Parameters.AddWithValue("@eid", Convert.ToInt32(ds.Tables["tbl_max"].Rows[0].ItemArray[0].ToString()));

                sql_conn.Open();
                sql_da.Fill(ds);
                sql_conn.Close();

                ds.Clear();
               }
        
            //////////////////////////////

                Session["no_ref"] = "1";
            }

                
            /////////////////////////////////////

                
       
        else
        {
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        /////////////////////////////////////////
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btn_res_Click(object sender, EventArgs e)
    {
        grd_qst.Enabled = false;

        RadioButtonList rdbl = new RadioButtonList();
        
        

        for (int i = 0; i <= grd_qst.Rows.Count - 1; i++)
        {
            rdbl = (RadioButtonList)grd_qst.Rows[i].FindControl("ans");

            if (rdbl.SelectedIndex >= 0)
            {
                int ansed = Convert.ToInt32(rdbl.SelectedValue);

                for (int j = 0; j <= count_qst_for_trm - 1; j++)
                {
                    if (Session["current_ans" + j].ToString() != "0")
                    {
                        if(ansed == Convert.ToInt32(Session["current_ans" + j].ToString()))
                            count_ans_currect += 1;
                        else
                            count_ans_incurrect += 1;
                        Session["current_ans" + j] = "0";
                        break;
                    }
                }
            }
            else
                count_asn_without += 1;
        }
        /////////////////////////////////////////////////////////////////////

        sql_da.SelectCommand.Parameters.Clear();
        sql_da.SelectCommand.CommandText = "sp_sel_max_eid";
        sql_da.SelectCommand.Parameters.AddWithValue("@usr", Session["usr"].ToString());

        sql_conn.Open();
        sql_da.Fill(ds, "tbl_max");
        sql_conn.Close();

        //////////////////////////////////////////
        sql_da.SelectCommand.Parameters.Clear();
        sql_da.SelectCommand.CommandText = "sp_upd_cnt_trm";
        sql_da.SelectCommand.Parameters.AddWithValue("@eid", Convert.ToInt32(ds.Tables["tbl_max"].Rows[0].ItemArray[0].ToString()));
        sql_da.SelectCommand.Parameters.AddWithValue("@grade", ((((count_ans_currect * 3) - count_ans_incurrect) * 100) / ((count_asn_without + count_ans_incurrect + count_ans_currect) * 3)));
        sql_da.SelectCommand.Parameters.AddWithValue("@cans", count_ans_currect);
        sql_da.SelectCommand.Parameters.AddWithValue("@icans", count_ans_incurrect);
        sql_da.SelectCommand.Parameters.AddWithValue("@woans",count_asn_without);
        sql_da.SelectCommand.Parameters.AddWithValue("@type", "پایان ترم");
        sql_conn.Open();
        sql_da.Fill(ds);
        sql_conn.Close();

        ds.Clear();

        Panel1.Visible = true;
        lbl_cans.Text = count_ans_currect.ToString();
        lbl_icans.Text = count_ans_incurrect.ToString();
        lbl_woans.Text = count_asn_without.ToString();
        lbl_res.Text = Convert.ToString(((((count_ans_currect * 3) - count_ans_incurrect) * 100) / ((count_asn_without + count_ans_incurrect + count_ans_currect) * 3)));
    }
}
