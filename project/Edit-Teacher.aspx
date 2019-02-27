<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit-Teacher.aspx.cs" Inherits="Edit_Teacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ویرایش استاد</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 500px">
            <tr>
                <td style="height: 11px;" colspan="3">
                    <img src="images/top_edt_tch.gif" /></td>
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
                <td>
                </td>
                <td align="center" colspan="2">
                    <table border="0" cellpadding="1" cellspacing="0" style="width: 411px">
                        <tr>
                            <td class="td_none" colspan="4">
                                ویرایش اطلاعات استاد</td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_none">
                            </td>
                            <td style="width: 2375px" class="td_none">
                                <asp:Button ID="btn_srch" runat="server" OnClick="btn_srch_Click" Text="جستجو" CssClass="btn_stl" CausesValidation="False" /></td>
                            <td style="width: 197px" class="td_none">
                                <asp:DropDownList ID="drdtch_name" runat="server" CssClass="txt_stl">
                                </asp:DropDownList></td>
                            <td class="td_none" style="width: 21px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                            </td>
                            <td style="width: 2375px" class="td_txt_cnt">
                                کد استاد (کلمه کاربری) :</td>
                            <td style="width: 197px" class="td_txt_cnt">
                                <asp:TextBox ID="txtid" runat="server" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 21px">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 73px; height: 3px;" class="td_txt_cnt">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpwd"
                                    ControlToValidate="txtpwd_dup" Display="None" ErrorMessage="تکرار کلمه عبور را صحیح وارد کنید">*</asp:CompareValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpwd"
                                    Display="None" ErrorMessage="کلمه عبور از 6 تا 20 کاراکتر است" ValidationExpression=".{6,20}">*</asp:RegularExpressionValidator></td>
                            <td style="width: 2375px; height: 3px;" class="td_txt_cnt">
                                کلمه عبور :</td>
                            <td style="width: 197px; height: 3px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtpwd" runat="server" CssClass="txt_stl" TextMode="Password" MaxLength="20"></asp:TextBox>&nbsp;
                                </td>
                            <td style="height: 3px; width: 21px;" class="td_txt_cnt">
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpwd"
                                    ErrorMessage="کلمه عبور را وارد کنید" Height="4px" Width="4px">*</asp:RequiredFieldValidator>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                            </td>
                            <td style="width: 2375px" class="td_txt_cnt">
                                تکرار کلمه عبور :</td>
                            <td style="width: 197px" class="td_txt_cnt">
                                <asp:TextBox ID="txtpwd_dup" runat="server" CssClass="txt_stl" TextMode="Password" MaxLength="20"></asp:TextBox>
                            </td>
                            <td class="td_txt_cnt" style="width: 21px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd_dup"
                                    ErrorMessage="تکرار کلمه عبور را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                                </td>
                            <td style="width: 2375px" class="td_txt_cnt">
                                نام کامل استاد :</td>
                            <td style="width: 197px" class="td_txt_cnt">
                                <asp:TextBox ID="txtname" runat="server" CssClass="txt_stl" MaxLength="20"></asp:TextBox>
                            </td>
                            <td class="td_txt_cnt" style="width: 21px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtname"
                                    ErrorMessage="نام استاد را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px; height: 17px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 2375px; height: 17px;" class="td_txt_cnt">
                                تحصیلات :</td>
                            <td style="width: 197px; height: 17px;" class="td_txt_cnt">
                                
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 571px" align="center">
                                            <asp:Label ID="lbledu" runat="server"></asp:Label></td>
                                        <td style="width: 90px">
                                            </td>
                                        <td style="width: 130px">
                                            <asp:DropDownList ID="drd_edu" runat="server" CssClass="txt_stl">
                                                <asp:ListItem>لیسانس</asp:ListItem>
                                                <asp:ListItem>فوق لیسانس</asp:ListItem>
                                                <asp:ListItem>دکترا</asp:ListItem>
                                                <asp:ListItem>فوق دکترا</asp:ListItem>
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 17px; width: 21px;" valign="top" class="td_txt_cnt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 73px; height: 25px;" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtage"
                                    Display="None" ErrorMessage="سن استاد بین 20 تا 80 می باشد" MaximumValue="80"
                                    MinimumValue="20">*</asp:RangeValidator></td>
                            <td style="width: 2375px; height: 25px;" class="td_txt_cnt">
                                سن :</td>
                            <td style="width: 197px; height: 25px;" class="td_txt_cnt">
                                <asp:TextBox ID="txtage" runat="server" CssClass="txt_stl" MaxLength="2"></asp:TextBox>
                            </td>
                            <td class="td_txt_cnt" style="width: 21px; height: 25px;">
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtage"
                                    ErrorMessage="سن  را وارد کنید" Height="4px" Width="4px">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px; height: 25px;" class="td_txt_cnt">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txttel"
                                    Display="None" ErrorMessage="تلفن را صحیح وارد کنید" ValidationExpression="[1-9]+\d{9,13}">*</asp:RegularExpressionValidator></td>
                            <td style="width: 2375px; height: 25px;" class="td_txt_cnt">
                                تلفن :</td>
                            <td style="width: 197px; height: 25px;" class="td_txt_cnt">
                                <asp:TextBox ID="txttel" runat="server" CssClass="txt_stl" MaxLength="15"></asp:TextBox>(0)</td>
                            <td class="td_txt_cnt" style="width: 21px; height: 25px">
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txttel"
                                    ErrorMessage="تلفن را وارد کنید" Height="4px" Width="4px">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px" class="td_txt_cnt">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail"
                                    Display="None" ErrorMessage="ایمیل را صحیح وارد کنید" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator></td>
                            <td style="width: 2375px" class="td_txt_cnt">
                                پست الکترونیکی :</td>
                            <td style="width: 197px" class="td_txt_cnt">
                                <asp:TextBox ID="txtemail" runat="server" CssClass="txt_stl" MaxLength="50"></asp:TextBox>
                            </td>
                            <td class="td_txt_cnt" style="width: 21px">
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtemail"
                                    ErrorMessage="پست الکترونیکی را وارد کنید" Height="4px" Width="4px">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 73px; height: 14px" class="td_txt_cnt">
                                </td>
                            <td style="width: 2375px; height: 14px" class="td_txt_cnt">
                                آدرس محل زندگی :</td>
                            <td style="width: 197px; height: 14px" class="td_txt_cnt">
                                <asp:TextBox ID="txtaddr" runat="server" CssClass="txt_stl" TextMode="MultiLine" Width="200px" MaxLength="200"></asp:TextBox></td>
                            <td style="height: 14px; width: 21px;" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtaddr"
                                    ErrorMessage="آدرس را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="4">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                    ShowMessageBox="True" ShowSummary="False" />
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="5">
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />&nbsp;
                                <asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btn_ok_Click"
                                    Text="ثبت شود" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 11px">
                </td>
                <td style="width: 368px; height: 11px">
                </td>
                <td style="height: 11px">
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
    
    </form>
</body>
</html>
