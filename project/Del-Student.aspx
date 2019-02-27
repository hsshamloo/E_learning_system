<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Del-Student.aspx.cs" Inherits="Del_Student" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>حذف دانشجو</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 500px">
            <tr>
                <td>
                </td>
                <td style="width: 349px">
                    <img src="images/top_del_std.gif" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 349px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <table border="0" cellpadding="1" cellspacing="0" style="width: 374px">
                        <tr>
                            <td align="center" class="td_none" colspan="3">
                                حذف دانشجو<br />
                                <span style="color: red">توجه : با حذف دانشجو اطلاعات مربوط به دروس و امتحانات او نیز
                                    حذف خواهد شد.</span></td>
                        </tr>
                        <tr>
                            <td align="center" class="td_none" colspan="3">
                                <asp:Button ID="btn_srch" runat="server" OnClick="btn_srch_Click" Text="جستجو" CssClass="btn_stl" />
                                <asp:DropDownList ID="drdstd" runat="server" CssClass="txt_stl">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 33px; height: 13px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 2230px; height: 13px">
                                نام کاربری :</td>
                            <td align="right" class="td_txt_cnt" style="width: 240px">
                                <asp:TextBox ID="txtusr" runat="server" CssClass="txt_stl" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 33px; height: 15px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 2230px; height: 15px">
                                نام :</td>
                            <td align="right" class="td_txt_cnt" style="width: 240px">
                                <asp:TextBox ID="txtname" runat="server" CssClass="txt_stl" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 33px; height: 15px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 2230px; height: 15px">
                                نام خانوادگی :</td>
                            <td align="right" class="td_txt_cnt" style="width: 240px">
                                <asp:TextBox ID="txtfamily" runat="server" CssClass="txt_stl" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 33px; height: 3px" valign="top">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 2230px; height: 3px" valign="top">
                                تاریخ تولد به ترتیب از سمت چپ به راست (سال/ماه/روز)</td>
                            <td align="right" class="td_txt_cnt" style="width: 240px; height: 3px" valign="top">
                                <table>
                                    <tr>
                                        <td style="width: 3px">
                                            <asp:TextBox ID="txtbd" runat="server" CssClass="txt_stl" ReadOnly="True" Width="20px"></asp:TextBox></td>
                                        <td style="width: 4px">
                                            <asp:TextBox ID="txtbm" runat="server" CssClass="txt_stl" ReadOnly="True" Width="20px"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="txtby" runat="server" CssClass="txt_stl" ReadOnly="True" Width="40px"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 33px; height: 15px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 2230px; height: 15px">
                                شماره دانشجویی :</td>
                            <td align="right" class="td_txt_cnt" style="width: 240px">
                                <asp:TextBox ID="txtp_id" runat="server" CssClass="txt_stl" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 33px; height: 15px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 2230px; height: 15px">
                                نام پدر :</td>
                            <td align="right" class="td_txt_cnt" style="width: 240px">
                                <asp:TextBox ID="txt_father" runat="server" CssClass="txt_stl" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 33px; height: 25px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 2230px; height: 25px">
                                پست الکترونیکی :</td>
                            <td align="right" class="td_txt_cnt" style="width: 240px">
                                <asp:TextBox ID="txtemail" runat="server" CssClass="txt_stl" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_txt_cnt" style="width: 33px; height: 15px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 2230px; height: 15px">
                                تلفن :</td>
                            <td align="right" class="td_txt_cnt" style="width: 240px">
                                <asp:TextBox ID="txttel" runat="server" CssClass="txt_stl" ReadOnly="True"></asp:TextBox>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="td_none" colspan="3" style="height: 15px">
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" class="td_none" style="width: 33px; height: 25px">
                            </td>
                            <td align="center" class="td_none" style="height: 25px" colspan="2">
                                &nbsp;<input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />
                                <asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btnnext_Click"
                                    Text="حذف" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 349px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 16px" align="center" colspan="3">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click">خروج از سیستم</asp:LinkButton></td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 349px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
