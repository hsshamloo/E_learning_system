<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="StudentChangeProperties.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>تعییر مشخصات دانشجو</title>
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
 <div >
 <table class="tbl_asli_op" border="0" cellpadding="0" cellspacing="0" >
  <tr>
   <td colspan="4">
       <img src="images/top_edt_std.gif" /></td>
  </tr>
  <tr>
   <td style="height: 15px; width: 231px;"></td>
   <td style="height: 15px; width: 392px;" colspan="2"></td>
      <td style="height: 15px; width: 174px;">
      </td>
  </tr>
  <tr>
   <td colspan="4" align="center">
   <table cellpadding="4" style="width: 393px" border="0" cellspacing="0">
       <tr>
           <td align="center" class="td_none" colspan="4" style="height: 17px">
               تغییر اطلاعات دانشجو</td>
       </tr>
       <tr>
           <td align="center" class="td_none" colspan="4" style="height: 17px">
               <span style="color: #ff0000">توجه :&nbsp; نام و نام خانوادگی - نام پدر باید ابتدا حدالقل
                   یک حرف وارد کنید</span></td>
       </tr>
        <tr>
            <td dir="ltr" style="width: 3px; height: 1px" class="td_txt_cnt">
            </td>
               <td dir=ltr style="width: 92px; height: 1px" align="right" class="td_txt_cnt" >
                   &nbsp;:شماره دانشجوئی</td>
               <td style="width: 143px; height: 1px" align="right" class="td_txt_cnt">
                    <asp:TextBox ID="Txtdaneshjoid" runat="server" TabIndex="1" CssClass="txt_stl" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 1px; height: 1px;" align="right" class="td_txt_cnt">                    </td>
            </tr>
            <tr>
                <td dir="ltr" style="width: 3px; height: 7px" class="td_txt_cnt">
                    </td>
                <td dir=ltr style="width: 92px; height: 7px" align="right" class="td_txt_cnt"  >
                    &nbsp;:نام</td>
                <td style="width: 143px; height: 7px" align="right" class="td_txt_cnt" >
                    <asp:TextBox ID="Txtname" runat="server" TabIndex="2" CssClass="txt_stl" MaxLength="15"></asp:TextBox></td>
                <td  align=right colspan="" style="width: 1px; height: 7px;" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Txtname"
                        ErrorMessage="نام را وارد کنید" Width="1px">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" dir="ltr" style="width: 3px; height: 10px" class="td_txt_cnt">
                    </td>
                <td dir=ltr align="right" style="width: 92px; height: 10px" class="td_txt_cnt" >
                    &nbsp;:نام خانوادگی</td>
                <td style="width: 143px; height: 10px" align="right" class="td_txt_cnt" >
                    <asp:TextBox ID="Txtfamily" runat="server" TabIndex="3" CssClass="txt_stl" MaxLength="15"></asp:TextBox></td>
                <td align=right style="width: 1px; height: 10px;" class="td_txt_cnt" >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Txtfamily"
                        ErrorMessage="نام خانوادگی را وارد کنید" Width="5px">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" dir="ltr" style="width: 3px; height: 13px" class="td_txt_cnt">
                    </td>
                <td dir=ltr align="right" style="width: 92px; height: 13px" class="td_txt_cnt" >
                    &nbsp;:نام پدر</td>
                <td style="width: 143px; height: 13px" align="right" class="td_txt_cnt">
                    <asp:TextBox ID="Txtfathername" runat="server" TabIndex="4" CssClass="txt_stl" MaxLength="15"></asp:TextBox></td>
                <td align=right style="width: 1px; height: 13px;" class="td_txt_cnt" >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txtfathername"
                        ErrorMessage="نام پدر را وارد کنید" Width="1px">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" dir="ltr" style="width: 3px; height: 5px" class="td_txt_cnt">
                </td>
                <td dir=ltr style="width: 92px; height: 5px;" align="right" class="td_txt_cnt" >
                    :تاریخ تولد</td>
                <td style="width: 143px; height: 5px" align="center" class="td_txt_cnt" >
                    &nbsp;&nbsp;
                    <table border="0" cellpadding="2" cellspacing="0">
                        <tr>
                            <td style="height: 24px">
                    <asp:DropDownList ID="Drdday" runat="server"  TabIndex="5" CssClass="txt_stl">
                    </asp:DropDownList></td>
                            <td style="height: 24px">
                                <asp:DropDownList ID="Drdmonth" runat="server" TabIndex="6" CssClass="txt_stl" AutoPostBack="True" OnSelectedIndexChanged="Drdmonth_SelectedIndexChanged">
                    </asp:DropDownList></td>
                            <td style="height: 24px">
                                <asp:DropDownList ID="Drdyear" runat="server" TabIndex="7" CssClass="txt_stl">
                    </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
                <td style="width: 1px; height: 5px;" align="right" class="td_txt_cnt" >
                    </td>
            </tr>
            <tr>
                <td align="left" dir="ltr" style="width: 3px; height: 3px" class="td_txt_cnt">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txtmail"
                        ErrorMessage="آدرس پست الکترونیک را به طور صحیح وارد کنید" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="8px" style="position: relative" Height="17px" Display="None">*</asp:RegularExpressionValidator></td>
                <td dir=ltr align="right" style="width: 92px; height: 3px" class="td_txt_cnt" >
                    &nbsp;:پست الکترونیک</td>
                <td style="width: 143px; height: 3px" align="right" class="td_txt_cnt" >
                    <asp:TextBox ID="Txtmail" runat="server" TabIndex="8" CssClass="txt_stl" MaxLength="50"></asp:TextBox></td>
                <td align=right style="width: 1px; height: 3px;" class="td_txt_cnt">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Txtmail"
                        ErrorMessage="آدرس پست الکترونیک را وارد کنید" Width="1px" Height="10px">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" dir="ltr" style="width: 3px; height: 2px" class="td_txt_cnt">
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="Txtphon" Display="None" ErrorMessage="تلفن را صحیح وارد کنید"
                        ValidationExpression="[1-9]+\d{9,13}">*</asp:RegularExpressionValidator></td>
                <td dir=ltr align="right" style="width: 92px; height: 2px" class="td_txt_cnt" >
                    (تلفن:(با کد</td>
                <td style="width: 143px; height: 2px" align="right" class="td_txt_cnt">
                    <asp:TextBox ID="Txtphon" runat="server" TabIndex="9" MaxLength="15" CssClass="txt_stl"></asp:TextBox>(0)</td>
                <td align=right style="width: 1px; height: 2px;" class="td_txt_cnt" >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Txtphon"
                        ErrorMessage="شماره تلفن را وارد کنید" Width="1px" >*</asp:RequiredFieldValidator></td>
            </tr>    
       <tr>
           <td align="center" class="td_none" colspan="4" style="height: 4px">
              
            <asp:Label  ID="Lbmsg"  CssClass="txt_er" runat="server"  ></asp:Label>
       <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="31px" Width="172px" ShowMessageBox="True" ShowSummary="False" DisplayMode="List" />
           </td>
       </tr>
            <tr>
                <td align="center" class="td_none" colspan="4" style="height: 25px">
                    <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                        value="انصراف" />
                   <asp:Button ID="btnregester" runat="server" Text="ثبت" TabIndex="10" CssClass="btn_stl" OnClick="btnregester_Click"  /></td>
            </tr>            
        </table>
       <br/>
       &nbsp;
    </td>
   </tr>
     <tr>
         <td colspan="9" align="center">
             <asp:LinkButton ID="lbtn_logoff" runat="server" CausesValidation="False" OnClick="lbtn_logoff_Click1">خروج از سیستم</asp:LinkButton></td>
     </tr>
   <tr>
     <td colspan="4"></td>
   </tr>
  </table>    
 </div>
 </form>
</body>
</html>
