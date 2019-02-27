<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit-Question.aspx.cs" Inherits="Edit_Question" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ویرایش و حذف سوالات</title>
    <link href="css/def.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
// <!CDATA[

function btn_cancel_onclick() {
window.close();
}

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <table class="tbl_asli_op" border="0" cellpadding="2" cellspacing="0">
            <tr>
                <td colspan="3">
                    <img src="images/top_edt_del_qst.gif" /></td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 507px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 507px">
                    <asp:GridView ID="grd_qst" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="None" ShowFooter="True" Width="470px" EnableViewState="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" >
                        <Columns>
                            <asp:BoundField   DataField="id_question" HeaderText="شماره سوال" />
                            <asp:BoundField HeaderText="عنوان سوال" DataField="qst" >
                                <ControlStyle BorderStyle="Outset" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="نام فصل" DataField="ch_name" />
                            <asp:BoundField HeaderText="نوع سوال" DataField="qst_type" />
                            <asp:TemplateField   HeaderText="حذف">
                            <EditItemTemplate>
                                                <asp:CheckBox ID="choose" runat="server" />
                             </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="choose" runat="server" />
                                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField HeaderText="ویرایش" Text="ویرایش" DataNavigateUrlFields="id_question" DataNavigateUrlFormatString="edit-question.aspx?id={0}"   />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center" style="width: 507px">
                    <asp:Label ID="lbl_mess" runat="server" CssClass="txt_er"></asp:Label>
                                    <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 507px" align="center">
                    &nbsp;<asp:Button ID="btn_ok" runat="server" Text="حذف شود" CssClass="btn_stl" OnClick="btn_ok_Click" />
                    <input id="btn_cancel" type="button" value="انصرااف" class="btn_stl" onclick="return btn_cancel_onclick()" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center" style="width: 507px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center" style="width: 507px">
                                    <asp:LinkButton ID="lbtn_logoff" runat="server" CausesValidation="False" OnClick="lbtn_logoff_Click">خروج از سیستم</asp:LinkButton></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 507px">
                    </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 507px" align="center">
                    <asp:Panel ID="edit_panel" runat="server" Height="50px" Visible="False" Width="125px">
                        <table border="0" cellpadding="2" cellspacing="0" style="width: 407px">
                            <tr>
                                <td class="td_none" style="height: 26px" colspan="4">
                                    ویرایش سوالات</td>
                            </tr>
                            <tr>
                                <td class="td_none" colspan="4" style="height: 26px">
                                    نام درس : &nbsp;
                                    <asp:Label ID="lbl_crs_name" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="td_txt_cnt" style="width: 3%; height: 21px">
                                </td>
                                <td class="td_txt_cnt" style="width: 122px; height: 21px">
                                    صورت سوال :</td>
                                <td class="td_txt_cnt" style="width: 142px">
                                    <asp:TextBox ID="txt_question" runat="server" CssClass="txt_stl"
                                        Font-Bold="False" Font-Italic="False" Rows="5"
                                        TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                                <td class="td_txt_cnt" style="width: 6px; height: 21px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BorderColor="Red"
                                        ControlToValidate="txt_question" ErrorMessage="ذکر عنوان سوال ضروری است">*</asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="td_txt_cnt" style="width: 3%; height: 26px">
                                </td>
                                <td class="td_txt_cnt" style="width: 122px; height: 26px">
                                    گزینه الف :</td>
                                <td class="td_txt_cnt" style="width: 142px; height: 26px">
                                    <asp:TextBox ID="Txt_ans_a" runat="server" CssClass="txt_stl" Font-Bold="False"
                                        Font-Italic="False" Rows="3" TextMode="MultiLine"
                                        Width="200px"></asp:TextBox></td>
                                <td class="td_txt_cnt" style="width: 6px; height: 26px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BorderColor="Red"
                                        ControlToValidate="Txt_ans_a" ErrorMessage="پاسخ شماره 1 را فرا موش کرده اید">*</asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="td_txt_cnt" style="width: 3%">
                                </td>
                                <td class="td_txt_cnt" style="width: 122px">
                                    گزینه ب :</td>
                                <td class="td_txt_cnt" style="width: 142px">
                                    <asp:TextBox ID="txt_ans_b" runat="server" CssClass="txt_stl" Font-Bold="False"
                                        Font-Italic="False" Rows="3" TextMode="MultiLine"
                                        Width="200px"></asp:TextBox></td>
                                <td class="td_txt_cnt" style="width: 6px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BorderColor="Red"
                                        ControlToValidate="txt_ans_b" ErrorMessage="پاسخ شماره 2 را فرا موش کرده اید">*</asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td class="td_txt_cnt" style="width: 3%">
                                </td>
                                <td class="td_txt_cnt" style="width: 122px">
                                    گزینه ج :</td>
                                <td class="td_txt_cnt" style="width: 142px">
                                    <asp:TextBox ID="txt_ans_c" runat="server" CssClass="txt_stl" Font-Bold="False"
                                        Font-Italic="False" Rows="3" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                                <td class="td_txt_cnt" style="width: 6px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BorderColor="Red"
                                        ControlToValidate="txt_ans_c" ErrorMessage="پاسخ شماره 3 را فرا موش کرده اید">*</asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="td_txt_cnt" style="width: 3%; height: 25px;">
                                </td>
                                <td class="td_txt_cnt" style="width: 122px; height: 25px;">
                                    گزینه د :</td>
                                <td class="td_txt_cnt" style="width: 142px; height: 25px;">
                                    <asp:TextBox ID="txt_ans_d" runat="server" CssClass="txt_stl" Font-Bold="False"
                                        Font-Italic="False" Rows="3" TextMode="MultiLine"
                                        Width="200px"></asp:TextBox></td>
                                <td class="td_txt_cnt" style="width: 6px; height: 25px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BorderColor="Red"
                                        ControlToValidate="txt_ans_d" Display="Dynamic" ErrorMessage="پاسخ شماره 4 را فرا موش کرده اید">*</asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="td_txt_cnt" style="width: 3%">
                                </td>
                                <td class="td_txt_cnt" style="width: 122px">
                                    پاسخ درست :</td>
                                <td class="td_txt_cnt" style="width: 142px">
                                    <asp:RadioButtonList ID="rbl_ans" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                        TextAlign="Left" Width="193px">
                                        <asp:ListItem Value="1">الف</asp:ListItem>
                                        <asp:ListItem Value="2">ب</asp:ListItem>
                                        <asp:ListItem Value="3">ج</asp:ListItem>
                                        <asp:ListItem Value="4">د</asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td class="td_txt_cnt" style="width: 6px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rbl_ans"
                                        ErrorMessage="پاسخ صحیح را مشخص کنید">*</asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="td_txt_cnt" style="width: 3%; height: 25px">
                                </td>
                                <td class="td_txt_cnt" style="width: 122px; height: 25px">
                                    نوع سوال :</td>
                                <td class="td_txt_cnt" style="width: 142px; height: 25px">
                                    <asp:DropDownList ID="drpdwn_q_type" runat="server" AutoPostBack="True" BackColor="White"
                                        CssClass="txt_stl" OnSelectedIndexChanged="drpdwn_q_type_SelectedIndexChanged">
                                        <asp:ListItem Value="0">میان ترم</asp:ListItem>
                                        <asp:ListItem Value="1">ترم</asp:ListItem>
                                        <asp:ListItem Value="2">میان ترم - پایان ترم</asp:ListItem>
                                        <asp:ListItem Value="3">میان ترم - کوییز</asp:ListItem>
                                        <asp:ListItem Value="4">کوییز</asp:ListItem>
                                        <asp:ListItem Value="5">کوییز - پایان ترم</asp:ListItem>
                                        <asp:ListItem Value="6">میان ترم - کوییز - پایان ترم</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td class="td_txt_cnt" style="width: 6px; height: 25px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drpdwn_q_type"
                                        ErrorMessage="نوع سوال را تعیین کنید">*</asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="td_txt_cnt" style="width: 3%; height: 21px">
                                </td>
                                <td class="td_txt_cnt" style="width: 122px; height: 21px">
                                    <asp:Label ID="lbl_chapter" runat="server" Text="فصل :" Visible="False"></asp:Label></td>
                                <td class="td_txt_cnt" style="width: 142px">
                                    <asp:DropDownList ID="drd_chapter" runat="server" CssClass="txt_stl" Visible="False" >
                                    </asp:DropDownList></td>
                                <td class="td_txt_cnt" style="width: 6px; height: 21px">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_none" colspan="4" style="height: 21px">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                        ShowMessageBox="True" ShowSummary="False" />
                                    </td>
                            </tr>
                            <tr>
                                <td align="center" class="td_none" colspan="4" style="height: 21px">
                                    <input id="Button3" class="btn_stl" onclick="return btn_cancel_onclick()" type="button"
                                        value="انصراف" />
                                    <asp:Button ID="btn_upd_quest" runat="server" CssClass="btn_stl" OnClick="btn_upd_quest_Click"
                                        Text="ثبت شود" /></td>
                            </tr>
                            <tr>
                                <td align="center" class="td_none" colspan="4" style="height: 21px">
                                    </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </center>
    </div>
    </form>
</body>
</html>
