using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cuoi_Ky_ASP_NET
{
    public partial class ThemSV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_Khoa();
                load_KhoaHoc();
                load_quequan();
                load_TinhTrangHoc();
                load_ChucVu();
                Page.DataBind();
            }    
        }

        DuLieuDataContext dl = new DuLieuDataContext();

        public void load_Khoa()
        {
            dropKhoa.DataSource = dl.load_Khoa();
            dropKhoa.DataTextField = "TenKhoa";
            dropKhoa.DataValueField = "MaKhoa";
            dropKhoa.DataBind();
        }

        public void load_KhoaHoc()
        {
            dropKhoaHoc.DataSource = dl.load_KhoaHoc();
            dropKhoaHoc.DataTextField = "MaKhoaHoc";
            dropKhoaHoc.DataValueField = "MaKhoaHoc";
            dropKhoaHoc.DataBind();
        }

        public void load_nganh()
        {
            dropNganh.DataSource = dl.tim_NganhKhiBietKhoa(dropKhoa.SelectedValue);
            dropNganh.DataTextField = "TenNganh";
            dropNganh.DataValueField = "MaNganh";
            dropNganh.DataBind();
        }

        public void load_lop()
        {
            dropLop.DataSource = dl.tim_LopKhiBietKhoaVaNganh(dropKhoaHoc.SelectedValue, dropNganh.SelectedValue);
            dropLop.DataTextField = "TenLop";
            dropLop.DataValueField = "Malop";
            dropLop.DataBind();
        }

        public void load_quequan()
        {
            dropQueQuan.DataSource = dl.load_QueQuan();
            dropQueQuan.DataTextField = "TenQueQuan";
            dropQueQuan.DataValueField = "MaQueQuan";
            dropQueQuan.DataBind();
        }

        public void load_ChucVu()
        {
            dropChucVu.DataSource = dl.load_ChucVu();
            dropChucVu.DataTextField = "TenChucVu";
            dropChucVu.DataValueField = "MaChucVu";
            dropChucVu.DataBind();
        } 
        
        public void load_TinhTrangHoc()
        {
            dropTinhTrang.DataSource = dl.load_TinhTrangHoc();
            dropTinhTrang.DataTextField = "TenTinhTrangHoc";
            dropTinhTrang.DataValueField = "MaTinhTrangHoc";
            dropTinhTrang.DataBind();
        }

        public bool KiemTra(string masv)
        {
            var q = from kt in dl.SinhViens
                    where kt.MaSinhVien == txtMaSinhVien.Text
                    select kt.MaSinhVien;
            if (q.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if(txtMaSinhVien.Text == "" || Request.Form["ngaySinh"].ToString() == "" ||  dropKhoa.SelectedValue == "" || dropNganh.SelectedValue == "" || dropKhoaHoc.SelectedValue == "" || dropLop.SelectedValue == "")
            {
                ThongBao.Show("Không được bỏ trống");
            }
            else
            {
                if(KiemTra(txtMaSinhVien.Text))
                {
                    ThongBao.Show("Mã sinh viên đã tồn tại");
                }
                else
                {
                    dl.them_SinhVien(txtMaSinhVien.Text, txtHoTen.Text, DateTime.Parse(Request.Form["ngaySinh"]), rblGioiTinh.SelectedValue, txtDanToc.Text, txtCMND.Text, txtTonGiao.Text, dropQueQuan.SelectedValue, txtSDT.Text, txtEmail.Text, dropChucVu.SelectedValue, dropLop.SelectedValue, dropTinhTrang.SelectedValue);
                    ThongBao.Show("Thêm thành công");
                }
            }
            
        }

        protected void btnTroVe_Click(object sender, EventArgs e)
        {
            Response.Redirect("SinhVien.aspx");
        }

        protected void dropKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_nganh();
        }

        protected void dropKhoaHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_lop();
        }
    }
}