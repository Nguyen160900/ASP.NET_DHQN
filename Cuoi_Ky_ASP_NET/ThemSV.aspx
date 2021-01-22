<%@ Page Title="Thêm sinh viên" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="ThemSV.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.ThemSV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <div class="form-ChinhsuaSV" style="margin: auto">      
        <table style="margin: auto">
            <tr>
                <td colspan="2"> <h1 style="text-align:center">THÔNG TIN SINH VIÊN</h1></td>
            </tr>
           
            <tr>
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtMaSinhVien" runat="server" placeholder="Mã sinh viên"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox CssClass="text text1" ID="txtHoTen" runat="server" placeholder="Họ tên sinh viên"></asp:TextBox>
                </td>
            </tr>            
            <tr>  
                <td>
                    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
                    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                    <input class="text datepicker" id="datepicker" name="ngaySinh" width="320" placeholder="Ngày sinh"/>
                    <script>
                        $('#datepicker').datepicker({
                            showOtherMonths: true
                        });
                    </script>
                </td>
                 <td>
                    <asp:TextBox CssClass="text text1" ID="txtDanToc" runat="server" placeholder="Dân tộc"></asp:TextBox>
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
                <td>
                    <asp:TextBox CssClass="text" ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:TextBox CssClass="text" ID="txtCMND" runat="server" placeholder="CMND"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox CssClass="text" ID="txtTonGiao" runat="server" placeholder="Tôn giáo"></asp:TextBox>
                </td>
            </tr>
          
            <tr>
                <td>
                    <asp:DropDownList CssClass="drop" ID="dropQueQuan" runat="server" placeholder="Quê quán"></asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox CssClass="text" ID="txtSDT" runat="server" placeholder="Số điện thoại"></asp:TextBox>
                </td>
            </tr>
           
            <tr>
                
                <td>
                    <asp:DropDownList CssClass="drop" ID="dropKhoa" runat="server" OnSelectedIndexChanged="dropKhoa_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>Chọn khoa</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList CssClass="drop" ID="dropNganh" runat="server">
                        <asp:ListItem>Chọn ngành</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:DropDownList  CssClass="drop" ID="dropKhoaHoc" runat="server" OnSelectedIndexChanged="dropKhoaHoc_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList CssClass="drop" ID="dropChucVu" runat="server"></asp:DropDownList>
                </td>
            </tr>
           
            <tr>
                <td>
                    <asp:DropDownList  CssClass="drop" ID="dropLop" runat="server" AutoPostBack="True">
                        <asp:ListItem>Chọn lớp</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList  CssClass="drop" ID="dropTinhTrang" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:Button CssClass="btn" ID="btnThem" runat="server" Text="Thêm sinh viên" OnClick="btnThem_Click"/>
                </td>
                <td style="text-align:center">
                    <asp:Button CssClass="btn" ID="btnTroVe" runat="server" Text="Trở về" OnClick="btnTroVe_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
