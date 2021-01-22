<%@ Page Title="Cập nhật sinh viên" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="ChinhSuaSinhVien.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.ChinhSuaSinhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <div class="form-ChinhsuaSV">      
        <table>
            <tr>
                <td colspan="2"> <h1 style="text-align:center">CẬP NHẬT THÔNG TIN SINH VIÊN</h1></td>
            </tr>
            <tr>
                <td class="textSV">Mã sinh viên:</td>
                <td class="textSV">Họ tên:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtMaSinhVien" runat="server" Enabled="False" ></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtHoTen" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="textSV">Ngày sinh:</td>
                <td class="textSV">Dân tộc:</td>
            </tr>
            <tr>  
                <td>
                    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
                    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                    <input class="text datepicker " id="datepicker" name="ngaySinh" width="320" value="<%= NgaySinh %>" />
                    <script>
                        $('#datepicker').datepicker({
                            showOtherMonths: true
                        });
                    </script>
                </td>
                 <td>
                    <asp:TextBox CssClass="text text1" ID="txtDanToc" runat="server"></asp:TextBox>
                </td>                
            </tr>
            <tr>
                <td>
                    <div style="display:flex; align-items:center; margin-bottom:12px"><span class="textSV">Giới tính:</span>
                    <asp:RadioButtonList CssClass="sinhvien-GT" ID="rblGioiTinh" runat="server"  RepeatLayout="Table" RepeatColumns="2" CellSpacing="10">
                        <asp:ListItem Value="true">Nam</asp:ListItem>
                        <asp:ListItem Value="false">Nữ</asp:ListItem>
                    </asp:RadioButtonList></div>
                </td>
            </tr>
             <tr>
                <td class="textSV">Số CMND:</td>
                <td class="textSV">Tôn giáo:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtCMND" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtTonGiao" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="textSV">Quê quán:</td>
                 <td class="textSV">Số điện thoại:</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList CssClass="drop text1" ID="dropQueQuan" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtSDT" runat="server" ></asp:TextBox>
                </td>
            </tr>
             <tr>              
                <td class="textSV">Email:</td>
                <td class="textSV">Lớp:</td>
            </tr>
            <tr>
                
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtEmail" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtLop" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
             <tr>
               
                <td class="textSV">Chức vụ:</td>
                <td class="textSV">Tình trạng học:</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList CssClass="drop" ID="dropChucVu" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList CssClass="drop" ID="dropTinhTrang" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button CssClass="btn btn-sinhvien" ID="btnCapNhat" runat="server" Text="Cập nhật" OnClick="btnCapNhat_Click" />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-sinhvien" ID="btnTroVe" runat="server" Text="Trở về" OnClick="btnTroVe_Click"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
