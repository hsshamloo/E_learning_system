<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register3rd.aspx.cs" Inherits="RegisterT" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>تایید نهایی</title>
    <link href="css/def.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
   window.close();
   }
// ]]>
</script>
</head>
<body class="tbl_asli">
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 500px">
            <tr>
                <td colspan="3">
                    <img src="images/top_reg_std_3.gif" /></td>
            </tr>
            <tr>
                <td style="height: 15px">
                </td>
                <td style="width: 13px; height: 15px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="height: 15px" align="center" colspan="3">
                    <table border="0" cellpadding="2" cellspacing="0" style="width: 470px">
                        <tr>
                            <td class="td_none" colspan="4" style="color: red">
                                بدلیل آزمایشی بودن این برنامه سیستم پرداخت در دسترس نمی باشد.</td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 7px; height: 17px">
                            </td>
                            <td class="td_txt_cnt" style="width: 99px; height: 17px">
                                مشخصات دانشجو :</td>
                            <td class="td_txt_cnt" style="width: 373px; height: 17px">
                            مرتضي آرين مهر- دانشگاه علمي كاربردي بروجرد 2</td>
                            <td class="td_txt_cnt" style="height: 17px">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 7px; height: 17px">
                            </td>
                            <td class="td_txt_cnt" style="width: 99px; height: 17px">
                                نام کاربری :</td>
                            <td align="right" class="td_txt_cnt" style="width: 373px; height: 17px">
                                <asp:Label ID="lbl_id" runat="server" Text="مرتضي آرين مهر" ForeColor="DarkGreen"></asp:Label></td>
                            <td class="td_txt_cnt" style="height: 17px">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 7px; height: 17px">
                            </td>
                            <td class="td_txt_cnt" style="width: 99px; height: 17px">
                                شماره دانشجویی :</td>
                            <td align="right" class="td_txt_cnt" style="width: 373px; height: 17px">
                                <asp:Label ID="lbl_pid" runat="server" Text="4325697787" ForeColor="DarkGreen"></asp:Label></td>
                            <td class="td_txt_cnt" style="height: 17px">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 7px; height: 17px">
                            </td>
                            <td class="td_txt_cnt" style="width: 99px; height: 17px">
                                کل پرداختی :</td>
                            <td align="right" class="td_txt_cnt" style="width: 373px; height: 17px">
                                <asp:Label ID="lbl_price" runat="server" Text="650000" ForeColor="DarkGreen"></asp:Label></td>
                            <td class="td_txt_cnt" style="height: 17px">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 7px; height: 17px">
                            </td>
                            <td class="td_txt_cnt" style="width: 99px; height: 17px">
                                نوع پرداخت :</td>
                            <td align="right" class="td_txt_cnt" style="width: 373px; height: 17px">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Enabled="False" RepeatLayout="Flow">
                                    <asp:ListItem>کارت بانک پارسیان</asp:ListItem>
                                    <asp:ListItem>کارت بانک سامان</asp:ListItem>
                                    <asp:ListItem>کارتهای شتاب</asp:ListItem>
                                    <asp:ListItem>واریز به حساب</asp:ListItem>
                                </asp:RadioButtonList></td>
                            <td class="td_txt_cnt" style="height: 17px">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 7px; height: 1px">
                            </td>
                            <td class="td_txt_cnt" style="width: 99px; height: 1px">
                            </td>
                            <td class="td_txt_cnt" style="width: 373px; height: 1px">
                                <asp:Button ID="Button2" runat="server" CssClass="btn_stl" Enabled="False" Text="پرداخت" /></td>
                            <td class="td_txt_cnt" style="height: 1px">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="4" style="height: 17px">
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="td_none" style="width: 7px; height: 17px">
                            </td>
                            <td class="td_none" style="width: 99px; height: 17px">
                            </td>
                            <td class="td_none" style="width: 373px; height: 17px">
                                <input id="Button3" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="بستن پنجره" />
                    <asp:Button ID="Button1" runat="server" CssClass="btn_stl" OnClick="Button1_Click"
                        Text="تایید نهایی" /></td>
                            <td class="td_none" style="height: 17px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 7px">
                            </td>
                            <td style="width: 99px">
                            </td>
                            <td style="width: 373px">
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 15px">
                </td>
                <td style="width: 13px; height: 15px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="height: 15px">
                </td>
                <td style="width: 13px; height: 15px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 13px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
