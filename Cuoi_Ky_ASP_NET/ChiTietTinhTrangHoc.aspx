<%@ Page Title="Chi tiết tình trạng học" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="ChiTietTinhTrangHoc.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.ChiTietTinhTrangHoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <style>
        .dong1{
            text-align: center;
        }
    </style>
    <div>
        <div style="margin: 20px auto; justify-content: center; display: flex;">
            <asp:Label CssClass="lblTong" ID="lblLop" runat="server" Text=""></asp:Label>
        </div>        
        <div style="display: flex; font-size: 20px" class="tinhtrang">
            <span style="font-weight:800">Chọn tình trạng học: </span>
            <asp:RadioButtonList ID="ChonTinhTrangHoc" runat="server" RepeatLayout="Table" RepeatColumns="6" CellSpacing="10">
                <asp:ListItem Value="TatCa" Selected="True">Tất cả</asp:ListItem>
                <asp:ListItem Value="ConHoc">Còn học</asp:ListItem>
                <asp:ListItem Value="BuocThoiHoc">Buộc thôi học</asp:ListItem>
                <asp:ListItem Value="CanhBao">Cảnh báo</asp:ListItem>
                <asp:ListItem Value="ThoiHoc">Thôi học</asp:ListItem>
                <asp:ListItem Value="TotNghiep">Tốt nghiệp</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button CssClass="btn3" ID="btnTim" runat="server" Text="Lọc dữ liệu" OnClick="btnTim_Click" />
            <asp:Button CssClass="btn3" ID="btnIn" runat="server" Text="In thông tin" OnClick="btnIn_Click" />
            <asp:Button CssClass="btn3" ID="btnTroVe" runat="server" Text="Trở về" OnClick="btnTroVe_Click"/>
        </div>
        <div style="display: flex; font-size: 20px">
            <div style="margin: auto">
                <asp:GridView ID="data" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="STT" HeaderText="STT" ControlStyle-CssClass="dong1"/>
                        <asp:BoundField DataField="MaSinhVien" HeaderText="Mã sinh viên" />
                        <asp:BoundField DataField="HoTen" HeaderText="Họ tên sinh viên" />
                        <asp:BoundField DataField="TenTinhTrangHoc" HeaderText="Tình trạng học" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
