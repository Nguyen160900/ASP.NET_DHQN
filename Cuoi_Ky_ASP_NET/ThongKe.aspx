<%@ Page Title="Thống kê tình trạng học" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.ThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <style>
        .data{
            font-size: 18px;
        }
    </style>
    <div style="display: block">
        <h1 style="text-align:center">THỐNG KÊ TÌNH TRẠNG HỌC</h1>
        <div style="width: 100%; justify-content: center; display: flex">
            <asp:DropDownList CssClass="drop" ID="dropKhoa" runat="server" OnSelectedIndexChanged="dropKhoa_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem>Chọn khoa</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList CssClass="drop" ID="dropNganh" runat="server">
                <asp:ListItem>Chọn ngành</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList CssClass="drop" ID="dropKhoaHoc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropKhoaHoc_SelectedIndexChanged">
                <asp:ListItem>Chọn khóa học</asp:ListItem>
            </asp:DropDownList>
            <asp:Button CssClass="btn" ID="btnThongKe" runat="server" Text="Thống kê" OnClick="btnThongKe_Click" />
        </div>
        <div style="width: 100%">
            <asp:GridView CssClass="data" ID="dataThongKe" runat="server" style="text-align: center; margin: auto; text-decoration: none;" AutoGenerateColumns="False" OnSelectedIndexChanged="dataThongKe_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="MaLop" HeaderText="Mã lớp" />
                    <asp:BoundField DataField="TenLop" HeaderText="Tên lớp" />
                    <asp:BoundField DataField="ConHoc" HeaderText="Còn học" />
                    <asp:BoundField DataField="CanhBao" HeaderText="Cảnh báo" />
                    <asp:BoundField DataField="BuocThoiHoc" HeaderText="Buộc thôi học" />
                    <asp:BoundField DataField="ThoiHoc" HeaderText="Thôi học" />
                    <asp:BoundField DataField="TotNghiep" HeaderText="Tốt nghiệp" />
                    <asp:CommandField SelectText="Chi tiết" ShowSelectButton="True" ControlStyle-CssClass="drop1"/>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    
</asp:Content>
