<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>تغییر کلمه عبور</title>
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
    <form dir=rtl     id="form1" runat="server">
    <div >
    <table class="tbl_asli_op" border="0" cellpadding="0" cellspacing="0"  >
     <tr>
      <td style="width: 3px"></td>
      <td style="width: 760px">
          <img src="images/top_edt_pass.gif" /></td>
      <td></td>
     </tr>
     <tr>
      <td style="width: 3px"></td>
      <td style="width: 760px"></td>
      <td></td>
     </tr>
     <tr>
     <td colspan="3" align="center">
        <table cellpadding="4" border="0" cellspacing="0"  >
            <tr>
                <td align="center" class="td_none" style="height: 17px" colspan="4">
                    تغییر رمز عبور</td>
            </tr>
             <tr>
               <td dir="rtl" style="width: 7px; height: 16px;" align="right" class="td_txt_cnt">                  </td>
               <td style="width: 71px; height: 16px;" dir="rtl" align="right" class="td_txt_cnt">
                   رمزقبلی:</td>
                 <td align="right" dir="rtl" style="height: 16px;" class="td_txt_cnt">
                   <asp:TextBox ID="Txtoldpass" runat="server" TextMode="Password" Width="140px" CssClass="txt_stl" TabIndex="1"></asp:TextBox></td>
                 <td align="right" class="td_txt_cnt" dir="rtl" style="width: 7px; height: 16px">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txtoldpass"
                       ErrorMessage="رمز قدیمی را وارد کنید" >*</asp:RequiredFieldValidator></td>
             </tr>
             <tr>
               <td style="height: 20px; width: 7px;" dir="rtl" align="right" class="td_txt_cnt">                  
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Txtnewpass"
                       Display="None" ErrorMessage="کلمه عبور 6 تا 20 کاراکتر میباشد" ValidationExpression=".{6,20}">*</asp:RegularExpressionValidator></td>
               <td style="width: 71px; height: 20px" dir="rtl" align="right" class="td_txt_cnt">
                   رمز جدید:</td>
                 <td align="right" dir="rtl" style="height: 20px" class="td_txt_cnt">
                   <asp:TextBox ID="Txtnewpass" runat="server" TextMode="Password" TabIndex="2" Width="140px" CssClass="txt_stl" ></asp:TextBox></td>
                 <td align="right" class="td_txt_cnt" dir="rtl" style="width: 7px; height: 20px">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Txtnewpass"
                       ErrorMessage="رمز جدید را وارد کنید" >*</asp:RequiredFieldValidator></td>
             </tr>
             <tr>
               <td dir="rtl" style="height: 16px; width: 7px;" valign="top" align="right" class="td_txt_cnt">
               <asp:CompareValidator id="NewPasswordCompare" runat="server" ErrorMessage="رمز تکرار شده با رمز جدید مطابق نیست" ControlToValidate="Txtrepeatpass" ControlToCompare="Txtnewpass" EnableTheming="True" Display="None" Height="10px" >*</asp:CompareValidator></td>
               <td style="width: 71px; height: 16px;" dir="rtl" valign="top" align="right" class="td_txt_cnt">
                   تکرار رمز جدید:</td>
                 <td align="right" dir="rtl" style="height: 16px" valign="top" class="td_txt_cnt">
                   <asp:TextBox ID="Txtrepeatpass" runat="server" TextMode="Password" TabIndex="3" Width="140px" CssClass="txt_stl" ></asp:TextBox></td>
                 <td align="right" class="td_txt_cnt" dir="rtl" style="width: 7px; height: 16px"
                     valign="top">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Txtrepeatpass"
                       ErrorMessage="رمز جدید را تکرار کنید" Display="Dynamic" >*</asp:RequiredFieldValidator></td>
             </tr>
            <tr>
           <td align="center" class="td_none" colspan="4" style="height: 4px">
              
            <asp:Label  ID="lb_er"  CssClass="txt_er" runat="server"  ></asp:Label>
       <asp:ValidationSummary ID="ValidationSummary2" runat="server" Height="31px" Width="172px" ShowMessageBox="True" ShowSummary="False" DisplayMode="List" />
           </td>
             <tr>
               <td style="height: 17px;" dir="rtl" align="center" class="td_none" colspan="4">
                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" tabindex="5"
                       type="button" value="انصراف" />
                 <asp:Button ID="btnregester" runat="server" Text="ثبت" TabIndex="4" CssClass="btn_stl"  OnClick="btnregester_Click"  /></td>
             </tr>
           </table>              </td> 
     </tr>  
     <tr>
      <td style="width: 3px; height: 13px;"></td>
      <td style="width: 760px; height: 13px;" align="center">
          <asp:LinkButton ID="lbtn_logoff" runat="server" CausesValidation="False" OnClick="lbtn_logoff_Click1"
               TabIndex="6">خروج از سیستم</asp:LinkButton></td>
      <td style="height: 13px"></td>
     </tr>
     <tr>
      <td style="width: 3px"></td>
      <td style="width: 760px"></td>
      <td></td>
     </tr>    
    </table>
    </div>
    </form>
</body>
</html>
