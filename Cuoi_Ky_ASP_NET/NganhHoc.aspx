<%@ Page Title="Ngành học" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="NganhHoc.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.NganhHoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <style>
        .data{
            font-size: 18px;
        }
    </style>
    <h1 style="text-align:center">QUẢN LÝ NGÀNH HỌC</h1>
    <div style="display: flex">
        <div style="width: 50%">
            <div style="display: flex;">
                <asp:FileUpload CssClass="chonFile" ID="FileUploadExcel" runat="server" />
                <asp:Button CssClass="btn" ID="btnUploadFile" runat="server" Text="Thêm File Excel" OnClick="btnUploadFile_Click" />
            </div>
            <asp:DropDownList CssClass="drop" ID="ddlTenKhoa" runat="server">
                <asp:ListItem Value="">--Chọn khoa--</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox CssClass="text" ID="txtMaNganh" runat="server" placeholder="Nhập mã ngành"></asp:TextBox>
            <asp:TextBox CssClass="text" ID="txtTenNganh" runat="server" placeholder="Nhập tên ngành"></asp:TextBox>
            <div style="display: flex;">
                <asp:Button CssClass="btn" ID="btnThemNganh" runat="server" Text="Thêm" OnClick="btnThemNganh_Click"/>
                <asp:Button CssClass="btn" ID="btnCapNhapNganh" runat="server" Text="Cập nhật" OnClick="btnCapNhapNganh_Click"/>
                <asp:Button CssClass="btn" ID="btnLamMoi" runat="server" Text="Làm mới" OnClick="btnLamMoi_Click" />
            </div>
        </div>
        <div style="width: 50%">
            <div style="display: flex; margin: auto">
                <asp:TextBox CssClass="textTimKiem" ID="txtTimKiem" runat="server" placeholder="Nhập mã khoa hoặc tên khoa cần tìm"></asp:TextBox>
                <asp:Button CssClass="btn" ID="btnTimKiem" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click" />
            </div>
            <asp:GridView CssClass="data" ID="dataNganh" runat="server" style="text-align: center; margin: auto; text-decoration: none;" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="dataNganh_PageIndexChanging" OnRowDeleting="dataNganh_RowDeleting" OnSelectedIndexChanged="dataNganh_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="4">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaKhoa" HeaderText="Mã khoa" />
                    <asp:BoundField DataField="TenKhoa" HeaderText="Tên khoa" />
                    <asp:BoundField DataField="MaNganh" HeaderText="Mã ngành" />
                    <asp:BoundField DataField="TenNganh" HeaderText="Tên ngành" />
                    <asp:CommandField SelectText="Chỉnh sửa" ControlStyle-CssClass="drop1" ShowSelectButton="True" >
<ControlStyle CssClass="drop1"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField DeleteText="Xóa" ControlStyle-CssClass="drop1" ShowDeleteButton="True" >
<ControlStyle CssClass="drop1"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                
            </asp:GridView>
        </div>
    </div>
</asp:Content>
