<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit-Course.aspx.cs" Inherits="Edit_Course" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ویرایش درس</title>
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
        <table border="0" cellpadding="0" cellspacing="0" class="tbl_asli_op">
            <tr>
                <td style="height: 11px" colspan="3">
                    <img src="images/top_edt_crs.gif" /></td>
            </tr>
            <tr>
                <td style="height: 15px" align="center" colspan="3">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 469px">
                        <tr>
                            <td class="td_none" colspan="5">
                                ویرایش اطلاعات درس</td>
                        </tr>
                        <tr>
                            <td style="width: 53px" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px" class="td_txt_cnt">
                                <asp:Button ID="btn_srch" runat="server" OnClick="btn_srch_Click" Text="جستجو" CssClass="btn_stl" CausesValidation="False"  />
                                </td>
                            <td class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td style="width: 14px" class="td_txt_cnt">
                                <asp:DropDownList ID="drdcrs_name" runat="server"  CssClass="txt_stl">
                                </asp:DropDownList></td>
                            <td style="width: 8px" class="td_txt_cnt">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 53px" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px" class="td_txt_cnt">
                                کد درس :</td>
                            <td class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td style="width: 14px" class="td_txt_cnt">
                                <asp:TextBox ID="txtid" runat="server" ReadOnly="True"  CssClass="txt_stl"></asp:TextBox></td>
                            <td style="width: 8px" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 53px; height: 13px" class="td_txt_cnt">
                                </td>
                            <td style="width: 135px; height: 13px" class="td_txt_cnt">
                                نام درس :</td>
                            <td class="td_txt_cnt" style="width: 12px; height: 13px">
                            </td>
                            <td style="width: 14px; height: 13px" class="td_txt_cnt">
                                <asp:TextBox ID="txtname" runat="server"  CssClass="txt_stl" MaxLength="30"></asp:TextBox></td>
                            <td style="height: 13px; width: 8px;" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                                    ErrorMessage="نام درس را وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 53px" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtunit"
                                    Display="None" ErrorMessage="تعداد واحد عددی از 1 تا 10 وارد کنید" MaximumValue="10" MinimumValue="1"
                                    Type="Integer">*</asp:RangeValidator></td>
                            <td style="width: 135px" class="td_txt_cnt">
                                تعداد واحد :</td>
                            <td class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td style="width: 14px" class="td_txt_cnt">
                                <asp:TextBox ID="txtunit" runat="server"   CssClass="txt_stl" MaxLength="2"></asp:TextBox></td>
                            <td style="height: 24px; width: 8px;" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtunit"
                                    ErrorMessage="تعداد واحد عددی از 1 تا 10 وارد کنید">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 53px; height: 25px" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtprice"
                                    Display="None" ErrorMessage="قیمت بین 5000 تومان تا 99999 تومان میباشد" MaximumValue="99999"
                                    MinimumValue="5000" Type="Integer">*</asp:RangeValidator></td>
                            <td style="width: 135px; height: 25px" class="td_txt_cnt">
                                قیمت :</td>
                            <td class="td_txt_cnt" style="width: 12px; height: 25px">
                            </td>
                            <td style="width: 14px; height: 25px" class="td_txt_cnt">
                                <asp:TextBox ID="txtprice" runat="server"   CssClass="txt_stl" MaxLength="10"></asp:TextBox></td>
                            <td style="height: 25px; width: 8px;" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtprice"
                                    ErrorMessage="قیمت بین 5000 تومان تا 99999 تومان میباشد">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 53px; height: 22px" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px; height: 22px" class="td_txt_cnt">
                                استاد :</td>
                            <td align="center" class="td_txt_cnt" style="width: 12px; height: 22px">
                            </td>
                            <td style="width: 14px; height: 22px" class="td_txt_cnt" align="right">
                                
                                            <asp:DropDownList ID="drdtch" runat="server" CssClass="txt_stl" >
                                            </asp:DropDownList></td>
                            <td style="height: 22px; width: 8px;" class="td_txt_cnt">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 53px; height: 22px">
                            </td>
                            <td class="td_txt_cnt" style="width: 135px; height: 22px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 12px; height: 22px">
                            </td>
                            <td align="right" class="td_txt_cnt" style="width: 14px; height: 22px">
                                <asp:TextBox ID="txt_tch" runat="server" CssClass="txt_stl" Enabled="False" ReadOnly="True"
                                    Width="200px"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 8px; height: 22px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 53px" class="td_txt_cnt">
                                </td>
                            <td style="width: 135px" class="td_txt_cnt">
                                توضیحات :</td>
                            <td class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td style="width: 14px" class="td_txt_cnt">
                                <asp:TextBox ID="txtcomment" runat="server"   CssClass="txt_stl" MaxLength="50" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                            <td style="height: 24px; width: 8px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 53px; height: 5px" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px; height: 5px" class="td_txt_cnt">
                                به لیست دروس اضافه شود ؟</td>
                            <td class="td_txt_cnt" style="width: 12px; height: 5px">
                            </td>
                            <td style="width: 14px; height: 5px" class="td_txt_cnt">
                                <asp:RadioButtonList ID="rbl_add" runat="server" RepeatDirection="Horizontal" EnableViewState="False"  >
                                    <asp:ListItem Value="1">بلی</asp:ListItem>
                                    <asp:ListItem Value="0">خیر</asp:ListItem>
                                </asp:RadioButtonList></td>
                            <td style="height: 5px; width: 8px;" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 53px" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px" class="td_txt_cnt">
                                تاریخ امتحان میان ترم :</td>
                            <td align="center" class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td style="width: 14px" class="td_txt_cnt" align="center">
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
                            <td style="width: 8px" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 53px">
                            </td>
                            <td class="td_txt_cnt" style="width: 135px">
                                <span style="color: red">تاریخ قبلی :</span></td>
                            <td align="center" class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 14px">
                                <asp:TextBox ID="txt_min" runat="server" CssClass="txt_stl" Enabled="False" ForeColor="Red"
                                    ReadOnly="True"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 8px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 53px" class="td_txt_cnt">
                            </td>
                            <td style="width: 135px" class="td_txt_cnt">
                                تاریخ امتحان پایان ترم :</td>
                            <td align="center" class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td style="width: 14px" class="td_txt_cnt" align="center">
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
                            <td style="width: 8px" class="td_txt_cnt">
                                </td>
                        </tr>
                        <tr>
                            <td class="td_txt_cnt" style="width: 53px">
                            </td>
                            <td class="td_txt_cnt" style="width: 135px">
                                <span style="color: red">تاریخ قبلی :</span></td>
                            <td align="center" class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td align="center" class="td_txt_cnt" style="width: 14px">
                                <asp:TextBox ID="txt_trm" runat="server" CssClass="txt_stl" Enabled="False" ForeColor="Red"
                                    ReadOnly="True"></asp:TextBox></td>
                            <td class="td_txt_cnt" style="width: 8px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 53px" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txt_cntq_min"
                                    Display="None" ErrorMessage="تعداد سوالات بین 5و50 باشد" MaximumValue="50" MinimumValue="5"
                                    Type="Integer">*</asp:RangeValidator></td>
                            <td style="width: 135px" class="td_txt_cnt">
                                تعداد سوالات میان ترم :</td>
                            <td class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td style="width: 14px" class="td_txt_cnt">
                                <asp:TextBox ID="txt_cntq_min" runat="server"   CssClass="txt_stl" MaxLength="3"></asp:TextBox></td>
                            <td style="height: 24px; width: 8px;" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_cntq_min"
                                    ErrorMessage="تعداد سوالات بین 5و50 باشد">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 53px" class="td_txt_cnt">
                                <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txt_cntq_trm"
                                    Display="None" ErrorMessage="تعداد سوالات پایان ترم بین 20و100 باشد" MaximumValue="100"
                                    MinimumValue="20" Type="Integer">*</asp:RangeValidator></td>
                            <td style="width: 135px" class="td_txt_cnt">
                                تعداد سوالات پایان ترم :</td>
                            <td class="td_txt_cnt" style="width: 12px">
                            </td>
                            <td style="width: 14px" class="td_txt_cnt">
                                <asp:TextBox ID="txt_cntq_trm" runat="server"   CssClass="txt_stl" MaxLength="3"></asp:TextBox></td>
                            <td style="width: 8px" class="td_txt_cnt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_cntq_trm"
                                    ErrorMessage="تعداد سوالات پایان ترم بین 20و100 باشد">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="td_none" colspan="5">
                                <asp:Label ID="lbl_er" runat="server" CssClass="txt_er"></asp:Label>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                                    ShowMessageBox="True" ShowSummary="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height: 19px" class="td_none">
                                &nbsp;<input id="Button1" class="btn_stl" onclick="return Button1_onclick()" type="button"
                                    value="انصراف" />
                                <asp:Button ID="btn_ok" runat="server" CssClass="btn_stl" OnClick="btn_ok_Click"
                                    Text="ثبت شود" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 15px">
                </td>
                <td style="width: 364px; height: 15px">
                </td>
                <td style="height: 15px">
                </td>
            </tr>
            <tr>
                <td style="height: 15px" align="center" colspan="3">
                    <asp:LinkButton ID="lbtn_logoff" runat="server" OnClick="lbtn_logoff_Click" CausesValidation="False">خروج از سیستم</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="height: 13px">
                </td>
                <td style="width: 364px; height: 13px">
                </td>
                <td style="height: 13px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
