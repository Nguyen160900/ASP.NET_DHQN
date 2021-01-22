<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trang_dang_nhap.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.Trang_dang_nhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="styleDangNhap.css"/>
    <link rel="stylesheet" href="styleChung.css"/>
</head>
<body>
    <div class="bg-img">
        <form class="form1 content" runat="server">
        <div >
            <div >
                <br />
                <h2 class="hienthi">TRƯỜNG ĐẠI HỌC QUY NHƠN</h2>
                <div style="width:100%">
                    <asp:Image CssClass="anh2" ID="Image2" runat="server" ImageUrl="dh-qn.jpg" />
                </div>
                <h4 class="hienthi">CỔNG THÔNG TIN QUẢN LÝ SINH VIÊN</h4>
                <h3 class="hienthi">------<+>------</h3>
                <asp:TextBox CssClass="text" ID="txtTenDangNhap" runat="server" placeholder="Nhập mã đăng nhập"></asp:TextBox>
                <asp:TextBox CssClass="text" ID="txtMatKhau" runat="server" placeholder="Nhập mật khẩu" TextMode="Password"></asp:TextBox>
                <asp:Button CssClass="btn" ID="btnDangNhap" runat="server" Text="Đăng nhập" OnClick="btnDangNhap_Click"/>
            </div>
        </div>
    </form>
    </div>
</body>
</html>
