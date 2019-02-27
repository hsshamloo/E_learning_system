<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course-for-teacher.aspx.cs" Inherits="course_for_teacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>اطلاعات دروس</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 626px">
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
                            <td>
                            </td>
                            <td>
                                <asp:GridView ID="grd_crs" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="Gray" BorderStyle="Solid"
                                    BorderWidth="1px" CellPadding="4" ForeColor="Black" EnableViewState="False">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="crs_id" HeaderText="کد درس" />
                                        <asp:BoundField DataField="crs_name" HeaderText="نام درس" />
                                        <asp:BoundField DataField="unit" HeaderText="واحد" />
                                        <asp:BoundField DataField="date_exam_min" HeaderText="تاریخ امتحان میان ترم" />
                                        <asp:BoundField DataField="date_exam_trm" HeaderText="تاریخ امتحان پایان ترم" />
                                        <asp:BoundField DataField="cnt_qst_min" HeaderText="تعداد سوالات میان ترم" />
                                        <asp:BoundField DataField="cnt_qst_trm" HeaderText="تعداد سوالات پایان ترم" />
                                        <asp:BoundField DataField="comment" HeaderText="توضیحات" />
                                        <asp:HyperLinkField DataNavigateUrlFields="crs_id" DataNavigateUrlFormatString="course-for-teacher.aspx?id={0}"
                                            HeaderText="دانشجویان" Text="دانشجویان" />
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                            <td style="width: 28px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="width: 28px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:GridView ID="grd_std" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                    BackColor="Black" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                                    ForeColor="White" ShowFooter="True" Width="563px">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="f_name" HeaderText="نام" />
                                        <asp:BoundField DataField="l_name" HeaderText="نام خانوادگی" />
                                        <asp:BoundField DataField="p_id" HeaderText="شماره دانشجویی" />
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
                            <td style="width: 28px">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 13px">
                            </td>
                            <td align="center" style="height: 13px"><br />
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                            <td style="width: 28px; height: 13px">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 13px">
                            </td>
                            <td align="center" style="height: 13px"><br />
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="بستن پنجره" /></td>
                            <td style="width: 28px; height: 13px">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 13px">
                            </td>
                            <td align="center" style="height: 13px">
                                <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click1">خروج از سیستم</asp:LinkButton></td>
                            <td style="width: 28px; height: 13px">
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
    </form>
</body>
</html>
