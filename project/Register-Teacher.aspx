<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register-Teacher.aspx.cs" Inherits="Register_Teacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ثبت استاد</title>
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
                <td style="height: 13px" colspan="3">
                    <img src="images/top_reg_tch.gif" /></td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 368px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <table border="0" cellpadding="2" cellspacing="0" style="width: 371px">
                        <tr>
                            <td class="td_none" colspan="4">
                                ثبت نام استاد توسط مدیر</td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="4">
                                <span style="color: #ff0000">نام کاربری انگلیسی تایپ شود و ابتدا یک حرف وارد شود.</span></td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtid"
                                    Display="None" ErrorMessage="نام کاربری را صحیح وارد کنید" ValidationExpression="[a-zA-Z]+\w*">*</asp:RegularExpressionValidator></td>
                            <td style="width: 2461px" class="td_txt_cnt">
                                کد استاد (کلمه کاربری) :</td>
                            <td style="width: 161px" class="td_txt_cnt">
                                <asp:TextBox ID="txtid" runat="server" CssClass="txt_stl" MaxLength="20"></asp:TextBox></td>
                            <td style="width: 55px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="کد استاد را وارد کنید" ControlToValidate="txtid">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_dup_pwd"
                                    ControlToValidate="txtpwd" Display="None" ErrorMessage="تکرار کلمه عبور صحیح نیست">*</asp:CompareValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpwd"
                                    Display="None" ErrorMessage="کلمه عبور از 6 تا 20 کاراکتر است" ValidationExpression=".{6,20}">*</asp:RegularExpressionValidator></td>
                            <td style="width: 2461px" class="td_txt_cnt">
                                کلمه عبور :</td>
                            <td style="width: 161px" class="td_txt_cnt">
                                <asp:TextBox ID="txtpwd" runat="server" CssClass="txt_stl" MaxLength="20" TextMode="Password"></asp:TextBox></td>
                            <td style="width: 55px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="کلمه عبور را وارد کنید" ControlToValidate="txtpwd">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 73px">
                            </td>
                            <td class="td_txt_cnt" style="width: 2461px">
                                تکرار کلمه عبور :</td>
                            <td class="td_txt_cnt" style="width: 161px">
                                <asp:TextBox ID="txt_dup_pwd" runat="server" CssClass="txt_stl" TextMode="Password"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 55px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                                </td>
                            <td style="width: 2461px" class="td_txt_cnt">
                                نام کامل استاد :</td>
                            <td style="width: 161px" class="td_txt_cnt">
                                <asp:TextBox ID="txtname" runat="server" CssClass="txt_stl" MaxLength="40"></asp:TextBox></td>
                            <td style="width: 55px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="نام استاد را وارد کنید" ControlToValidate="txtname">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                            </td>
                            <td style="width: 2461px" class="td_txt_cnt">
                                تحصیلات :</td>
                            <td style="width: 161px" class="td_txt_cnt">
                                <asp:DropDownList ID="drd_edu" runat="server" CssClass="txt_stl">
                                    <asp:ListItem>لیسانس</asp:ListItem>
                                    <asp:ListItem>فوق لیسانس</asp:ListItem>
                                    <asp:ListItem>دکترا</asp:ListItem>
                                    <asp:ListItem>فوق دکترا</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 55px" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator1" runat="server" Display="None" ErrorMessage="سن استاد بین 20 تا 80 میباشد" ControlToValidate="txtage" MaximumValue="80" MinimumValue="20">*</asp:RangeValidator></td>
                            <td style="width: 2461px" class="td_txt_cnt">
                                سن :</td>
                            <td style="width: 161px" class="td_txt_cnt">
                                <asp:TextBox ID="txtage" runat="server" CssClass="txt_stl" MaxLength="2"></asp:TextBox></td>
                            <td style="width: 55px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="سن استاد را وارد کنید" ControlToValidate="txtage">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None"
                                    ErrorMessage="تلفن را صحیح وارد کنید" ControlToValidate="txttel" ValidationExpression="[1-9]+\d{9,13}">*</asp:RegularExpressionValidator></td>
                            <td style="width: 2461px" class="td_txt_cnt">
                                تلفن :</td>
                            <td style="width: 161px" class="td_txt_cnt">
                                <asp:TextBox ID="txttel" runat="server" CssClass="txt_stl" MaxLength="15"></asp:TextBox>(0)</td>
                            <td style="width: 55px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="تلفن را وارد کنید" ControlToValidate="txttel">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="None"
                                    ErrorMessage="ایمیل را صحیح وارد کنید" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator></td>
                            <td style="width: 2461px" class="td_txt_cnt">
                                پست الکترونیکی :</td>
                            <td style="width: 161px" class="td_txt_cnt">
                                <asp:TextBox ID="txtemail" runat="server" CssClass="txt_stl" MaxLength="50"></asp:TextBox></td>
                            <td style="width: 55px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="پست الکترونیکی را وارد کنید" ControlToValidate="txtemail">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px; height: 14px" class="td_txt_cnt">
                                </td>
                            <td style="width: 2461px; height: 14px" class="td_txt_cnt">
                                آدرس محل زندگی :</td>
                            <td style="width: 161px; height: 14px" class="td_txt_cnt">
                                <asp:TextBox ID="txtaddr" runat="server" CssClass="txt_stl" MaxLength="200" TextMode="MultiLine" Width="200px" Height="66px"></asp:TextBox></td>
                            <td style="width: 55px; height: 14px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="آدرس را وارد کنید" ControlToValidate="txtaddr">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="4">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                    ShowMessageBox="True" ShowSummary="False" />
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_none">
                            </td>
                            <td align="center" colspan="4" class="td_none">
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />
                                &nbsp;<asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btn_ok_Click"
                                    Text="ثبت شود" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 13px;">
                </td>
                <td style="width: 368px; height: 13px;">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click" CausesValidation="False">خروج از سیستم</asp:LinkButton></td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 368px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
