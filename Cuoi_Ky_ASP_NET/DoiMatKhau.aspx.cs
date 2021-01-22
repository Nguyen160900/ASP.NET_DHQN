using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtTenDangNhap.Text = Session["tendangnhap"].ToString(); 
        }

        DuLieuDataContext dl = new DuLieuDataContext();

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if(txtMatKhauMoi.Text == txtNhapLaiMatKhau.Text)
            {
                dl.capnhat_DangNhapTaiKhoan(txtTenDangNhap.Text, txtNhapLaiMatKhau.Text);
                ThongBao.Show("Cập nhật thành công");
            }
            else
            {
                ThongBao.Show("Mật khẩu mới và nhập lại mật khẩu không khớp");
            }
        }
    }
}