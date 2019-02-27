<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Content-Managment.aspx.cs" Inherits="Content_Managment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>مدیریت محتوا</title>
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
        <table class="tbl_asli_op" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3">
                    <img src="images/top_mng_cnt.gif" /></td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
                    <table style="width: 469px" border="0" cellpadding="3" cellspacing="0">
                        <tr>
                            <td class="td_none" colspan="4" style="height: 15px">
                                مدیریت محتوای دروس توسط استاد</td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 15px" class="td_none">
                                <asp:Button ID="btn_srch" runat="server" OnClick="Btn_srch_Click" Text="جستجو برای ویرایش" CausesValidation="False" CssClass="btn_stl" Width="120px" />&nbsp;
                                عنوان فصل :&nbsp;
                                <asp:DropDownList ID="drd_chapter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drd_chapter_SelectedIndexChanged" CssClass="txt_stl">
                                </asp:DropDownList>&nbsp; بخش ها :&nbsp;<asp:DropDownList ID="drd_sec" runat="server" CssClass="txt_stl">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 15px" class="td_txt_cnt">
                                </td>
                            <td class="td_txt_cnt" colspan="2">
                                عنوان بخش : &nbsp; &nbsp;&nbsp;
                                <asp:TextBox ID="txt_title" runat="server" CssClass="txt_stl" Enabled="False" MaxLength="50"></asp:TextBox></td>
                            <td style="width: 17px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_title"
                                    ErrorMessage="عنوان بخس را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 15px" class="td_txt_cnt">
                            </td>
                            <td style="width: 90px" class="td_txt_cnt" valign="top">
                                محتوا :</td>
                            <td style="width: 224px" class="td_txt_cnt">
                                <asp:TextBox ID="txt_cnt" runat="server" Height="300px" TextMode="MultiLine" Width="350px" CssClass="txt_stl" Enabled="False" MaxLength="8000"></asp:TextBox></td>
                            <td style="width: 17px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_cnt"
                                    ErrorMessage="وارد کردن محتوا ضروری است">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td_none">
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                    ShowMessageBox="True" ShowSummary="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td_none">
                                &nbsp;<input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="بستن پنجره" />
                                <asp:Button ID="btn_ok" runat="server" Text="ثبت" OnClick="btn_ok_Click" Visible="False" CssClass="btn_stl" />
                                <asp:Button ID="btn_edt" runat="server" OnClick="btn_edt_Click" Text="ویرایش" Visible="False" CssClass="btn_stl" /></td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" CausesValidation="False" OnClick="lbtn_logoff_Click1">خروج از سیستم</asp:LinkButton></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
