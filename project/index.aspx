<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="INDEX_" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<script runat="server">


    
</script>

<html>
<head>
	<title>صفحه اصلی - سایت من</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script language ="javascript" type ="text/javascript">
	function openwindow(addr)
    {     
       open(addr,"null","titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=517,height = 600");
    }    
	</script>
	
</head>

<body leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#ffffff" style="background-color: #ffffff">
<form id="form1" runat="server">
<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
  <tr>
	<td width="50%" background="images/bg.gif" style="height: 835px"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
	<td valign="bottom" background="images/bg_left.gif" style="height: 835px"><img src="images/bg_left.gif" alt="" width="17" height="16" border="0"></td>
	<td valign="top" style="height: 835px; width: 828px;"> 
      <table border="0" cellspacing="0" cellpadding="0" width="780" height="82" background="images/fon_top.jpg">
<tr>
	<td>
<table border="0" cellspacing="0" cellpadding="5" width="" background="" align="center">

<tr>
	<th style="width: 58px">
        <asp:LinkButton ID="lbtn_logout" runat="server" CausesValidation="False" Font-Bold="True"
            Font-Size="XX-Small" ForeColor="DarkGoldenrod" OnClick="lbtn_logout_Click">Log Out</asp:LinkButton></th>
	<td>
        </td>
	<td>
        <asp:Label ID="lblusr" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="Gray" Font-Names="Tahoma"></asp:Label></td>
	<td align="right" width="500" >
<p class="menu" dir="rtl"><img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">&nbsp;&nbsp;<a href="index.aspx">صفحه اصلی</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">&nbsp;&nbsp;<a href="#">نقشه سایت</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">&nbsp;&nbsp;<a
    href="#">راهنما</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</p>
	</td>
</tr>

</table>
	</td>
</tr>
</table>
      <table width="780" border="0" cellspacing="0" cellpadding="0" style="height: 263px">
        <tr> 
          <td width="449" style="height: 147px"><img src="images/main01.jpg" width="449" height="149"></td>
          <td style="height: 147px; width: 332px;" valign="top"><img src="images/main_logo.jpg" width="331" height="149"></td>
        </tr>
        <tr> 
          <td valign="top" style="height: 38px"><img src="images/main02.jpg" width="449" height="45"></td>
          <td rowspan="3" valign="top" style="width: 332px"><img src="images/corporate_slogan.gif" width="331" height="135"></td>
        </tr>
        <tr> 
          <td background="images/fon03.gif" valign="top" style=" height:50" align="right" dir="rtl" >
              <p class="menu">
<img src="images/dokmeh.gif" alt="" border="0" align="middle">&nbsp;<a href="Login/Login.aspx"> 
    <span style="color: #ffffff">ورود</span></a>&nbsp;&nbsp;&nbsp;
<img src="images/dokmeh.gif" alt="" border="0" align="middle">&nbsp;<a href="#" onclick = "openwindow('Register1st.aspx')"><span
    style="color: #ffffff">ثبت نام</span></a>&nbsp;&nbsp;&nbsp;
<img src="images/dokmeh.gif" alt="" border="0" align="middle">&nbsp;<a href="#"><span
    style="color: #ffffff">درباره ما</span></a>&nbsp;&nbsp;&nbsp;
<img src="images/dokmeh.gif" alt="" border="0" align="middle">&nbsp;<a href="#"><span
    style="color: #ffffff">تماس با ما</span></a>&nbsp;&nbsp;&nbsp;
<img src="images/dokmeh.gif" alt="" border="0" align="middle">&nbsp;<span style="color: #ffffff"> 
    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Font-Size="8pt"
        ForeColor="White" OnClick="LinkButton1_Click">کنترل پانل</asp:LinkButton></span></p>
              </td>
        </tr>
        <tr> 
          <td valign="top"><img src="images/company_news.gif" width="449" height="40"></td>
        </tr>
      </table>
<table border="0" cellspacing="0" cellpadding="0" width="780" height="400">
<tr valign="top">
	<td bgcolor="#E9E9E9" style="height: 427px; width: 502px;">
<table border="0" cellspacing="0" cellpadding="0" width="501" dir="rtl">
<tr bgcolor="#FFBA62">
	<td background="images/fon01.gif" style="background-position: top; background-repeat: no-repeat; height: 199px;">
<p class="left">نام&nbsp; دانشجو&nbsp; : مرتضي آرين مهر&nbsp; </p>
                                        <p class="left">www.prozhe.com</p>
<p class="left">www.prozhe.com</p>
<p class="left">
    منتشر شده در وب سایت پروژه دات کام</p>
	</td>
</tr>
<tr style="color: #000000">
	<td bgcolor="#0B6795"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
<tr style="color: #000000">
	<td align="right">
<table border="0" cellspacing="0" cellpadding="0" width="435">
<tr valign="top">
	<td style="height: 194px; text-align: left">
