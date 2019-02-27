<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List-Students.aspx.cs" Inherits="List_Student" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>لیست دانشجویان</title>
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
        <div>
            <div>
                <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 700px">
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
                            <table style="width: 595px" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td style="width: 29px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="3">
                                        <asp:GridView ID="grd_crs" runat="server" AllowPaging="True" AllowSorting="True"
                                            AutoGenerateColumns="False" BackColor="White" BorderColor="Gray" BorderStyle="Solid"
                                            BorderWidth="1px" CellPadding="4" ForeColor="Black" Width="667px">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="f_name" HeaderText="نام" />
                                                <asp:BoundField DataField="l_name" HeaderText="نام خانوادگی" />
                                                <asp:BoundField DataField="p_id" HeaderText="شماره دانشجویی" />
                                                <asp:BoundField DataField="father_name" HeaderText="نام پدر" />
                                                <asp:BoundField DataField="email" HeaderText="ایمیل" />
                                                <asp:BoundField DataField="tel" HeaderText="تلفن" />
                                                <asp:BoundField DataField="add_std" HeaderText="اضافه شده" />
                                                <asp:BoundField DataField="online" HeaderText="آنلاین" />
                                                <asp:BoundField DataField="date_last_login" HeaderText="آخرین ورود" />
                                                
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
                                        <input id="Button1" class="btn_stl" type="button" value="بستن پنجره" onclick="return Button1_onclick()" /></td>
                                </tr>
                                <tr>
                                    <td colspan="3"><br />
                                        <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <br />
                                        &nbsp;<asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click1">خروج از سیستم</asp:LinkButton></td>
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
            </div>
        </div>
    </div>
    </form>
</body>
</html>
