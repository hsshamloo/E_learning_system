<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteChapter.aspx.cs" Inherits="DeleteChapter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>حذف فصل</title>
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
    <table border="0" class="tbl_asli_op" cellpadding="0" cellspacing="0" >
    <tr>
     <td colspan="3">
         <img src="images/top_del_ch.gif" /></td>
    </tr>
    <tr>
     <td></td>
     <td></td>
     <td></td>
    </tr>
    <tr>
     <td style="height: 265px" align="center" colspan="3">
    <table dir=rtl   style=" height: 27px;" cellpadding="4" border="0" cellspacing="0">
        <tr>
            <td align="center" class="td_none" colspan="3" style="height: 21px" valign="middle">
                حذف فصل</td>
        </tr>
       
        <tr>
        <td style="height: 17px; width: 92px;" align="right" valign="middle" class="td_none">
            نام فصل:</td>
        <td valign="middle" class="td_none" align="right" style="width: 138px; height: 17px;">
            <asp:DropDownList ID="drdfasl" runat="server" Width="135px" CssClass="txt_stl" AutoPostBack="True" OnSelectedIndexChanged="drdfasl_SelectedIndexChanged">
            </asp:DropDownList></td>
        <td valign="middle" align="center" class="td_none" style="height: 17px; width: 3px;">
            </td>
        </tr>   
        <tr>
            <td align="right" class="td_txt_cnt" style="width: 92px; height: 21px" valign="middle">
                نام درس:</td>
            <td align="right" class="td_txt_cnt" style="width: 138px; height: 21px" valign="middle">
                <asp:TextBox ID="Txtdarcname" runat="server" CssClass="txt_stl" ReadOnly="True" Style="position: relative"></asp:TextBox></td>
            <td align="center" class="td_txt_cnt" style="width: 3px; height: 21px" valign="middle">
            </td>
        </tr>   
            <tr>
                <td dir=ltr align="right" height="25" style="width: 92px" class="td_txt_cnt" >
                    : تعداد بخش</td>
                <td height="25" style="width: 138px" class="td_txt_cnt" align="right">
                    <asp:TextBox ID="Txtbakhshnumber" runat="server" MaxLength="2" ReadOnly="True" CssClass="txt_stl"  ></asp:TextBox></td>
                <td align=right height="25" valign="top" style="width: 3px" class="td_txt_cnt" >
                    <br />
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td dir=ltr style="width: 92px;" align="right" height="25" class="td_txt_cnt" >
                    : لینک فصل</td>
                <td height="25" style="width: 138px" class="td_txt_cnt" align="right">
                    <asp:TextBox ID="Txtfasllink" runat="server" MaxLength="50" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                <td style="width: 3px;" align="right" height="25" class="td_txt_cnt">
                    </td>
            </tr>
            <tr>
                <td dir=ltr style="width: 92px; height: 2px;" align="right" class="td_txt_cnt" >
                    : تعداد سوالات کویز</td>
                <td style="height: 2px; width: 138px;" class="td_txt_cnt" align="right">
                    <asp:TextBox ID="Txtkoeznumber" runat="server" MaxLength="2" ReadOnly="True" CssClass="txt_stl"></asp:TextBox></td>
                <td    style="width: 3px; height: 2px;" align=right valign="top" class="td_txt_cnt">
                    <br />
                    &nbsp;
                </td>
            </tr>
        <tr>
            <td class="td_none" colspan="3" style="height: 3px">
                <asp:Label ID="lb_er" runat="server" CssClass="txt_er"></asp:Label></td>
        </tr>
            <tr>
                <td class="td_none" colspan="3" style="height: 6px">
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()"
                        type="button" value="انصراف" tabindex="2" />
                   <asp:Button ID="btnregester" runat="server" Text="حذف" TabIndex="1" CssClass="btn_stl" OnClick="btnregester_Click"  />
                    </td>
            </tr>            
        </table>      </td>
        </tr>
        <tr>
           <td style="height: 13px" align="center" colspan="3">
               <asp:LinkButton ID="lbtn_logoff" runat="server" CausesValidation="False" OnClick="lbtn_logoff_Click1"
                   Style="position: relative">خروج از سیستم</asp:LinkButton></td>
        </tr>
        <tr>
        <td style="height: 13px"></td>
        <td style="height: 13px"></td>
        <td style="height: 13px"></td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
