using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class ChinhSuaSinhVien : System.Web.UI.Page
    {
        DuLieuDataContext dl = new DuLieuDataContext();
        protected string NgaySinh { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_QueQuan();
                load_ChucVu();
                load_TinhTrangHoc();
                Page.DataBind();

                string ten = Session["masv"].ToString();
                var tim = dl.tim_SinhVien(ten);
                foreach (var tmp in tim)
                {
                    txtMaSinhVien.Text = tmp.MaSinhVien;
                    txtHoTen.Text = tmp.HoTen;
                    this.NgaySinh = tmp.NgaySinh.ToString();
                    txtDanToc.Text = tmp.DanToc;
                    string gioitinh = tmp.GioiTinh.ToString();
                    if (gioitinh == "True")
                    {
                        rblGioiTinh.ClearSelection();
                        rblGioiTinh.Items.FindByValue("true").Selected = true;
                    }
                    else
                    {
                        rblGioiTinh.ClearSelection();
                        rblGioiTinh.Items.FindByValue("false").Selected = true;
                    }
                    txtCMND.Text = tmp.SoCMND;
                    txtTonGiao.Text = tmp.TonGiao;
                    dropQueQuan.Items.FindByValue(tmp.MaQueQuan.ToString()).Selected = true;
                    txtSDT.Text = tmp.SDT;
                    txtEmail.Text = tmp.Email;
                    txtLop.Text = tmp.TenLop;
                    dropChucVu.Items.FindByValue(tmp.MaChucVu.ToString()).Selected = true;
                    dropTinhTrang.Items.FindByValue(tmp.MaTinhTrangHoc.ToString()).Selected = true;
                }
            }
        }

        public void load_QueQuan()
        {
            dropQueQuan.DataSource = dl.load_QueQuan();
            dropQueQuan.DataValueField = "MaQueQuan";
            dropQueQuan.DataTextField = "TenQueQuan";
        }   
        
        public void load_ChucVu()
        {
            dropChucVu.DataSource = dl.load_ChucVu();
            dropChucVu.DataValueField = "MaChucVu";
            dropChucVu.DataTextField = "TenChucVu";
        }

        public void load_TinhTrangHoc()
        {
            dropTinhTrang.DataSource = dl.load_TinhTrangHoc();
            dropTinhTrang.DataValueField = "MaTinhTrangHoc";
            dropTinhTrang.DataTextField = "TenTinhTrangHoc";
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            dl.capnhat_SinhVien(txtMaSinhVien.Text, txtHoTen.Text, rblGioiTinh.SelectedValue.ToString(), txtDanToc.Text, txtCMND.Text, txtTonGiao.Text, dropQueQuan.SelectedValue.ToString(), txtSDT.Text, txtEmail.Text, dropChucVu.SelectedValue.ToString(), dropTinhTrang.SelectedValue.ToString());
            ThongBao.Show("Cập nhật thành công");
        }

        protected void btnTroVe_Click(object sender, EventArgs e)
        {
            Response.Redirect("SinhVien.aspx");
        }
    }
}