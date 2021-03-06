<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list-student-unavailable.aspx.cs" Inherits="list_student_unavailable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>لیست دانشجویان تایید نشده</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 650px" align ="center">
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td style="width: 234px">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 13px">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 595px">
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="width: 28px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:GridView ID="grd_std" runat="server" AllowPaging="True"
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="Gray" BorderStyle="Solid"
                                    BorderWidth="1px" CellPadding="4" ForeColor="Black" Width="700px" EnableViewState="False">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="f_name" HeaderText="نام" />
                                        <asp:BoundField DataField="l_name" HeaderText="نام خانوادگی" />
                                        <asp:BoundField DataField="p_id" HeaderText="شماره دانشجویی" >
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="father_name" HeaderText="نام پدر" />
                                        <asp:BoundField DataField="email" HeaderText="ایمیل" />
                                        <asp:BoundField DataField="tel" HeaderText="تلفن" />
                                        <asp:TemplateField HeaderText = "انتخاب برای تایید">
                                        <EditItemTemplate>
                                                <asp:CheckBox ID="choose" runat="server" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="choose" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" />
                                        
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 12px" colspan="3">
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 12px">
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />
                                <asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btn_ok_Click"
                                    Text="ثبت تاییدیه" /></td>
                        </tr>
                        <tr>
                            <td style="height: 13px">
                            </td>
                            <td style="height: 13px">
                            </td>
                            <td style="width: 28px; height: 13px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 13px">
                                <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click1">خروج از سیستم</asp:LinkButton></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td style="width: 234px">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
