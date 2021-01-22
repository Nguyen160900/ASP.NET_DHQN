<%@ Page Title="Quản lý sinh viên" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="SinhVien.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.SinhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <link rel="stylesheet" href="styleSinhVien.css"/>
    <style>
        .data{
            font-size: 18px;
            text-align:center
        }
    </style>
    <div>
        <h1 style="text-align:center">QUẢN LÝ SINH VIÊN</h1>
        <div style="display: flex;">
            <div style="display: flex; width:45%">
                <asp:FileUpload CssClass="chonFile" ID="FileUploadExcel" runat="server" />
                <asp:Button CssClass="btn" ID="btnUploadFile" runat="server" Text="Thêm file excel" OnClick="btnUploadFile_Click" />
            </div>
            <div style="display: flex; width: 55%">
                <asp:TextBox CssClass="textTimKiem" ID="txtTimKiem" runat="server" placeholder="Nhập mã sinh viên cần tìm"></asp:TextBox>
                <asp:Button CssClass="btn" ID="btnTimKiemSV" runat="server" Text="Tìm kiếm" OnClick="btnTimKiemSV_Click" />
                <asp:Button CssClass="btn" ID="btnThemSV" runat="server" Text="Thêm sinh viên" OnClick="btnThemSV_Click" />
            </div>
        </div>
        <div class="form-sinhvien" style="display: flex">
            <asp:DropDownList CssClass="drop" ID="ddlKhoa" runat="server" OnSelectedIndexChanged="ddlKhoa_SelectedIndexChanged" AutoPostBack="True" >
                <asp:ListItem>Chọn khoa</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList CssClass="dropNganh" ID="ddlnganh" runat="server" AutoPostBack="True">
                <asp:ListItem>Chọn ngành</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList CssClass="dropKhoaHoc" ID="ddlkhoahoc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlkhoahoc_SelectedIndexChanged">
                <asp:ListItem>Chọn khóa học</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList CssClass="dropLop" ID="ddllop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddllop_SelectedIndexChanged">
                <asp:ListItem>Chọn lớp</asp:ListItem>
            </asp:DropDownList>
            <asp:Button CssClass="btn" ID="btnTimKiem" runat="server" Text="Lọc dữ liệu" OnClick="btnTimKiem_Click" />
        </div>
        
        <div style="margin-top:20px" >
            <asp:GridView CssClass="data" ID="grdsinhvien" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grdsinhvien_SelectedIndexChanged" OnRowDeleting="grdsinhvien_RowDeleting">
                <Columns>
                    <asp:BoundField HeaderText="Mã sinh viên" DataField="MaSinhVien" />
                    <asp:BoundField HeaderText="Họ tên" DataField="HoTen" />
                    <asp:BoundField HeaderText="Ngày sinh" DataField="NgaySinh" />
                    <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
                    <asp:BoundField HeaderText="Dân tộc" DataField="DanToc" />
                    <asp:BoundField HeaderText="Số CMND" DataField="SoCMND" />
                    <asp:BoundField HeaderText="Tôn giáo" DataField="TonGiao" />
                    <asp:BoundField HeaderText="Quê quán" DataField="TenQueQuan" />
                    <asp:BoundField HeaderText="SDT" DataField="SDT" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:BoundField HeaderText="Chức vụ" DataField="TenChucVu" />
                    <asp:BoundField HeaderText="Lớp" DataField="TenLop" />
                    <asp:BoundField HeaderText="Tình trạng học" DataField="TenTinhTrangHoc" />
                    <asp:CommandField SelectText="Chỉnh sửa" ShowSelectButton="True" ControlStyle-CssClass="drop1"/>
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" ControlStyle-CssClass="drop1"/>
                </Columns>
            </asp:GridView>
           
        </div>
    </div>
</asp:Content>
