<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ورود به سیستم</title>
    <link href="../css/def2.css" rel="stylesheet" type="text/css" />
    <link href="STYLE.CSS" rel="stylesheet" type="text/css" />
    <script language="javascript" type ="text/javascript">
    function openwindow(addr)
    {     
       open(addr,"null","titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=517,height = 600");
    }
    function openwindowlist(addr)
    {     
       open(addr,"null","titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=780,height = 400");
    }
    function opendialog()
    {     
       var id = prompt("لطفا شماره دانشجویی را وارد کنید :","")
       addr = "../List-Student.aspx?id=" + id;
       open(addr,"null","titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=780,height = 400");
    }
    </script>
    
</head>
<body >
<form runat="server" id="form1">
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
        <tr valign="top">
            <td background="images/bg.gif" width="50%">
                <img alt="" border="0" height="1" src="images/px1.gif" width="1" /></td>
            <td background="images/bg_left.gif" valign="bottom">
                <img alt="" border="0" height="16" src="images/bg_left.gif" width="17" /></td>
            <td bgcolor="#95a2ab">
                <table border="0" cellpadding="0" cellspacing="0" width="780">
                    <tr>
                        <td>
                            <img height="151" src="images/main01.jpg" width="449" /><img height="151" src="images/main_logo.jpg"
                                width="330" /></td>
                    </tr>
                    <tr>
                        <td background="images/fon03.gif" dir="rtl">
                            <p class="menu01">
                                <img align="middle" alt="" border="0" src="images/dokmeh.gif" style="" /><span
                                    style="font-size: 12pt">&nbsp;</span><a href="Login.aspx"><span style="">
                                    <span style="color: #ffffff">ورود</span></span></a><span style=""> &nbsp;&nbsp;
                                <img align="middle" alt="" border="0" src="images/dokmeh.gif" />
                                        </span>
                                <a href="#" onclick = "openwindow('../Register1st.aspx')"><span style="color: #ffffff; ">ثبت نام</span></a><span
                                            style="font-size: 12pt"> &nbsp;&nbsp;
                                <img align="middle" alt="" border="0" src="images/dokmeh.gif" />
                                        </span>
                                <a href="#"><span style="color: #ffffff; ">درباره ما</span></a><span
                                            style="font-size: 12pt"> &nbsp;&nbsp;
                                <img align="middle" alt="" border="0" src="images/dokmeh.gif" />
                                        </span>
                                <a href="#"><span style="color: #ffffff; ">تماس با ما</span></a><span
                                            style="font-size: 12pt"> &nbsp;&nbsp;
                                <img align="middle" alt="" border="0" src="images/dokmeh.gif" />&nbsp;</span><span style="color: #ffffff"><span style="font-size: 12pt"> 
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Font-Size="9pt"
                                        ForeColor="White" OnClick="LinkButton1_Click">کنترل پانل</asp:LinkButton>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <asp:LinkButton ID="lbtn_logout" runat="server" CausesValidation="False" Font-Bold="True"
                                        Font-Size="X-Small" ForeColor="Yellow" OnClick="lbtn_logout_Click">Log Out</asp:LinkButton>&nbsp;
                                    <asp:Label ID="lblusr" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="White"></asp:Label></span></span></p>
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="780">
                    <tr>
                        <td background="images/fon01.gif" height="14">
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="780">
                    <tr bgcolor="#eae4d3" valign="top">
                        <td align="center" background="images/fon_1.gif" style="width: 48%; height: 451px">
                            <br />
                            <table border="0" cellpadding="0" cellspacing="0" width="241">
                                <tr>
                                    <td>
                                        <img alt="" border="0" height="22" src="images/t11.gif" width="10" /></td>
                                    <td background="images/fon_top.gif">
                                        <img alt="" border="0" height="22" src="images/t12.gif" width="29" /></td>
                                    <td background="images/fon_top.gif">
                                        <table border="0" cellpadding="0" cellspacing="0" height="22" width="164">
                                            <tr>
                                                <td background="images/t_top.gif">
                                                    <p class="title01">
                                                        افراد آنلاین</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" background="images/fon_top.gif">
                                        <img alt="" border="0" height="22" src="images/t13.gif" width="29" /></td>
                                    <td>
                                        <img alt="" border="0" height="22" src="images/t14.gif" width="9" /></td>
                                </tr>
                                <tr valign="top">
                                    <td background="images/fon_left.gif">
                                        <img alt="" border="0" height="333" src="images/t21.gif" width="10" /></td>
                                    <td bgcolor="#ffffff" colspan="3" rowspan="2" dir="rtl">
                                        <p class="left">
                                            <img align="middle" alt="" border="0" height="5" src="images/dot_g.gif" width="5" />
                                            &nbsp;مرتضي آرين مهر&nbsp; !!! .</p>
                                        <p class="left">
                                            <img align="middle" alt="" border="0" height="5" src="images/dot_g.gif" width="5" />
                                            &nbsp;&nbsp;اشكان مرادف !!!.</p>
                                        <p class="left">
                                            <img align="middle" alt="" border="0" height="5" src="images/dot_g.gif" width="5" />
                                            &nbsp;&nbsp; رضا بيرانوند!!! .</p>
                                        <p class="left">
                                            <a href=""></a></p>
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC"
                                            BorderWidth="1px" CellPadding="1" CssClass="lbl_er" DayNameFormat="Shortest"
                                            Font-Names="tahoma" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                            <WeekendDayStyle BackColor="#CCCCFF" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                                                Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                        </asp:Calendar>
                                    </td>
                                    <td background="images/fon_right.gif">
                                        <img alt="" border="0" height="333" src="images/t24.gif" width="9" /></td>
                                </tr>
                                <tr valign="bottom">
                                    <td background="images/fon_left.gif">
                                        <img alt="" border="0" height="7" src="images/t31.gif" width="10" /></td>
                                    <td background="images/fon_right.gif">
                                        <img alt="" border="0" height="7" src="images/t34.gif" width="9" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img alt="" border="0" height="15" src="images/t41.gif" width="10" /></td>
                                    <td background="images/fon_bot.gif">
                                        <img alt="" border="0" height="15" src="images/t42.gif" width="29" /></td>
                                    <td background="images/fon_bot.gif">
                                        <img alt="" border="0" height="15" src="images/fon_bot.gif" width="31" /></td>
                                    <td align="right" background="images/fon_bot.gif">
                                        <img alt="" border="0" height="15" src="images/t43.gif" width="29" /></td>
                                    <td>
                                        <img alt="" border="0" height="15" src="images/t44.gif" width="9" /></td>
                                </tr>
                            </table>
                            <br />
                        </td>
                        <td align="center" background="images/fon_2.gif" style="height: 451px; width: 58%;">
                            <br />
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <img alt="" border="0" height="22" src="images/t11.gif" width="10" /></td>
                                    <td background="images/fon_top.gif">
                                        <img alt="" border="0" height="22" src="images/t12.gif" width="29" /></td>
                                    <td background="images/fon_top.gif">
                                        <table border="0" cellpadding="0" cellspacing="0" height="22" width="164">
                                            <tr>
                                                <td background="images/t_top.gif">
                                                    <p class="title01">
                                                        LOGIN</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" background="images/fon_top.gif">
                                        <img alt="" border="0" height="22" src="images/t13.gif" width="29" /></td>
                                    <td>
                                        <img alt="" border="0" height="22" src="images/t14.gif" width="9" /></td>
                                </tr>
                                <tr valign="top">
                                    <td background="images/fon_left.gif">
                                        <img alt="" border="0" height="333" src="images/t21.gif" width="10" /></td>
                                    <td bgcolor="#ffffff" colspan="3" rowspan="2" width="390">
                                        <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                            <tr valign="top">
                                                <td>
                                                    <br />
                                                    &nbsp;</td>
                                                <td align="center" valign="top">
                                                    <p class="left">
                                                            <br />
                                                            &nbsp;&nbsp;
                                                            <table border="0" cellpadding="0" cellspacing="0" dir="ltr" style="margin: 0px; width: 192px;
                                                                height: 161px; background-color: #cccccc">
                                                                <tr>
                                                                    <td colspan="4" style="height: 21px; background-color: transparent">
                                                                        <span dir="rtl">&nbsp;ورود اعضاء</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" style="height: 10px; background-color: #b9e0ee" valign="middle">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusr"
                                                                            ErrorMessage="نام کاربری را وارد کنید">*</asp:RequiredFieldValidator></td>
                                                                    <td align="left" dir="rtl" style="width: 121px; color: #000000; height: 10px; background-color: #b9e0ee"
                                                                        valign="middle">
                                                                        <strong>
                                                                            <asp:TextBox ID="txtusr" runat="server" CssClass="txt_stl" ToolTip="نام کاربری را وارد کنید"
                                                                                Width="106px"></asp:TextBox></strong></td>
                                                                    <td align="center" class="text_stl" dir="rtl" style="color: #000000; height: 10px;
                                                                        background-color: #b9e0ee" valign="middle">
                                                            نام کار<span style="color: black; background-color: #b9e0ee">ب</span>ری :</td>
                                                                    <td align="left" style="height: 10px; background-color: #b9e0ee">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" colspan="1" style="height: 1px; background-color: #b9e0ee" valign="middle">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd"
                                                                            ErrorMessage="کلمه عبور را وارد کنید">*</asp:RequiredFieldValidator></td>
                                                                    <td align="left" colspan="1" dir="rtl" style="width: 121px; color: #000000; height: 1px;
                                                                        background-color: #b9e0ee" valign="middle">
                                                                        <asp:TextBox ID="txtpwd" runat="server" CssClass="txt_stl" TextMode="Password" ToolTip="کلمه عبور را وارد کنید"
                                                                            Width="106px"></asp:TextBox></td>
                                                                    <td align="center" dir="rtl" style="color: #000000; height: 1px; background-color: #b9e0ee"
                                                                        valign="middle">
                                                            کلمه عبور :</td>
                                                                    <td style="height: 1px; background-color: #b9e0ee">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" style="height: 1px; background-color: #b9e0ee">
                                                                    </td>
                                                                    <td align="left" style="width: 121px; height: 1px; background-color: #b9e0ee">
                                                                        <asp:DropDownList ID="drdusr_typ" runat="server" CssClass="txt_stl" Width="110px">
                                                                            <asp:ListItem>کاربر عادی</asp:ListItem>
                                                                            <asp:ListItem>استاد</asp:ListItem>
                                                                            <asp:ListItem>مدیر</asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                    <td align="center" dir="rtl" style="height: 1px; background-color: #b9e0ee" valign="middle">
                                                            نوع کاربر :&nbsp;</td>
                                                                    <td>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" colspan="1" style="height: 21px">
                                                                    </td>
                                                                    <td align="left" colspan="3" style="height: 21px">
                                                                        <asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btn_ok_Click"
                                                                            Style="border-top-width: 1px; border-left-width: 1px; border-left-color: black;
                                                                            border-bottom-width: 1px; border-bottom-color: black; border-top-color: black;
                                                                            border-right-width: 1px; border-right-color: black" Text="تایید" /></td>
                                                                    <td style="height: 21px">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="3" dir="rtl" style="height: 21px">
                                                                        <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label><br />
                                                                        <asp:LinkButton ID="lbtn_forget_pwd" runat="server" CausesValidation="False" OnClick="lbtn_forget_pwd_Click">کلمه عبور را فراموش کرده ام</asp:LinkButton>
                                                                    </td>
                                                                    <td style="height: 21px">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                                                EnableTheming="True" HeaderText="*پیغام های خطا *" ShowMessageBox="True" ShowSummary="False" />
                                                    </p>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td background="images/fon_right.gif">
                                        <img alt="" border="0" height="333" src="images/t24.gif" width="9" /></td>
                                </tr>
                                <tr valign="bottom">
                                    <td background="images/fon_left.gif">
                                        <img alt="" border="0" height="7" src="images/t31.gif" width="10" /></td>
                                    <td background="images/fon_right.gif">
                                        <img alt="" border="0" height="7" src="images/t34.gif" width="9" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img alt="" border="0" height="15" src="images/t41.gif" width="10" /></td>
                                    <td background="images/fon_bot.gif">
                                        <img alt="" border="0" height="15" src="images/t42.gif" width="29" /></td>
                                    <td background="images/fon_bot.gif">
                                        <img alt="" border="0" height="15" src="images/fon_bot.gif" width="31" /></td>
                                    <td align="right" background="images/fon_bot.gif">
                                        <img alt="" border="0" height="15" src="images/t43.gif" width="29" /></td>
                                    <td>
                                        <img alt="" border="0" height="15" src="images/t44.gif" width="9" /></td>
                                </tr>
                            </table>
                            <br />
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="780">
                    <tr>
                        <td background="images/fon02.gif" height="62">
                            <p>
                                    Copyright ©2007 E-Learning.com</p>
                        </td>
                        <td background="images/fon02.gif">
                            <p class="menu01" dir="rtl">
                                <img align="middle" alt="" border="0" height="5" src="images/dot_g.gif" width="5" />
                                &nbsp;<a href="../index.aspx">صفحه اصلی</a> &nbsp; &nbsp; &nbsp;&nbsp;
                                <img align="middle" alt="" border="0" height="5" src="images/dot_g.gif" width="5" />
                                &nbsp;<a href="#">نقشه سایت</a> &nbsp; &nbsp; &nbsp;&nbsp;
                                <img align="middle" alt="" border="0" height="5" src="images/dot_g.gif" width="5" />
                                &nbsp;<a href="#">راهنما</a> &nbsp; &nbsp; &nbsp;
                            </p>
                        </td>
                    </tr>
                </table>
            </td>
            <td background="images/bg_right.gif" valign="bottom">
                <img alt="" border="0" height="16" src="images/bg_right.gif" width="17" /></td>
            <td background="images/bg.gif" style="width: 46%">
                <img alt="" border="0" height="1" src="images/px1.gif" width="1" /></td>
        </tr>
    </table>
    </form>
</body>
</html>
