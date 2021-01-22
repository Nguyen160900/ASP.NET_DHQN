using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class Trang_dang_nhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        DuLieuDataContext dl = new DuLieuDataContext();

        public bool KiemTra(string tentaikhoan, string matkhau)
        {
            var q = from kt in dl.DangNhaps
                    where kt.TenDangNhap == txtTenDangNhap.Text && kt.MatKhau == txtMatKhau.Text
                    select kt;
            if (q.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            
            if (KiemTra(txtTenDangNhap.Text, txtMatKhau.Text))
            {
                if (!(txtTenDangNhap.Text == " ") || !(txtMatKhau.Text == " "))
                {
                    Session["tendangnhap"] = txtTenDangNhap.Text;
                    Session["matkhau"] = txtMatKhau.Text;
                    Response.Redirect("TrangChu.aspx");
                }
                else
                {
                    ThongBao.Show("Có lỗi. Vui lòng kiểm tra lại");
                }
            }
            else
            {
                ThongBao.Show("Tên đăng nhập không tồn tại");
            }
        }
    }
}