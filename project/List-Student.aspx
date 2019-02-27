<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List-Student.aspx.cs" Inherits="List_Student" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>اطلاعات دانشجو</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 700px" align ="center">
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
                            <td style="width: 29px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:GridView ID="grd_std" runat="server" AllowPaging="True" AllowSorting="True"
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
                            <td colspan="3">
                                ***</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:GridView ID="grd_crs" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" PageSize="5" ShowFooter="True">
                                    <Columns>
                                        <asp:BoundField DataField="crs_name" HeaderText="نام درس" />
                                        <asp:BoundField DataField="unit" HeaderText="واحد" />
                                        <asp:BoundField DataField="term" HeaderText="ترم" />
                                        <asp:BoundField DataField="date_exam_min" HeaderText="تاریخ میان ترم" />
                                        <asp:BoundField DataField="date_exam_trm" HeaderText="تاریخ پایان ترم" />
                                        <asp:BoundField DataField="wchapter" HeaderText="وضعیت فصل" />
                                        <asp:BoundField DataField="grade_term" HeaderText="نمره میان ترم" />
                                        <asp:BoundField DataField="grade_min" HeaderText="نمره پایان ترم" />
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EditRowStyle BackColor="#999999" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <br />
                                <br />
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
    </form>
</body>
</html>
