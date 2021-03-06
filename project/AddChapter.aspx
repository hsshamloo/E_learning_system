<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddChapter.aspx.cs" Inherits="AddChapter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>تعریف فصل ها</title>
    <link href="css/def.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
   window.close();
}

// ]]>
</script>
</head>
<body >
   <form id="form1" runat="server">
   <div >
   <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli_op">
    <tr>
      <td style="height: 12px" colspan="5">
          <img src="images/top_reg_ch.gif" /></td>
    </tr>
    <tr>
      <td style="height: 15px"></td>
        <td colspan="3" style="height: 15px">
        </td>
      <td style="height: 15px"></td>
    </tr>
    <tr>
      <td colspan="5">
         <table dir=rtl   align=center cellpadding="4" border="0" cellspacing="0" >
             <tr>
                 <td align="center" class="td_none" dir="ltr" style="height: 17px" colspan="4">
                     اضافه کردن فصل<br />
                 </td>
             </tr>
              <tr>
                <td dir=ltr align="left" height="25" style="width: 4px" class="td_txt_cnt" >
                    </td>
                <td height="25" class="td_txt_cnt" style="width: 87px" align="right">
                    نام درس:</td>
                <td style="width: 131px;"  align=right colspan="" height="25" class="td_txt_cnt">
                    <asp:TextBox ID="Txtdarcname" runat="server" ReadOnly="True" CssClass="txt_stl" TabIndex="-1"></asp:TextBox></td>
                <td style="width: 10px" align="left" class="td_txt_cnt"></td>       
            </tr>
            <tr>
                <td dir=ltr align="left" height="25" style="width: 4px" class="td_txt_cnt" >
                    </td>
                <td height="25" class="td_txt_cnt" style="width: 87px" align="right"  >
                    نام فصل:</td>
                <td style="width: 131px;" align=right height="25" class="td_txt_cnt" >
                    <asp:TextBox ID="Txtfaslname" runat="server" TabIndex="2" MaxLength="50" CssClass="txt_stl" ></asp:TextBox></td>
               <td style="width: 10px" align="right" class="td_txt_cnt">
                <asp:RequiredFieldValidator  id="RequiredFieldValidator2" runat="server" Width="6px" ErrorMessage="نام فصل را وارد کنید" ControlToValidate="Txtfaslname" Height="10px">*</asp:RequiredFieldValidator>
               </td>            
            </tr>
            <tr>
                <td dir=ltr style="height: 5px; width: 4px;" align="left" class="td_txt_cnt" >
                <asp:RangeValidator id="RangeValidator2" runat="server" Width="1px" ErrorMessage="عددی بین 1 تا 99 وارد کنید" ControlToValidate="Txtbakhshnumber" Type="Integer" MinimumValue="1" MaximumValue="99" Display="None">*</asp:RangeValidator>
                </td>
                <td style="height: 5px; width: 87px;" class="td_txt_cnt" align="right">
                    تعداد بخش:</td>
                <td valign="top" style="width: 131px; height: 5px;" class="td_txt_cnt" align="right" >
                    <asp:TextBox ID="Txtbakhshnumber" runat="server" TabIndex="3" MaxLength="2" CssClass="txt_stl"></asp:TextBox></td>
                   <td style="width: 10px; height: 5px" align="right" class="td_txt_cnt">
                   <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" Width="9px" ErrorMessage="عددی بین 1 تا 99 وارد کنید" ControlToValidate="Txtbakhshnumber" Height="16px">*</asp:RequiredFieldValidator>
                   </td>        
            </tr>
            <tr>
                <td dir=ltr style="height: 27px; width: 4px;" align="left" class="td_txt_cnt" >
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None"
                        ErrorMessage="لینک فصل را درست وارد کنید" ControlToValidate="Txtfasllink" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?" Width="1px" >*</asp:RegularExpressionValidator></td>
                <td style="height: 27px; width: 87px;" class="td_txt_cnt" align="right">
                    لینک فصل:</td>
                <td style="width: 131px; height: 27px;" align="right" class="td_txt_cnt">
                    <asp:TextBox ID="Txtfasllink" runat="server" TabIndex="4" MaxLength="50" CssClass="txt_stl" ></asp:TextBox></td>
                <td style="height: 27px; width: 10px;" align="right" class="td_txt_cnt">
                <asp:RequiredFieldValidator  id="RequiredFieldValidator1" runat="server" Width="1px" ErrorMessage="لینک را وارد کنید" ControlToValidate="Txtfasllink" Height="12px">*</asp:RequiredFieldValidator>
                    </td>           
            </tr>
            <tr>
                <td dir=ltr style="height: 11px; width: 4px;" align="left" class="td_txt_cnt" >
                 <asp:RangeValidator id="RangeValidator1" runat="server" Width="1px" ErrorMessage="عددی بین 1 تا 99 وارد کنید" ControlToValidate="Txtquiznumber" Type="Integer" MinimumValue="1" MaximumValue="99" Height="7px" EnableTheming="True" Display="None">*</asp:RangeValidator>
                </td>
                <td style="height: 11px; width: 87px;" class="td_txt_cnt" align="right">
                    تعداد سوالات کویز:</td>
                <td    style="width: 131px; height: 11px;" align=right valign="top" class="td_txt_cnt">
                    <asp:TextBox ID="Txtquiznumber" runat="server" TabIndex="5" MaxLength="2" CssClass="txt_stl" ></asp:TextBox>&nbsp;
                </td>
                   <td style="width: 10px; height: 11px;" align="right" class="td_txt_cnt">
                     <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" Width="1px" ErrorMessage="عددی بین 1 تا 99 وارد کنید" ControlToValidate="Txtquiznumber" Height="18px">*</asp:RequiredFieldValidator>
                   </td>        
            </tr>
             <tr>
                 <td align="center" class="td_none" colspan="4" style="height: 2px">
          <asp:Label id="Lbmsg" runat="server" CssClass="txt_er" ></asp:Label>
         <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False"  Height="1px" Width="126px" DisplayMode="List"  />
                 </td>
             </tr>
            <tr>
                <td style="height: 24px;" align="center" class="td_none" colspan="4">
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                        value="انصراف" tabindex="7" />
                    &nbsp;<asp:Button ID="btnregester" runat="server" Text="ثبت" TabIndex="6" CssClass="btn_stl" OnClick="btnregester_Click"  />&nbsp;
                   
                </td>
            </tr>            
        </table>
          &nbsp; &nbsp;
        </td>
        </tr>
    <tr>
      <td style="height: 13px"></td>
        <td colspan="3" style="height: 13px" align="center">
            <asp:LinkButton ID="lbtn_logoff" runat="server" CausesValidation="False" OnClick="lbtn_logoff_Click1" TabIndex="8">خروج از سیستم</asp:LinkButton></td>
      <td style="height: 13px"></td>
    </tr>
    <tr>
      <td style="height: 14px"></td>
        <td colspan="3" style="height: 14px">
        </td>
      <td style="height: 14px"></td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
