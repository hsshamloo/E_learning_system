<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditChapter.aspx.cs" Inherits="EditChapter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ویرایش فصل</title>
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
    <table  class="tbl_asli_op" border="0" cellpadding="0" cellspacing="0" >
    <tr>
      <td colspan="3">
          <img src="images/top_edt_ch.gif" /></td>
    </tr>
    <tr>
        <td colspan="3" rowspan="2">
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
      <td colspan="3" align="center">
        <table cellpadding="4" border="0" cellspacing="0">
        <tr>
            <td class="td_none" style="height: 17px" valign="middle" colspan="4">
                ویرایش فصل</td>
        </tr>
        <tr>
            <td style="height: 17px; width: 10px;" valign="middle" class="td_none">
            </td>
        <td valign="middle" style="height: 17px; width: 92px;" align="right" class="td_none">
            نام فصل:</td>
        <td  valign="middle" style="width: 146px; height: 17px" class="td_none">
            <asp:DropDownList ID="drdfasl" runat="server" Width="137px" CssClass="txt_stl" TabIndex="1" AutoPostBack="True" OnSelectedIndexChanged="drdfasl_SelectedIndexChanged">
            </asp:DropDownList></td>
        <td  valign="middle" style="width: 7px; height: 17px;" class="td_none">
            </td>
        </tr>     
            <tr>
                <td dir="ltr" style="height: 25px; width: 10px;" class="td_txt_cnt">
                </td>
                <td dir=ltr style="height: 25px; width: 92px;" align="right" class="td_txt_cnt" >
                    : نام درس</td>
                <td style="width: 146px; height: 25px" align="right" class="td_txt_cnt" >
                    <asp:TextBox ID="Txtdarcname" runat="server" CssClass="txt_stl" TabIndex="2" MaxLength="50" ReadOnly="True"></asp:TextBox></td>
                <td colspan="" style="width: 7px; height: 25px;" align="right" class="td_txt_cnt">
                    </td>
            </tr>
            <tr>
                <td align="left" class="td_txt_cnt" dir="ltr" height="25" style="width: 10px">
                    </td>
                <td align="right" class="td_txt_cnt" height="25" style="width: 92px">
                    نام فصل:</td>
                <td align="right" class="td_txt_cnt" height="25" style="width: 146px">
                    <asp:TextBox ID="Txtfaslname" runat="server" CssClass="txt_stl" MaxLength="50" TabIndex="2"></asp:TextBox></td>
                <td align="right" class="td_txt_cnt" style="width: 7px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Txtfaslname"
                        ErrorMessage="نام فصل را وارد کنید" Height="10px" Width="0px">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" class="td_txt_cnt" style="width: 10px">
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="Txtbakhshnumber"
                        ErrorMessage="عددی بین 1 تا 99 وارد کنید" MaximumValue="99" MinimumValue="1"
                         Type="Integer" Display="None">*</asp:RangeValidator></td>
                <td dir=ltr height="25" align="right" class="td_txt_cnt" style="width: 92px" >
                    &nbsp;:تعداد بخش</td>
                <td height="25" style="width: 146px" align="right" class="td_txt_cnt">
                    <asp:TextBox ID="Txtbakhshnumber" runat="server" TabIndex="3" MaxLength="2" CssClass="txt_stl"  ></asp:TextBox></td>
                <td height="25" valign="top" style="width: 7px" align="right" class="td_txt_cnt" >
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Txtbakhshnumber"
                        ErrorMessage="عددی بین 1 تا 99 وارد کنید" >*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="td_txt_cnt" style="width: 10px">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txtfasllink"
                        Display="None" ErrorMessage="لینک فصل را درست وارد کنید" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                        Width="1px">*</asp:RegularExpressionValidator></td>
                <td dir=ltr align="right" class="td_txt_cnt" style="width: 92px" >
                    &nbsp;:لینک فصل</td>
                <td style="width: 146px" align="right" class="td_txt_cnt">
                    <asp:TextBox ID="Txtfasllink" runat="server" TabIndex="4" MaxLength="50" CssClass="txt_stl"></asp:TextBox></td>
                <td style="width: 7px;" align="right" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="Txtfasllink" ErrorMessage="لینک را وارد کنید">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="height: 21px; width: 10px;" class="td_txt_cnt">
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Txtkoeznumber"
                        ErrorMessage="عددی بین 1 تا 99 وارد کنید" MaximumValue="99" MinimumValue="1" Width="3px" EnableTheming="True" Type="Integer" Display="None"  >*</asp:RangeValidator></td>
                <td dir=ltr style="height: 21px; width: 92px;" align="right" class="td_txt_cnt" >
                    &nbsp;:تعداد سوالات کویز</td>
                <td style="height: 21px; width: 146px;" align="right" class="td_txt_cnt">
                    <asp:TextBox ID="Txtkoeznumber" runat="server" TabIndex="5" MaxLength="2" CssClass="txt_stl"></asp:TextBox></td>
                <td    style="width: 7px; height: 21px;" valign="top" align="right" class="td_txt_cnt">
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Txtkoeznumber"
                        ErrorMessage="عددی بین 1 تا 99 وارد کنید" >*</asp:RequiredFieldValidator></td>
            </tr>
        <tr>
            <td class="td_none" colspan="4" style="height: 3px" >
                <asp:Label ID="lb_er" runat="server" CssClass="txt_er"></asp:Label>
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
              ShowSummary="False" DisplayMode="List" />
            </td>
        </tr>
            <tr>
                <td style="height: 10px" class="td_none" colspan="4">
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                        value="انصراف" tabindex="7" />
                   <asp:Button ID="btnregester" runat="server" Text="ثبت" TabIndex="6" CssClass="btn_stl" OnClick="btnregester_Click"  />
                    </td>
            </tr>            
        </table> 
          &nbsp;</td>
    </tr>
    <tr>
     <td style="height: 13px" align="center" colspan="3">
         <asp:LinkButton ID="lbtn_logoff" runat="server" CausesValidation="False" OnClick="lbtn_logoff_Click1"
             Style="position: relative" TabIndex="8">خروج از سیستم</asp:LinkButton></td>
    </tr>     
    <tr>
     <td></td>
     <td></td>
     <td></td>    
    </tr>     
   </table>
    </div>
    </form>
</body>
</html>
