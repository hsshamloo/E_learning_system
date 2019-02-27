<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerCP.aspx.cs" Inherits="ManagerCP" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>کنترل پانل مدیر</title>
    <link href="../css/def2.css" rel="stylesheet" type="text/css" />
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type ="text/javascript">
    function openwindow(addr)
    {     
       open(addr,"a","titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=517,height = 600");
    }
    function openwindowlist(addr)
    {     
       open(addr,"_b","titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=780,height = 400");
    }
    function opendialog()
    {     
       var id = prompt("لطفا شماره دانشجویی را وارد کنید :","")
       addr = "../List-Student.aspx?id=" + id;
       open(addr,"null","titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=780,height = 400");
    }
    </script>
</head>
<body style="background-image : url(images/BG.GIF); margin-top: 0px; margin-bottom: 0px;">
    <form id="form1" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%" style="background-color: white">
  <tr>
	<td width="50%" background="images/bg.gif"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
	<td valign="bottom" background="images/bg_left.gif"><img src="images/bg_left.gif" alt="" width="17" height="16" border="0"></td>
	<td style="width: 782px">
<table border="0" cellpadding="0" cellspacing="0" width="780" background="images/fon_top.jpg" height="119">
<tr>
	<td align="right">
<table border="0" cellpadding="0" cellspacing="0" width="780" background="">
<tr>
	<td align="center" width="300" style="height: 28px" valign="top">
        <img src="../ControlPanel/IMAGES/LOGO.GIF" /><strong><span style="font-size: 24pt;
            color: white">E-Learning</span></strong></td>
	<td align="right" background="" style="height: 28px" dir="rtl">
        <asp:Label ID="lblusr" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White"></asp:Label>
	<br />
        <asp:LinkButton ID="lbtn_logout" runat="server" Font-Bold="True" Font-Size="Smaller"
            ForeColor="Yellow" OnClick="lbtn_logout_Click">Log Out</asp:LinkButton><br/>
        &nbsp;<asp:Label ID="lbl_lst_log" runat="server" ForeColor="White"></asp:Label></td>
</tr>
</table>
        </td>
</tr>
</table>
        &nbsp;&nbsp;
    
    <table border="0" cellpadding="0" cellspacing="0" width="780" background="images/fon_top01.gif" height="46">
<tr>
	<td style="width: 780px" dir="rtl">
        <p class="menu01">
            <img align="middle" alt="" border="0" src="images/dokmeh.gif" style="color: #000000" />&nbsp;<a href="../Login/Login.aspx">
                <span>ورود</span></a> &nbsp;&nbsp;
            &nbsp;
            <img align="middle" alt="" border="0" src="images/dokmeh.gif" style="color: #000000" />
            <a href="#"><span>درباره ما</span></a> &nbsp;&nbsp;
            <img align="middle" alt="" border="0" src="images/dokmeh.gif" style="color: #000000" />
            <a href="#"><span>تماس با ما</span></a> &nbsp;&nbsp;
            </p>
	</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="780">
<tr>
	      <td width="487" valign="top"><img src="images/main01.jpg" width="487" height="211"><br>
	</td>
	<td width="250" background="images/fon_top02.jpg" dir="rtl">
<p style="font-size: 12px;"><img src="images/e03.gif" alt="" width="16" height="9" border="0">&nbsp;&nbsp;آخرین
    اخبار</p>
<p class="left"><img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">&nbsp;&nbsp;او
    خواهد آمد.</p><p class="left">
                <img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">
                &nbsp;&nbsp;آمریکا و اسرائیل در حال نابودی!</p>
        <a href=""></a>
        <p class="left">
            <img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">
            &nbsp;&nbsp;پرسپولیس 6 - 0 استقلال تهران</p>
        <p class="left">
            <img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">
            &nbsp;&nbsp;بالاخره ما ...</p>
	</td>
	<td><img src="images/e01.gif" width="43" height="211" alt="" border="0"></td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="780">
<tr bgcolor="#AFC0D0" valign="top">
	<td width="487" align="center" dir="ltr">
<br>
<p class="t01" style="font-size: 12px;"><img src="images/e02.gif" alt="" width="16" height="9" border="0">&nbsp;&nbsp;<strong>کنترل
    پانل</strong></p>
<table border="0" cellpadding="0" cellspacing="0" width="95%" align="right">
<tr valign="top">
	            <td align="right"> <br>
                  <br>
	</td>
	<td>
