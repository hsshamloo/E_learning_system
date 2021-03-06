<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Del-Course.aspx.cs" Inherits="Del_Course" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>حذف درس</title>
    <link href="css/def.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
   window.close();
}

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 500px">
            <tr>
                <td style="height: 11px" colspan="3">
                    <img src="images/top_del_crs.gif" /></td>
            </tr>
            <tr>
                <td style="height: 15px">
                </td>
                <td style="width: 364px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="height: 15px" align="center" colspan="3">
                    <table border="0" cellpadding="3" cellspacing="0" style="width: 338px">
                        <tr>
                            <td style="height: 25px;" class="td_none" colspan="4">
                                حذف درس<br />
                                <span style="color: red">توجه : اگر دانشجویی درس مورد نظر را گرفته باشد شما نمی توانید
                                    آن را حذف کنید - می بایستی وابستگی دانشجو را از درس قطع کنید</span></td>
                        </tr>
                        <tr>
                            <td style="width: 3px" class="td_none">
                            </td>
                            <td style="width: 157px" class="td_none">
                                <asp:Button ID="btn_srch" runat="server" Text="جستجو" OnClick="btn_srch_Click" CssClass="btn_stl"  /></td>
                            <td style="width: 15px" class="td_none">
                                <asp:DropDownList ID="drdcrs_name" runat="server" CssClass="txt_stl">
                                </asp:DropDownList></td>
                            <td style="width: 3px" class="td_none">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 13px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 13px;" class="td_txt_cnt">
                                کد درس :</td>
                            <td style="width: 15px; height: 13px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtid" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox>&nbsp;
                            </td>
                            <td style="width: 3px; height: 13px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 11px" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 11px" class="td_txt_cnt">
                                نام درس :</td>
                            <td style="width: 15px; height: 11px" class="td_txt_cnt">
                                <asp:TextBox ID="txtname" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="height: 11px; width: 3px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 7px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 7px;" class="td_txt_cnt">
                                تعداد واحد :</td>
                            <td style="width: 15px; height: 7px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtunit" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="height: 7px; width: 3px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 18px" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 18px" class="td_txt_cnt">
                                قیمت :</td>
                            <td style="width: 15px; height: 18px" class="td_txt_cnt">
                                <asp:TextBox ID="txtprice" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="height: 18px; width: 3px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 16px" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 16px" class="td_txt_cnt">
                                استاد :</td>
                            <td style="width: 15px; height: 16px" class="td_txt_cnt">
                                <asp:TextBox ID="txt_tchname" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="height: 16px; width: 3px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 11px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 11px;" class="td_txt_cnt">
                                توضیحات :</td>
                            <td style="width: 15px; height: 11px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtcomment" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 3px; height: 11px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 5px" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 5px" class="td_txt_cnt">
                                به لیست دروس اضافه شود ؟</td>
                            <td style="width: 15px; height: 5px" class="td_txt_cnt">
                                <asp:TextBox ID="txt_addcrs" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="height: 5px; width: 3px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 2px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 2px;" class="td_txt_cnt">
                                تاریخ امتحان میان ترم :</td>
                            <td style="width: 15px; height: 2px;" class="td_txt_cnt">
                                <asp:TextBox ID="txt_date_min" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 3px; height: 2px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 9px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 9px;" class="td_txt_cnt">
                                تاریخ امتحان پایان ترم :</td>
                            <td style="width: 15px; height: 9px;" class="td_txt_cnt">
                                <asp:TextBox ID="txt_date_trm" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 3px; height: 9px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 5px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 5px;" class="td_txt_cnt">
                                تعداد سوالات میان ترم :</td>
                            <td style="width: 15px; height: 5px;" class="td_txt_cnt">
                                <asp:TextBox ID="txt_cntq_min" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 3px; height: 5px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 3px; height: 6px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 157px; height: 6px;" class="td_txt_cnt">
                                تعداد سوالات پایان ترم :</td>
                            <td style="width: 15px; height: 6px;" class="td_txt_cnt">
                                <asp:TextBox ID="txt_cntq_trm" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 3px; height: 6px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="4">
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 19px" align="center" class="td_none">
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />
                                &nbsp;<asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btn_ok_Click"
                                    Text="حذف" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="height: 15px" colspan="3" align="center">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click1" CausesValidation="False">خروج از سیستم</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="height: 15px">
                </td>
                <td style="width: 364px; height: 15px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="height: 13px">
                </td>
                <td style="width: 364px; height: 13px">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
