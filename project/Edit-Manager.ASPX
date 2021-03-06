<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit-Manager.aspx.cs" Inherits="Edit_Manager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>تغییر اطلاعات مدیر</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli_op">
            <tr>
                <td colspan="3" style="height: 119px">
                    <img src="images/top_edt_mng.gif" /></td>
            </tr>
            <tr>
                <td style="width: 157px">
                </td>
                <td style="width: 254px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 13px" align="center" colspan="3">
                    <table style="width: 447px" border="0" cellpadding="3" cellspacing="0">
                        <tr>
                            <td class="td_none" colspan="4">
                                ویرایش اطلاعات مدیر ارشد سایت</td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="4">
                                <span style="color: #ff0000">نام کاربری انگلیسی تایپ شود و ابتدا یک حرف وارد شود.</span></td>
                        </tr>
                        <tr>
                            <td style="height: 9px" class="td_txt_cnt">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtusr"
                                    Display="None" ErrorMessage="نام کاربری را صحیح وارد کنید" ValidationExpression="[a-zA-Z]+\w*">*</asp:RegularExpressionValidator></td>
                            <td style="height: 9px" class="td_txt_cnt">
                                نام کاربری جدید :</td>
                            <td style="height: 9px" class="td_txt_cnt">
                                <asp:TextBox ID="txtusr" runat="server" CssClass="txt_stl" MaxLength="20"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 9px; height: 9px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusr" ErrorMessage="نام کاربری جدید را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="height: 15px" class="td_txt_cnt">
                            </td>
                            <td style="height: 15px" class="td_txt_cnt">
                                کلمه عبور قبلی :</td>
                            <td style="height: 15px" class="td_txt_cnt">
                                <asp:TextBox ID="txtpwdprv" runat="server" CssClass="txt_stl" MaxLength="20" TextMode="Password"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 9px; height: 15px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="کلمه عبور قبلی را وارد کنید" ControlToValidate="txtpwdprv">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="height: 7px" class="td_txt_cnt">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpwd"
                                    Display="None" ErrorMessage="کلمه عبور از 6 تا 20 کاراکتر است" ValidationExpression=".{6,20}">*</asp:RegularExpressionValidator></td>
                            <td style="height: 7px" class="td_txt_cnt">
                                کلمه عبور جدید :</td>
                            <td style="height: 7px" class="td_txt_cnt">
                                <asp:TextBox ID="txtpwd" runat="server" CssClass="txt_stl" MaxLength="20" TextMode="Password"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 9px; height: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="کلمه عبور جدید را وارد کنید" ControlToValidate="txtpwd">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="height: 7px" class="td_txt_cnt">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtdup_pwd" ControlToValidate="txtpwd" Display="None" ErrorMessage="تکرار کلمع عبور درست نیست">*</asp:CompareValidator></td>
                            <td style="height: 7px" class="td_txt_cnt">
                                تکرار کلمه عبور جدید :</td>
                            <td style="height: 7px" class="td_txt_cnt">
                                <asp:TextBox ID="txtdup_pwd" runat="server" CssClass="txt_stl" MaxLength="20" TextMode="Password"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 9px; height: 7px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="کلمه عبور جدید را تکرارکنید" ControlToValidate="txtdup_pwd">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="height: 1px" class="td_none" colspan="4">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                    ShowMessageBox="True" ShowSummary="False" />
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="height: 28px" class="td_none" colspan="4">
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />
                                <asp:Button ID="btn_ok" runat="server" OnClick="btn_ok_Click" Text="تایید" CssClass="btn_stl" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 157px">
                </td>
                <td style="width: 254px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click" CausesValidation="False">خروج از سیستم</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="width: 157px">
                </td>
                <td style="width: 254px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
