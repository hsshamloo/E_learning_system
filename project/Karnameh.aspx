<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Karnameh.aspx.cs" Inherits="Karnameh" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ریز نمرات</title>
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
    <div align ="center">
        <table class="tbl_asli_op" style="width: 699px">
            <tr>
                <td colspan="3">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                        GridLines="None" Width="644px">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="crs_name" HeaderText="نام درس">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="type" HeaderText="نوع امتحان" />
                            <asp:BoundField DataField="ch_name" HeaderText="نام فصل" />
                            <asp:BoundField DataField="c_ans" HeaderText="پاسخ درست" />
                            <asp:BoundField DataField="ic_ans" HeaderText="پاسخ غلط" />
                            <asp:BoundField DataField="wo_ans" HeaderText="بدون پاسخ" />
                            <asp:BoundField DataField="grade" HeaderText="درصد پاسخ دهی">
                                <ItemStyle Width="90px" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3">
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" tabindex="5"
                        type="button" value="بستن پنجره" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click">خروج از سیستم</asp:LinkButton></td>
            </tr>
            <tr>
                <td colspan="3">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
