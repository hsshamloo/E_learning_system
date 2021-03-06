<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List-Courses.aspx.cs" Inherits="List_Course" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>لیست دروس</title>
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
    <div align = "center">
        <div>
            <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 755px">
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
                    <td style="height: 13px">
                        <table style="width: 672px" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                </td>
                                <td style="width: 736px">
                                </td>
                                <td style="width: 420px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td style="width: 736px">
                                    <asp:GridView ID="grd_crs" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="False" BackColor="White" BorderColor="Gray" BorderStyle="Solid"
                                        BorderWidth="1px" CellPadding="4" ForeColor="Black" Width="750px">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="crs_id" HeaderText="کد درس" />
                                            <asp:BoundField DataField="crs_name" HeaderText="نام درس" />
                                            <asp:BoundField DataField="unit" HeaderText="واحد" />
                                            <asp:BoundField DataField="price" HeaderText="قیمت" />
                                            <asp:BoundField DataField="name_teacher" HeaderText="نام استاد" />
                                            <asp:BoundField DataField="add_crs" HeaderText="اضافه شده" />
                                            <asp:BoundField DataField="date_exam_min" HeaderText="تاریخ امتحان میان ترم" />
                                            <asp:BoundField DataField="date_exam_trm" HeaderText="تاریخ امتحان پایان ترم" />
                                            <asp:BoundField DataField="cnt_qst_min" HeaderText="تعداد سوالات میان ترم" />
                                            <asp:BoundField DataField="cnt_qst_trm" HeaderText="تعداد سوالات پایان ترم" />
                                            <asp:BoundField DataField="comment" HeaderText="توضیحات" />
                                        </Columns>
                                        <RowStyle BackColor="#EFF3FB" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                                <td style="width: 420px">
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 13px">
                                </td>
                                <td align="center" style="width: 736px; height: 13px"><br /><br />
                                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                        value="بستن پنجره" /></td>
                                <td style="width: 420px; height: 13px">
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 13px">
                                </td>
                                <td align="center" style="width: 736px; height: 13px"><br />
                                    <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                                <td style="width: 420px; height: 13px">
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 13px">
                                </td>
                                <td style="height: 13px; width: 736px;" align="center"><br />
                                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click1">خروج از سیستم</asp:LinkButton></td>
                                <td style="width: 420px; height: 13px;">
                                </td>
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
    
    </div>
    </form>
</body>
</html>
