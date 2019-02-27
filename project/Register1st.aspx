<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register1st.aspx.cs" Inherits="RegisterF" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>مرحله اول ثبت نام</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 500px" >
            <tr>
                <td colspan="2">
                    <img src="images/top_reg_std_1.gif" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 110px">
                </td>
                <td style="width: 452px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 15px" align="center" colspan="2">
                    <table border="0" cellpadding="2" cellspacing="0" style="width: 416px">
                        <tr>
                            <td align="center" class="td_none" colspan="3">
                                مرحله اول ثبت نام برای دانشجویان</td>
                            <td align="center" class="td_none" colspan="1" style="width: 56px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="td_none" colspan="3">
                                <span style="color: red">نام کاربری انگلیسی تایپ شود و ابتدا یک حرف وارد شود.</span></td>
                            <td align="center" class="td_none" colspan="1" style="width: 56px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 13px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtusr"
                                    Display="None" ErrorMessage="نام کاربری را صحیح وارد کنید" ValidationExpression="[a-zA-Z]+\w*">*</asp:RegularExpressionValidator></td>
                            <td style="width: 33593px; height: 13px;" class="td_txt_cnt" align="right">
                                نام کاربری :</td>
                            <td style="width: 265px;" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txtusr" runat="server" CssClass="txt_stl" MaxLength="20"></asp:TextBox></td>
                            <td align="right" class="td_txt_cnt" style="width: 56px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusr"
                                    ErrorMessage="نام کاربری را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtpwd"
                                    Display="None" ErrorMessage="کلمه عبور از 6 تا 20 کاراکتر است" ValidationExpression=".{6,20}">*</asp:RegularExpressionValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" Display="None" ErrorMessage="تکرار کلمه عبور صحیح نیست" ControlToCompare="txtpwd" ControlToValidate="txtpwd_dup">*</asp:CompareValidator>
                                </td>
                            <td style="width: 33593px" class="td_txt_cnt" align="right">
                                کلمه عبور :</td>
                            <td style="width: 265px" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txtpwd" runat="server" CssClass="txt_stl" MaxLength="20" TextMode="Password"></asp:TextBox></td>
                            <td align="right" class="td_txt_cnt" style="width: 56px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd"
                                    ErrorMessage="کلمه عبور را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 15px">
                            </td>
                            <td style="width: 33593px; height: 15px" class="td_txt_cnt" align="right">
                                تکرار کلمه عبور :</td>
                            <td style="width: 265px;" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txtpwd_dup" runat="server" CssClass="txt_stl" MaxLength="20" TextMode="Password"></asp:TextBox></td>
                            <td align="right" class="td_txt_cnt" style="width: 56px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpwd_dup"
                                    ErrorMessage="تکرار کلمه عبور را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 15px">
                                </td>
                            <td style="width: 33593px; height: 15px" class="td_txt_cnt" align="right">
                                نام :</td>
                            <td style="width: 265px;" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txtname" runat="server" CssClass="txt_stl" MaxLength="15"></asp:TextBox></td>
                            <td align="right" class="td_txt_cnt" style="width: 56px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtname"
                                    ErrorMessage="نام را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 15px">
                                </td>
                            <td style="width: 33593px; height: 15px" class="td_txt_cnt" align="right">
                                نام خانوادگی :</td>
                            <td style="width: 265px;" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txtfamily" runat="server" CssClass="txt_stl" MaxLength="25"></asp:TextBox></td>
                            <td align="right" class="td_txt_cnt" style="width: 56px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtfamily"
                                    ErrorMessage="نام خانوادگی را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 10px" valign="top">
                            </td>
                            <td style="width: 33593px; height: 10px" class="td_txt_cnt" align="right" valign="top">
                                تاریخ تولد به ترتیب از سمت چپ به راست (سال/ماه/روز)</td>
                            <td style="width: 265px; height: 10px" class="td_txt_cnt" align="right" valign="top">
                                <table>
                                    <tr>
                                        <td style="width: 3px">
                                            <asp:DropDownList ID="drdday" runat="server" CssClass="txt_stl" Width="80px">
                                            </asp:DropDownList></td>
                                        <td style="width: 4px">
                                            <asp:DropDownList ID="drdmon" runat="server" CssClass="txt_stl" Width="80px" AutoPostBack="True" OnSelectedIndexChanged="drdmon_SelectedIndexChanged">
                                            </asp:DropDownList></td>
                                        <td>
                                            <asp:DropDownList ID="drdyear" runat="server" CssClass="txt_stl" Width="80px">
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" class="td_txt_cnt" style="height: 10px; width: 56px;" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 25px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="None"
                                    ErrorMessage="شماره دانشجویی 6 تا 20 رقم می باشد" ControlToValidate="txtp_id" ValidationExpression="\d{6,20}">*</asp:RegularExpressionValidator>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtp_id"
                                    ErrorMessage="شماره دانشجویی را صحیح وارد کنید" MaximumValue="99999999999999999999"
                                    MinimumValue="100000">*</asp:RangeValidator></td>
                            <td style="width: 33593px; height: 25px" class="td_txt_cnt" align="right">
                                شماره دانشجویی :</td>
                            <td style="width: 265px; height: 25px;" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txtp_id" runat="server" CssClass="txt_stl" MaxLength="20"></asp:TextBox></td>
                            <td align="right" class="td_txt_cnt" style="height: 25px; width: 56px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtp_id"
                                    ErrorMessage="شماره دانشجویی را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 15px">
                                </td>
                            <td style="width: 33593px; height: 15px" class="td_txt_cnt" align="right">
                                نام پدر :</td>
                            <td style="width: 265px;" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txt_father" runat="server" CssClass="txt_stl" MaxLength="15"></asp:TextBox></td>
                            <td align="right" class="td_txt_cnt" style="width: 56px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_father"
                                    ErrorMessage="نام پدر را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 25px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="None"
                                    ErrorMessage="ایمیل را صحیح وارد کنید" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator></td>
                            <td style="width: 33593px; height: 25px" class="td_txt_cnt" align="right">
                                پست الکترونیکی :</td>
                            <td style="width: 265px;" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txtemail" runat="server" CssClass="txt_stl" MaxLength="50"></asp:TextBox></td>
                            <td align="right" class="td_txt_cnt" style="width: 56px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtemail"
                                    ErrorMessage="پست الکترونیکی را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 968px; height: 15px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None"
                                    ErrorMessage="تلفن را صحیح وارد کنید" ControlToValidate="txttel" ValidationExpression="[1-9]+\d{9,13}">*</asp:RegularExpressionValidator></td>
                            <td style="width: 33593px; height: 15px" class="td_txt_cnt" align="right">
                                تلفن : (با کد)</td>
                            <td style="width: 265px;" class="td_txt_cnt" align="right">
                                <asp:TextBox ID="txttel" runat="server" CssClass="txt_stl" MaxLength="15"></asp:TextBox>&nbsp;
                                (0)</td>
                            <td align="right" class="td_txt_cnt" style="width: 56px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txttel"
                                    ErrorMessage="تلفن را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="center" class="td_none" colspan="3" style="height: 15px">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                    ShowMessageBox="True" ShowSummary="False" />
                                <asp:Label ID="lbler" runat="server" CssClass="txt_er"></asp:Label></td>
                            <td align="center" class="td_none" colspan="1" style="height: 15px; width: 56px;">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="td_none" style="width: 968px; height: 25px">
                            </td>
                            <td align="right" class="td_none" style="width: 33593px; height: 25px">
                            </td>
                            <td align="left" class="td_none" style="width: 265px; height: 25px;">
                                <input id="Button1" class="btn_stl" type="button" value="انصراف" onclick="return Button1_onclick()" />
                                <asp:Button ID="btnclear" runat="server" CssClass="btn_stl" Text="پاک کردن" CausesValidation="False" OnClick="btnclear_Click" />
                                <asp:Button ID="btnnext" runat="server" CssClass="btn_stl" Text="مرحله بعدی" OnClick="btnnext_Click" /></td>
                            <td align="left" class="td_none" style="height: 25px; width: 56px;">
                            </td>
                        </tr>
                        
                    </table>
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="width: 110px; height: 13px;">
                </td>
                <td style="width: 452px; height: 13px;">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td style="width: 110px; height: 13px;">
                </td>
                <td style="width: 452px; height: 13px;">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td style="width: 110px; height: 16px">
                </td>
                <td style="width: 452px; height: 16px">
                </td>
                <td style="height: 16px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