<p class="t01">
    <table border="0" cellpadding="1" cellspacing="0" dir="rtl">
        <tr>
            <td style="width: 129px; height: 13px">
                مربوط به دانشجو :</td>
            <td style="width: 106px; height: 13px">
                مربوط به استاد :</td>
            <td style="height: 13px">
                مربوط به دروس :</td>
        </tr>
        <tr>
            <td style="width: 129px; height: 13px">
                <input id="Button13" class="btn_stl_pnl" type="button" value="حذف دانشجو" onclick = "openwindow('../Del-Student.aspx')" /></td>
            <td style="width: 106px; height: 13px">
                <input id="Button14" class="btn_stl_pnl" type="button" value="ثبت استاد" onclick = "openwindow('../Register-Teacher.aspx')" /></td>
            <td style="height: 13px">
                <input id="Button15" class="btn_stl_pnl" type="button" value="ثبت دروس" onclick = "openwindow('../Register-Course.aspx')" /></td>
        </tr>
        <tr>
            <td style="width: 129px">
                مربوط به مدیر :</td>
            <td style="width: 106px">
                <input id="Button16" class="btn_stl_pnl" type="button" value="ویرایش استاد" onclick = "openwindow('../Edit-Teacher.aspx')" /></td>
            <td>
                &nbsp;<input id="Button17" class="btn_stl_pnl" type="button" value="ویرایش دروس" onclick = "openwindow('../Edit-Course.aspx')" /></td>
        </tr>
        <tr>
            <td style="width: 129px; height: 13px">
                <input id="Button18" class="btn_stl_pnl" type="button" value="تغییر اطلاعات مدیر" onclick = "openwindow('../Edit-Manager.aspx')" /></td>
            <td style="width: 106px; height: 13px">
                <input id="Button19" class="btn_stl_pnl" type="button" value="حذف استاد" onclick = "openwindow('../Del-Teacher.aspx')" /></td>
            <td style="height: 13px">
                <input id="Button20" class="btn_stl_pnl" type="button" value="حذف دروس" onclick = "openwindow('../Del-Course.aspx')" /></td>
        </tr>
        <tr>
            <td style="width: 129px; height: 13px">
                مرتضي آرين مهر
            </td>
            <td style="width: 106px; height: 13px">
                رضوان زهره</td>
            <td style="height: 13px">
                گزارش گیری :</td>
        </tr>
        <tr>
            <td style="width: 129px; height: 13px">
            </td>
            <td style="width: 106px; height: 13px">
            </td>
            <td style="height: 13px">
                <input id="Button21" class="btn_stl_pnl" type="button" value="لیست استادان" onclick = "openwindowlist('../List-Teachers.aspx')" /></td>
        </tr>
        <tr>
            <td style="width: 129px; height: 13px">
            </td>
            <td style="width: 106px; height: 13px">
            </td>
            <td style="height: 13px">
                <input id="Button22" class="btn_stl_pnl" type="button" value="لیست دانشجویان" onclick = "openwindowlist('../List-Students.aspx')" /></td>
        </tr>
        <tr>
            <td style="width: 129px; height: 13px">
            </td>
            <td style="width: 106px; height: 13px">
            </td>
            <td style="height: 13px">
                <input id="Button23" class="btn_stl_pnl" type="button" value="لیست دروس" onclick = "openwindowlist('../List-Courses.aspx')" /></td>
        </tr>
        <tr>
            <td style="width: 129px; height: 13px">
            </td>
            <td style="width: 106px; height: 13px">
            </td>
            <td style="height: 13px">
                <input id="Button24" class="btn_stl_pnl" type="button" value="اطلاعات یک دانشجو" onclick = "opendialog()" /></td>
        </tr>
        <tr>
            <td style="width: 129px; height: 13px">
            </td>
            <td style="width: 106px; height: 13px">
            </td>
            <td style="height: 13px">
                <input id="Button1" class="btn_stl_pnl" type="button" value="لیست دانشجویان تایید نشده" onclick = "openwindowlist('../List-student-unavailable.aspx')" /></td>
        </tr>
    </table>
</p>
	</td>
</tr>
</table>
	</td>
	<td width="2" background="images/dots_w.gif"><img src="images/px1.gif" alt="" width="1" height="1" border="0"></td>
	<td width="291" dir="rtl">
<br>
<p style="font-size: 12px;">&nbsp;&nbsp;<b>توضیحات
    <img src="images/e02.gif" alt="" width="16" height="9" border="0"></b></p>
<p class="right"><img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">&nbsp;<span
        style="font-size: 8pt">&nbsp;قسمت آخرین اخبار نمایشی است و در نسخه بعدی تکمیل
    میشود.</span></p>
        <p class="right">
            <span style="font-size: 8pt">
                <img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">
                صفحات درباره ما ، تماس باما ، نقشه سایت و راهنما در دست ساخت میباشد و بزودی آماده
                میشود.</span></p>
        <p class="right">
            <span style="font-size: 8pt">
                <br />
            </span><span style="font-size: 8pt">
                <img src="images/dot_g.gif" width="5" height="5" alt="" border="0" align="middle">
                در صورت درخواست تغییر یا امکانات بیشتر با پست الکترونیکی زیر تماس بگیرید.</span></p>
        <p class="right">
            mortezaaryn@gmail.com</p>
	</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="780" style="font-size: 8pt">
<tr>
	<td colspan="2"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
<tr bgcolor="#28549E">
	<td height="19" colspan="2"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
<tr>
	<td height="70"><p>Copyright ©2007 E-Learning.com</p></td>
	<td>
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
	<td valign="bottom" background="images/bg_right.gif" style="width: 18px"><img src="images/bg_right.gif" alt="" width="17" height="16" border="0"></td>
	<td width="50%" background="images/bg.gif"><img src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
</table>
</form>
</body>
</html>