<p class="title" style="text-align: right">
    <span style="font-size: 8pt;">درباره سایت :</span></p>
        <p class="title" style="text-align: right">
            <span style="font-size: 8pt">
            <span><span style="color: #000000">این به عنوان
                یک پروژه درسی طراحی شده است و موضوع آن آموزش مجازی میباشد. شامل کنترل پانل برای
                مدیریت سایت ، استادان و دانشجویان میباشد. </span></span><span style="color: #000000">برای آشنایی با نحوه کار این پروژه به Document آن مراجعه کنيد. 
            </span></span></p>
        <p style="text-align: center">
            **************************************************************<span style="font-size: 8pt;"></span></p>
        <p style="text-align: right">
            <span>صفحات زیر در دست ساخت میباشد و بزودی آماده خواهد شد :</span></p>
        <p style="text-align: right">
            <span>نقشه سایت - درباره ما - تماس با ما -&nbsp; راهنما</span></p>
        <p style="text-align: center">
            ***********************************************************<strong><span style="color: #006600"></span></strong></p>
        <p style="text-align: right">
            تمام حقوق مادي و معنوي متعلق به&nbsp; سيستم آموزش&nbsp; مجازي تحت وب مي 
            باشد.سازگار با تمامی مرورگرهای موجود&nbsp; | طراحی سايت&nbsp; : مرتضي آرين مهر </p>
        <span style="font-size: 9pt; color: #006600; font-family: Tahoma">والسلام علی من تبع
            الهدی<br />
            مدیریت سایت &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span>
	</td>
	<td style="height: 194px">
<p class="titleb">
    &nbsp;</p>
<p>
    &nbsp;</p>
	</td>
</tr>
</table>
	</td>
</tr>
</table>
	</td>
	<td bgcolor="#0B6795" style="height: 427px"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
	<td bgcolor="#0761A7" style="width: 253px; height: 427px;" align="center" valign="middle" dir="rtl">
<table border="0" cellspacing="0" cellpadding="0" width="278" dir="rtl">
<tr bgcolor="#848484">
	<td>
<p class="titlew">
    خلاصه ای از پروژه های آینده :</p>
<p>&nbsp;</p>
<p class="right"><img src="images/dot_w.gif" width="5" height="5" alt="" border="0">&nbsp;&nbsp;فعلا
    کمی صبر کنید تا بعد ...</p>
	</td>
</tr>
<tr>
	<td bgcolor="#0B6795"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
<tr valign="top">
	<td height="132" background="images/fon02.gif" style="background-position: top; background-repeat: no-repeat;">
<p class="titlew">
    لینک دوستان و همکاران ما :</p>
<p class="list"><a href="http://www.prozhe.com"><img src="images/dot_w.gif" width="5" height="5" alt="" border="0">&nbsp;&nbsp;MICROSOFT </a></p>
<p class="list"><a href="http://www.barnamenevis.org"><img src="images/dot_w.gif" width="5" height="5" alt="" border="0">&nbsp;&nbsp;بـرنـامـه نـویـس</a></p>
<p class="list"><a href="http://www.Golemasom.blogfa.com"><img src="images/dot_w.gif" width="5" height="5" alt="" border="0">&nbsp;&nbsp;گــل مـعـصـوم </a></p>
<p class="list"><a href="http://www.yahoo.com"><img src="images/dot_w.gif" width="5" height="5" alt="" border="0">&nbsp;&nbsp;YAHOO!</a></p>
        <p class ="list">

            <a href="http://www.hsaleh120.somee.com">
                <img src="images/dot_w.gif" width="5" height="5" alt="" border="0"><span style="text-decoration: underline">
                &nbsp;استفاده از پورت ها و ...</span></a></p>
	</td>
</tr>
</table>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC"
            CellPadding="1" DayNameFormat="Shortest" Font-Names="tahoma" Font-Size="8pt"
            ForeColor="#003399" Height="200px" Width="220px" BorderWidth="1px" CssClass="lbl_er">
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <WeekendDayStyle BackColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
        </asp:Calendar>
	</td>
</tr>
</table>
<div align="right"><img src="images/sh01.gif" width="278" height="7" alt="" border="0"></div>
<table border="0" cellpadding="0" cellspacing="0" width="780" dir="rtl">
<tr>
	<td style="height: 33px"><p>Copyright ©2007 E-Learning.com</p></td>
	<td style="height: 33px">
<p class="menu_bot" align="center">
</p>
    <p class="menu" dir="rtl"><img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">&nbsp;&nbsp;<a href="index.aspx">صفحه اصلی</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">&nbsp;&nbsp;<a href="#">نقشه سایت</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">&nbsp;&nbsp;<a
    href="#">راهنما</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</p>
	</td>
</tr>
</table>
	</td>
	<td valign="bottom" background="images/bg_right.gif" style="height: 835px"><img src="images/bg_right.gif" alt="" width="17" height="16" border="0"></td>
	<td width="50%" background="images/bg.gif" style="height: 835px"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
</table>
</form>
</body>
</html>
