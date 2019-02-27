<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register2nd.aspx.cs" Inherits="sel_crs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>مرحله دوم ثبت نام</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 500px" >
            <tr>
                <td colspan="2" style="height: 13px">
                    <img src="images/top_reg_std_2.gif" width="500" /></td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td style="width: 161px">
                </td>
                <td style="width: 405px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 6px" align="center" colspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 295px">
                        <tr>
                            <td>
                            </td>
                            <td style="width: 290px">
                            </td>
                            <td style="width: 12px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:GridView ID="grd_crs" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" Width = "490px" EnableViewState="False" PageSize="15" >
                                    <Columns>
                                        <asp:BoundField DataField="crs_id" HeaderText="کد درس" SortExpression="crs_id" />
                                        <asp:BoundField DataField="crs_name" HeaderText="نام درس" SortExpression="crs_name" />
                                        <asp:BoundField DataField="unit" HeaderText="واحد درس" SortExpression="unit" />
                                        <asp:BoundField DataField="price" HeaderText="(R)قیمت" SortExpression="price" />
                                        <asp:BoundField DataField="name_teacher" HeaderText="نام استاد" SortExpression="name_teacher" />
                                        <asp:BoundField DataField="date_exam_min" HeaderText="تاریخ میان ترم" SortExpression="date_exam_min" />
                                        <asp:BoundField DataField="date_exam_trm" HeaderText="تاریخ پایان ترم" SortExpression="date_exam_trm" />
                                        <asp:TemplateField HeaderText="انتخاب">
                                            <EditItemTemplate>
                                                <asp:CheckBox  ID="choose" runat="server" />
                                                
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                               <asp:CheckBox runat="server" ID="choose" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label>
                                </td>
                        </tr>
                        <tr>
                            <td style="height: 17px">
                            </td>
                            <td style="width: 290px; height: 17px;" align="left">
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />
                                <asp:Button ID="btn_next" runat="server" CssClass="btn_stl" OnClick="btn_next_Click"
                                    Text="مرحله بعد" /></td>
                            <td style="height: 17px; width: 12px;">
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="height: 6px">
                </td>
            </tr>
            <tr>
                <td style="width: 161px; height: 15px">
                </td>
                <td style="width: 405px; height: 15px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="width: 161px">
                </td>
                <td style="width: 405px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 161px">
                </td>
                <td style="width: 405px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
