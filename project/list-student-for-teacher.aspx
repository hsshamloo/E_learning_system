<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list-student-for-teacher.aspx.cs" Inherits="list_student_for_teacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>لیست دانشجویان استاد</title>
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
        <table class="tbl_asli_op" style="width: 636px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 181px">
                </td>
                <td style="height: 181px" align="center">
                    <asp:GridView ID="grd_std" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                        ForeColor="White" ShowFooter="True">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="f_name" HeaderText="نام" />
                            <asp:BoundField DataField="l_name" HeaderText="نام خانوادگی" />
                            <asp:BoundField DataField="p_id" HeaderText="شماره دانشجویی" />
                            <asp:BoundField DataField="crs_name" HeaderText="درس" />
                            <asp:BoundField DataField="term" HeaderText="ترم" />
                            <asp:BoundField DataField="wchapter" HeaderText="وضعیت فصل" />
                            <asp:BoundField DataField="grade_term" HeaderText="نمره میان ترم" />
                            <asp:BoundField DataField="grade_min" HeaderText="نمره پایان ترم" />
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td style="height: 181px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
                    <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center"><br />
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                        value="بستن پنجره" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center"><br />
                    <asp:LinkButton ID="lbtn_logoff" runat="server" CausesValidation="False" OnClick="lbtn_logoff_Click1">خروج از سیستم</asp:LinkButton></td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
