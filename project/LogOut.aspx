<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogOut.aspx.cs" Inherits="LogOut_Manager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>محل خروج از سیستم</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli_op">
            <tr>
                <td>
                </td>
                <td style="width: 482px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 13px">
                </td>
                <td style="width: 482px; height: 13px">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td style="height: 13px" align="center" colspan="3">
                    <table border="0" cellpadding="3" cellspacing="0" style="width: 458px">
                        <tr>
                            <td style="width: 423px" class="td_none" colspan="3" align="center">
                                LogOut</td>
                        </tr>
                        <tr>
                            <td style="width: 423px; height: 13px" class="td_txt_cnt" colspan="3" align="center">
                                <span style="color: red">&nbsp;پيام مدير : مرتضي آرين مهر<br />
                                شما با موففقیت از سیستم خارج شده اید - برای ورود دوباره باید دوباره LOGIN کنید</span></td>
                        </tr>
                        <tr>
                            <td style="width: 423px" class="td_none" colspan="3">
                                <input id="Button1" class="btn_stl" type="button" value="بستن پنجره" onclick="return Button1_onclick()" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 13px">
                </td>
                <td style="width: 482px; height: 13px">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td style="height: 13px">
                </td>
                <td style="width: 482px; height: 13px">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td style="height: 13px">
                </td>
                <td style="width: 482px; height: 13px">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
