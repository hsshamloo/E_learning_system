<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Select-Chapter.aspx.cs" Inherits="_Select_Chapter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>انتخاب فصل برای آموزش</title>
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
                <td colspan="3">
                    <img src="images/top_sel_ch.gif" /></td>
            </tr>
            <tr>
                <td style="height: 13px" align="center" colspan="3" valign="middle">
                    نام درس :&nbsp;
                    <asp:Label ID="lbl_crs" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
                    <asp:GridView ID="grd_ch" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
                        CellSpacing="1" GridLines="None" ShowFooter="True" Width="343px">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <Columns>
                            <asp:HyperLinkField DataTextField="ch_name" HeaderText="نام فصل" DataNavigateUrlFields="ch_id,ch_name" DataNavigateUrlFormatString="Learn/Learn-Course.aspx?id={0}&amp;namechapter={1}" Target="_blank"/>
                            <asp:HyperLinkField DataNavigateUrlFields="ch_id" DataNavigateUrlFormatString="quiz.aspx?id={0}"
                                HeaderText="کوئیز(اختیاری)" Text="کوئیز" Target="_blank" />
                        </Columns>
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
                <td align="center" colspan="3" style="height: 13px">
                    <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                        value="انصراف" />
                    </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 17px" align="center" colspan="3">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click">خروج از سیستم</asp:LinkButton></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
