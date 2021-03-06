<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register-Course.aspx.cs" Inherits="Register_course" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ثبت درس</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli" style="width: 400px" align="center">
            <tr>
                <td style="height: 11px" colspan="3">
                    <img src="images/top_reg_crs.gif" /></td>
            </tr>
            <tr>
                <td style="width: 18px; height: 15px">
                </td>
                <td style="width: 364px; height: 15px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="height: 15px" align="center" colspan="3">
                    <table border="0" cellpadding="2" cellspacing="0" style="width: 426px">
                        <tr>
                            <td style="height: 13px;" class="td_none" colspan="4">
                                ثبت درس توسط مدیر</td>
                        </tr>
                        <tr>
                            <td style="width: 2px" class="td_txt_cnt">
                                </td>
                            <td style="width: 135px" class="td_txt_cnt">
                                کد درس :</td>
                            <td style="width: 13px" class="td_txt_cnt">
                                <asp:TextBox ID="txtid" runat="server" CssClass="txt_stl" MaxLength="20"></asp:TextBox></td>
                            <td style="width: 3px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtid"
                                    ErrorMessage="کد درس را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 2px; height: 13px" class="td_txt_cnt">
                                </td>
                            <td style="width: 135px; height: 13px" class="td_txt_cnt">
                                نام درس :</td>
                            <td style="width: 13px; height: 13px" class="td_txt_cnt">
                                <asp:TextBox ID="txtname" runat="server" CssClass="txt_stl" MaxLength="30"></asp:TextBox></td>
                            <td style="height: 13px; width: 3px;" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname"
                                    ErrorMessage="نام درس را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 2px" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtunit"
                                    ErrorMessage="عددی از 1 تا 10 وارد کنید" MaximumValue="10" MinimumValue="1" Type="Integer" Display="None">*</asp:RangeValidator></td>
                            <td style="width: 135px" class="td_txt_cnt">
                                تعداد واحد :</td>
                            <td style="width: 13px" class="td_txt_cnt">
                                <asp:TextBox ID="txtunit" runat="server" CssClass="txt_stl" MaxLength="2"></asp:TextBox></td>
                            <td style="width: 3px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtunit"
                                    ErrorMessage="تعداد واحد درس را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 2px; height: 25px" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtprice"
                                    ErrorMessage="قیمت بین 5000 تومان تا 99999 تومان میباشد" MaximumValue="99999"
                                    MinimumValue="5000" Type="Integer" Display="None">*</asp:RangeValidator></td>
                            <td style="width: 135px; height: 25px" class="td_txt_cnt">
                                قیمت :</td>
                            <td style="width: 13px; height: 25px" class="td_txt_cnt">
                                <asp:TextBox ID="txtprice" runat="server" CssClass="txt_stl" MaxLength="10"></asp:TextBox></td>
                            <td style="height: 25px; width: 3px;" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtprice"
                                    ErrorMessage="قیمت را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 2px; height: 22px" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px; height: 22px" class="td_txt_cnt">
                                استاد :</td>
                            <td style="width: 13px; height: 22px" class="td_txt_cnt">
                                <asp:DropDownList ID="drdtch" runat="server" CssClass="txt_stl">
                                </asp:DropDownList></td>
                            <td style="height: 22px; width: 3px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 2px" class="td_txt_cnt">
                                </td>
                            <td style="width: 135px" class="td_txt_cnt">
                                توضیحات :</td>
                            <td style="width: 13px" class="td_txt_cnt">
                                <asp:TextBox ID="txtcomment" runat="server" CssClass="txt_stl" MaxLength="50" TextMode="MultiLine" Width="200px" Height="50px"></asp:TextBox></td>
                            <td style="width: 3px" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 2px; height: 5px" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px; height: 5px" class="td_txt_cnt">
                                به لیست دروس اضافه شود ؟</td>
                            <td style="width: 13px; height: 5px" class="td_txt_cnt">
                                <asp:RadioButtonList ID="rbl_add" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem>بلی</asp:ListItem>
                                    <asp:ListItem Selected="True">خیر</asp:ListItem>
                                </asp:RadioButtonList></td>
                            <td style="height: 5px; width: 3px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" colspan="4" style="height: 5px">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" colspan="4" style="height: 5px">
                                <span style="color: red">توجه :
                                    <br />
                                    در انتخاب تاریخ امتحانات دقت کنید چون سیستم با بررسی تاریخ وارد شده شما و&nbsp;
                                    تاریخ روز به دانشجویان اجازه می دهد تا در امتحانات شرکت کنند.&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" colspan="4" style="height: 5px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 2px; height: 25px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px; height: 25px;" class="td_txt_cnt">
                                تاریخ امتحان میان ترم :</td>
                            <td style="width: 13px; height: 25px;" class="td_txt_cnt">
                                <table>
                                    <tr>
                                        <td style="width: 3px">
                                            <asp:DropDownList ID="drddaymin" runat="server" CssClass="txt_stl" Width="80px">
                                            </asp:DropDownList></td>
                                        <td style="width: 4px">
                                            <asp:DropDownList ID="drdmonmin" runat="server" CssClass="txt_stl" Width="80px" AutoPostBack="True" OnSelectedIndexChanged="drdmonmin_SelectedIndexChanged">
                                            </asp:DropDownList></td>
                                        <td>
                                            <asp:DropDownList ID="drdyearmin" runat="server" CssClass="txt_stl" Width="80px">
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 3px; height: 25px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 2px;" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px;" class="td_txt_cnt">
                                تاریخ امتحان پایان ترم :</td>
                            <td style="width: 13px;" class="td_txt_cnt">
                                <table>
                                    <tr>
                                        <td style="width: 3px">
                                            <asp:DropDownList ID="drddaytrm" runat="server" CssClass="txt_stl" Width="80px">
                                            </asp:DropDownList></td>
                                        <td style="width: 4px">
                                            <asp:DropDownList ID="drdmontrm" runat="server" CssClass="txt_stl" Width="80px" AutoPostBack="True" OnSelectedIndexChanged="drdmontrm_SelectedIndexChanged">
                                            </asp:DropDownList></td>
                                        <td>
                                            <asp:DropDownList ID="drdyeartrm" runat="server" CssClass="txt_stl" Width="80px">
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 3px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 2px" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txt_cntq_min"
                                    ErrorMessage="تعداد سوالات بین 5و50 باشد" MaximumValue="50" MinimumValue="5"
                                    Type="Integer" Display="None">*</asp:RangeValidator></td>
                            <td style="width: 135px" class="td_txt_cnt">
                                تعداد سوالات میان ترم :</td>
                            <td style="width: 13px" class="td_txt_cnt">
                                <asp:TextBox ID="txt_cntq_min" runat="server" CssClass="txt_stl" MaxLength="3"></asp:TextBox></td>
                            <td style="width: 3px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_cntq_min"
                                    ErrorMessage="تعداد سوالات میان ترم را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 2px" class="td_txt_cnt">
                                &nbsp;<asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txt_cntq_trm"
                                    ErrorMessage="تعداد سوالات پایان ترم بین 20و100 باشد" MaximumValue="100" MinimumValue="20"
                                    Type="Integer" Display="None">*</asp:RangeValidator></td>
                            <td style="width: 135px" class="td_txt_cnt">
                                تعداد سوالات پایان ترم :</td>
                            <td style="width: 13px" class="td_txt_cnt">
                                <asp:TextBox ID="txt_cntq_trm" runat="server" CssClass="txt_stl" MaxLength="3"></asp:TextBox></td>
                            <td style="width: 3px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_cntq_trm"
                                    ErrorMessage="تعداد سوالات پایان ترم را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="4">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                    ShowMessageBox="True" ShowSummary="False" />
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 19px" class="td_none">
                                <input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />
                                <asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btn_ok_Click"
                                    Text="ثبت شود" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 18px; height: 15px">
                </td>
                <td style="width: 364px; height: 15px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="height: 15px" align="center" colspan="2">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click" CausesValidation="False">خروج از سیستم</asp:LinkButton></td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="width: 18px; height: 13px;">
                </td>
                <td style="width: 364px; height: 13px;">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
