<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Del-Teacher.aspx.cs" Inherits="Del_Teacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>حذف استاد</title>
    <link href="css/def.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
   window.close();
}

// ]]>
</script>
</head>
<body style="margin-left: 0px; margin-right: 0px">
    <form id="form1" runat="server">
    <div>
        <table  border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 500px;">
            <tr>
                <td align="center" colspan="3">
                    <img src="images/top_del_tch.gif" /></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 311px" valign="middle">
                    <table border="0" cellpadding="3" cellspacing="0" style="width: 375px">
                        <tr>
                            <td style="height: 24px;" class="td_none" colspan="4">
                                حذف استاد<br />
                                <span style="color: red">توجه : اگر استاد در سیستم درسی را تدریس میکند شما نمی توانید
                                    او را حذف کنید - ابتدا می بایستی وابستگی او را به درس مربوط قطع کنید.</span></td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 4px;" class="td_none">
                            </td>
                            <td style="width: 820px; height: 4px;" class="td_none">
                                <asp:Button ID="btn_srch" runat="server"  Text="جستجو" OnClick="btn_srch_Click" CssClass="btn_stl" /></td>
                            <td style="width: 715px; height: 4px;" class="td_none">
                                <asp:DropDownList ID="drdtch_name" runat="server" CssClass="txt_stl">
                                </asp:DropDownList></td>
                            <td style="width: 17px; height: 4px;" class="td_none">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 4px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px; height: 4px;" class="td_txt_cnt">
                                کد استاد (کلمه کاربری) :</td>
                            <td style="width: 715px; height: 4px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtid" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 17px; height: 4px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 1px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px; height: 1px;" class="td_txt_cnt">
                                کلمه عبور :</td>
                            <td style="width: 715px; height: 1px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtpwd" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 17px; height: 1px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 4px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px; height: 4px;" class="td_txt_cnt">
                                تکرار کلمه عبور :</td>
                            <td style="width: 715px; height: 4px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtpwd_dup" runat="server" CssClass="txt_stl" ReadOnly="True"></asp:TextBox></td>
                            <td style="width: 17px; height: 4px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 6px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px; height: 6px;" class="td_txt_cnt">
                                نام کامل استاد :</td>
                            <td style="width: 715px; height: 6px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtname" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 17px; height: 6px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 12px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px; height: 12px;" class="td_txt_cnt">
                                تحصیلات :</td>
                            <td style="width: 715px; height: 12px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtedu" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 17px; height: 12px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 5px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px; height: 5px;" class="td_txt_cnt">
                                سن :</td>
                            <td style="width: 715px; height: 5px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtage" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 17px; height: 5px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 5px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px; height: 5px;" class="td_txt_cnt">
                                تلفن :</td>
                            <td style="width: 715px; height: 5px;" class="td_txt_cnt">
                                <asp:TextBox ID="txttel" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 17px; height: 5px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 15px" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px" class="td_txt_cnt">
                                پست الکترونیکی :</td>
                            <td style="width: 715px" class="td_txt_cnt">
                                <asp:TextBox ID="txtemail" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 17px" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 15px; height: 14px" class="td_txt_cnt">
                            </td>
                            <td style="width: 820px; height: 14px" class="td_txt_cnt">
                                آدرس محل زندگی :</td>
                            <td style="width: 715px; height: 14px" class="td_txt_cnt">
                                <asp:TextBox ID="txtaddr" runat="server" ReadOnly="True" CssClass="txt_stl" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                            <td style="width: 17px; height: 14px" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="4">
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 15px" class="td_none">
                            </td>
                            <td align="center" colspan="4" class="td_none">
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />&nbsp;
                                <asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btn_ok_Click"
                                    Text="حذف" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 14px; height: 13px">
                </td>
                <td style="width: 389px; height: 13px" align="center">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click">خروج از سیستم</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 389px" align="center">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
