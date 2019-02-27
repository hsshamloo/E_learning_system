<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Min-Term.aspx.cs" Inherits="Quiz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>امتحان میان ترم</title>
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
    <div align="center">
        <table class="tbl_asli_op" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="color: red; height: 13px">
                    * از زدن دکمه Referesh جدا پرهیز کنید.این کار باعث پاک شدن پاسخ های شما میشود و
                    میبایستی دوباره به سوالات پاسخ دهید<br />
                    * اطلاعات اولیه این آزمون در پایگاه داده سایت ثبت گردیده است. اگر شما بدون پاسخ
                    دهی خارج شوید نمره شما صفر منظور خواهد شد.<br />
                    * در صورت تمایل میتوانید از ستون پاسخ داده برای مشخص کردن سوالات جواب داده شده و
                    بی جواب استفاده کنید ، تا برای جستجو دچار مشکل نشوید.</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 13px">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:GridView ID="grd_qst" runat="server" AutoGenerateColumns="False" Width="790px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="200" ShowFooter="True" EnableViewState="False">
                        <Columns>
                            <asp:TemplateField HeaderText="پاسخ داده">
                               <EditItemTemplate>
                                                <asp:CheckBox  ID="choose" runat="server" />
                                                
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                               <asp:CheckBox runat="server" ID="choose" />
                                            </ItemTemplate>
                                <ControlStyle BackColor="#FFE0C0" ForeColor="Red" />
                                <ItemStyle BackColor="#FFE0C0" ForeColor="Red" Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="سوال" DataField="qst" >
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ans_a" HeaderText="گزینه &quot;الف&quot;" />
                            <asp:BoundField DataField="ans_b" HeaderText="گزینه &quot;ب&quot;" />
                            <asp:BoundField DataField="ans_c" HeaderText="گزینه &quot;ج&quot;" />
                            <asp:BoundField DataField="ans_d" HeaderText="گزینه &quot;د&quot;" />
                            <asp:TemplateField HeaderText="انتخاب جواب" >
                            <ItemTemplate>
                            <asp:RadioButtonList runat="server" RepeatDirection= "Vertical" ID="ans">
                            <asp:ListItem Text="الف" Value ="1"></asp:ListItem>
                            <asp:ListItem Text="ب" Value ="2"></asp:ListItem>
                            <asp:ListItem Text="ج" Value ="3"></asp:ListItem>
                            <asp:ListItem Text="د" Value ="4"></asp:ListItem>
                            </asp:RadioButtonList>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:RadioButtonList runat="server" RepeatDirection= "Vertical" ID="ans">
                            <asp:ListItem Text="الف" Value ="1"></asp:ListItem>
                            <asp:ListItem Text="ب" Value ="2"></asp:ListItem>
                            <asp:ListItem Text="ج" Value ="3"></asp:ListItem>
                            <asp:ListItem Text="د" Value ="4"></asp:ListItem>
                            </asp:RadioButtonList>
                            </EditItemTemplate>
                                <ItemStyle Width="20px" HorizontalAlign="Right" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 16px;">
                    <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="btn_res" runat="server" Text="نتیجه امتحان" OnClick="btn_res_Click" CssClass="btn_stl_pnl" /></td>
            </tr>
            <tr>
                <td colspan="3">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 13px;">
                    <asp:Panel ID="Panel1" runat="server" Height="50px" Visible="False" Width="125px">
                        <table style="width: 233px" border="0" cellpadding="4" cellspacing="0">
                            <tr>
                                <td class="td_none" colspan="4">
                                    نتایج آزمون</td>
                            </tr>
                            <tr>
                                <td style="width: 8px" class="td_txt_cnt">
                                </td>
                                <td class="td_txt_cnt">
                                    <asp:Label ID="Label2" runat="server" CssClass="txt_er" Text="پاسخ درست :"></asp:Label>
                                </td>
                                <td style="width: 82px" class="td_txt_cnt">
                                    <asp:Label ID="lbl_cans" runat="server" CssClass="txt_er"></asp:Label></td>
                                <td style="width: 8px" class="td_txt_cnt">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 8px" class="td_txt_cnt">
                                </td>
                                <td class="td_txt_cnt">
                                    <asp:Label ID="Label4" runat="server" CssClass="txt_er" Text="پاسخ نادرست :"></asp:Label></td>
                                <td style="width: 82px" class="td_txt_cnt">
                                    <asp:Label ID="lbl_icans" runat="server" CssClass="txt_er"></asp:Label></td>
                                <td style="width: 8px" class="td_txt_cnt">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 8px" class="td_txt_cnt">
                                </td>
                                <td class="td_txt_cnt">
                                    <asp:Label ID="Label3" runat="server" CssClass="txt_er" Text="بی پاسخ :"></asp:Label></td>
                                <td style="width: 82px" class="td_txt_cnt">
                                    <asp:Label ID="lbl_woans" runat="server" CssClass="txt_er"></asp:Label></td>
                                <td style="width: 8px" class="td_txt_cnt">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 8px" class="td_txt_cnt">
                                </td>
                                <td class="td_txt_cnt">
                                    <asp:Label ID="Label1" runat="server" CssClass="txt_er" Text="درصد پاسخ دهی :"></asp:Label>
                                </td>
                                <td style="width: 82px" class="td_txt_cnt">
                                    <asp:Label ID="lbl_res" runat="server" CssClass="txt_er"></asp:Label></td>
                                <td style="width: 8px" class="td_txt_cnt">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 8px" class="td_none">
                                </td>
                                <td class="td_none">
                                </td>
                                <td style="width: 82px" class="td_none">
                                </td>
                                <td style="width: 8px" class="td_none">
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 13px">
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" tabindex="5"
                        type="button" value="بستن پنجره" /></td>
            </tr>
            <tr>
                <td colspan="3" style="height: 13px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
