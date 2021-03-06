<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Learn-Course.aspx.cs" Inherits="Learn_Course" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>بخش آموزش</title>
    <link href="css/def.css" rel="stylesheet" type="text/css" />
    <link href ="../css/def2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%" dir="ltr">
  <tr>
	<td width="50%" background="images/bg.gif"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
	<td valign="bottom" background="images/bg_left.gif"><img src="images/bg_left.gif" alt="" width="17" height="16" border="0"></td>
	<td valign="top" align="center" dir="ltr" style="width: 785px">
      <table width="780" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"> 
            <table width="780" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="539"><img src="images/main01.jpg" width="539" height="123"></td>
                <td width="241" valign="top">
                  <table width="241" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="46" background="images/fon01.gif"><a href="../index.aspx"><img src="images/but001.gif" width="67" height="46" border="0"></a><img src="images/separator.gif" width="2" height="46"><a href="#"><img src="images/but002.gif" width="90" height="46" border="0"></a><img src="images/separator.gif" width="2" height="46"><a href="#"><img src="images/but003.gif" width="80" height="46" border="0"></a></td>
                    </tr>
                    <tr>
                      <td height="77" background="images/fon02.gif">
                          <table style="width: 232px">
                              <tr>
                                  <td>
                                  </td>
                                  <td>
                                      <asp:Label ID="lblusr" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White"></asp:Label></td>
                                  <td>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                  </td>
                                  <td>
                                      <asp:LinkButton ID="lbtn_logout" runat="server" Font-Bold="True" Font-Size="Smaller"
                                          ForeColor="Yellow" OnClick="lbtn_logout_Click">Log Out</asp:LinkButton></td>
                                  <td>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                  </td>
                                  <td>
                                      <asp:Label ID="lbl_lst_log" runat="server" ForeColor="White"></asp:Label></td>
                                  <td>
                                  </td>
                              </tr>
                          </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td background="images/fon03.gif" height="37"><a href="#"></a><a href="#"></a><a href="#"></a><a href="#"></a></td>
        </tr>
      </table>
<table border="0" cellpadding="0" cellspacing="0" width="780" background="">
<tr>
	<td colspan="3"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
<tr>
	<td bgcolor="#CECECE" colspan="3"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
<tr>
	<td width="276" align="center"><img src="images/temp01.jpg" width="216" height="196" alt="" border="0"></td>
	<td valign="top" style="width: 244px">
        <table border="0" cellpadding="4" cellspacing="0" dir="rtl" width="100%">
            <tr>
                <td>
                </td>
                <td>
                    نام درس :</td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Label ID="lbl_crs" runat="server" CssClass="txt_er"></asp:Label></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    عنوان فصل :</td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Label ID="lbl_ch" runat="server" CssClass="txt_er"></asp:Label></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    نمره کوئیز شما :</td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Label ID="lbl_quiz" runat="server" CssClass="txt_er" Text="شما کوئیز نداده اید"></asp:Label></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    عنوان بخش :</td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Label ID="lbl_sec" runat="server" CssClass="txt_er"></asp:Label></td>
                <td>
                </td>
            </tr>
        </table>
    </td>
	<td valign="top">
        <asp:GridView ID="grd_sec" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="8" Width="244px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="sec_num,tittle_sec,id_sec" DataNavigateUrlFormatString="learn-course.aspx?id_sec={0}&amp;name={1}&amp;idsec={2}"
                    DataTextField="tittle_sec" HeaderText="عنوان بخش ها" />
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
</table>
<div align="center"><img src="images/e02.gif" width="760" height="4" alt="" border="0"></div>
        <div dir="rtl"><asp:TextBox ID="txt_cnt" runat="server" Height="700px" TextMode="MultiLine" Width="700px"></asp:TextBox></div><br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="780">
<tr>
	      <td valign="middle" height="47" background="images/fon_bot.gif"> 
            <p align="center">Copyright ©2007 E-Learning.com</p>
          </td>
	      <td background="images/fon_bot.gif" valign="middle"> 
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
<tr>
	<td colspan="2" bgcolor="#F77100" style="height: 5px"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
</table>
<br>
	</td>
	<td valign="bottom" background="images/bg_right.gif"><img src="images/bg_right.gif" alt="" width="17" height="16" border="0"></td>
	<td width="50%" background="images/bg.gif"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
