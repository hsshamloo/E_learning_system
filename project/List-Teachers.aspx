<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List-Teachers.aspx.cs" Inherits="List_Teacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>لیست استادان</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 650px">
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 13px">
                </td>
                <td style="height: 13px" align="center">
                    <table style="width: 595px" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="width: 95px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:GridView ID="grd_tch" runat="server" AllowPaging="True"
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="Gray" BorderStyle="Solid"
                                    BorderWidth="1px" CellPadding="4" ForeColor="Black">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="teacher_id" HeaderText="کد استاد" SortExpression="teacher_id" />
                                        <asp:BoundField DataField="name_teacher" HeaderText="نام استاد" SortExpression="name_teacher" />
                                        <asp:BoundField DataField="pwd" HeaderText="پسورد" SortExpression="pwd" />
                                        <asp:BoundField DataField="education" HeaderText="تحصیلات" />
                                        <asp:BoundField DataField="tel" HeaderText="تلفن" />
                                        <asp:BoundField DataField="age" HeaderText="سن" />
                                        <asp:BoundField DataField="email" HeaderText="ایمیل" />
                                        <asp:BoundField DataField="addr_living" HeaderText="آدرس" />
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
                            <td colspan="3"><br /><br />
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="بستن پنجره" /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <br />
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <br />
                                <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click1">خروج از سیستم</asp:LinkButton></td>
                        </tr>
                    </table>
                </td>
                <td style="height: 13px">
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
