<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register-question.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>اضافه سوال</title>
    <link href="css/def.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
   window.close();
}

// ]]>
</script>
</head>
<body class="csspage">
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli_op" style="width: 484px">
            <tr>
                <td>
                </td>
                <td>
                    <img src="images/top_reg_qst.gif" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
        <table border="0" cellpadding="2" cellspacing="0">
            <tr>
                <td class="td_none" style="height: 26px" colspan="4">
                    تعریف سوال توسط استاد</td>
            </tr>
            <tr>
                <td class="td_none" colspan="4" style="height: 26px">
                    نام درس :&nbsp;
                    <asp:Label ID="lbl_crs_name" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 3%; height: 21px">
                </td>
                <td class="td_txt_cnt" style="width: 122px; height: 21px">
                    صورت سوال :</td>
                <td style="width: 142px" class="td_txt_cnt">
                    <asp:TextBox ID="txt_question" runat="server" CssClass="txt_stl"
                        Font-Bold="False" Font-Italic="False" Rows="5"
                        TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                <td style="width: 6px; height: 21px" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        BorderColor="Red" ControlToValidate="txt_question" ErrorMessage="ذکر عنوان سوال ضروری است">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 3%; height: 26px">
                    </td>
                <td class="td_txt_cnt" style="width: 122px; height: 26px">
                    گزینه الف :</td>
                <td style="width: 142px; height: 26px" class="td_txt_cnt">
                    <asp:TextBox ID="Txt_ans_a" runat="server" CssClass="txt_stl"
                        Font-Bold="False" Font-Italic="False" Rows="3"
                        TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                <td style="width: 6px; height: 26px" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        BorderColor="Red" ControlToValidate="Txt_ans_a" ErrorMessage="پاسخ شماره 1 را فرا موش کرده اید">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 3%">
                    </td>
                <td class="td_txt_cnt" style="width: 122px">
                    گزینه ب :</td>
                <td style="width: 142px" class="td_txt_cnt">
                    <asp:TextBox ID="txt_ans_b" runat="server" CssClass="txt_stl"
                        Font-Bold="False" Font-Italic="False" Rows="3"
                        TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                <td style="width: 6px" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        BorderColor="Red" ControlToValidate="txt_ans_b" ErrorMessage="پاسخ شماره 2 را فرا موش کرده اید">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 3%;">
                    </td>
                <td class="td_txt_cnt" style="width: 122px;">
                    گزینه ج :</td>
                <td style="width: 142px;" class="td_txt_cnt">
                    <asp:TextBox ID="txt_ans_c" runat="server" CssClass="txt_stl"
                        Font-Bold="False" Font-Italic="False" Rows="3"
                        TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                <td style="width: 6px;" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        BorderColor="Red" ControlToValidate="txt_ans_c" ErrorMessage="پاسخ شماره 3 را فرا موش کرده اید">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 3%">
                    </td>
                <td class="td_txt_cnt" style="width: 122px">
                    گزینه د :</td>
                <td style="width: 142px" class="td_txt_cnt">
                    <asp:TextBox ID="txt_ans_d" runat="server" CssClass="txt_stl"
                        Font-Bold="False" Font-Italic="False" Rows="3"
                        TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                <td style="width: 6px" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        BorderColor="Red" ControlToValidate="txt_ans_d" ErrorMessage="پاسخ شماره 4 را فرا موش کرده اید" Display="Dynamic">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 3%">
                    </td>
                <td class="td_txt_cnt" style="width: 122px">
                    پاسخ درست :</td>
                <td style="width: 142px" class="td_txt_cnt">
                    <asp:RadioButtonList ID="rbl_ans" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow" TextAlign="Left" Width="193px">
                        <asp:ListItem Value="1">الف</asp:ListItem>
                        <asp:ListItem Value="2">ب</asp:ListItem>
                        <asp:ListItem Value="3">ج</asp:ListItem>
                        <asp:ListItem Value="4">د</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td style="width: 6px" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rbl_ans"
                        ErrorMessage="پاسخ صحیح را مشخص کنید">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 3%">
                    </td>
                <td class="td_txt_cnt" style="width: 122px">
                    نوع سوال :</td>
                <td style="width: 142px" class="td_txt_cnt">
                    <asp:DropDownList ID="drpdwn_q_type" runat="server" AutoPostBack="True" CssClass="txt_stl" OnSelectedIndexChanged="drpdwn_q_type_SelectedIndexChanged" BackColor="White">
                        <asp:ListItem Value="0">میان ترم</asp:ListItem>
                        <asp:ListItem Value="1">ترم</asp:ListItem>
                        <asp:ListItem Value="2">میان ترم - پایان ترم</asp:ListItem>
                        <asp:ListItem Value="3">میان ترم - کوییز</asp:ListItem>
                        <asp:ListItem Value="4">کوییز</asp:ListItem>
                        <asp:ListItem Value="5">کوییز - پایان ترم</asp:ListItem>
                        <asp:ListItem Value="6">میان ترم - کوییز - پایان ترم</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 6px" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drpdwn_q_type"
                        ErrorMessage="نوع سوال را تعیین کنید">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 3%; height: 21px">
                </td>
                <td class="td_txt_cnt" style="width: 122px; height: 21px">
                    <asp:Label ID="lbl_chapter" runat="server" Text="فصل :" Visible="False"></asp:Label></td>
                <td style="width: 142px" class="td_txt_cnt">
                    <asp:DropDownList ID="drd_chapter" runat="server" CssClass="txt_stl" Visible="False">
                    </asp:DropDownList></td>
                <td style="width: 6px; height: 21px" class="td_txt_cnt">
                </td>
            </tr>
            <tr>
                <td class="td_none" style="height: 21px" colspan="4">
                    <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                        ShowMessageBox="True" ShowSummary="False" />
                </td>
            </tr>
            <tr>
                <td class="td_none" style="height: 21px" align="center" colspan="4">
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                        value="انصراف" />
                    <asp:Button ID="btn_add_quest" runat="server" Text="انجام شود" CssClass="btn_stl" OnClick="btn_add_quest_Click" /></td>
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
