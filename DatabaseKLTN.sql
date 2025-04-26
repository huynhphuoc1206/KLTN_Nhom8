-- Tạo Database ---
CREATE DATABASE trungtamtienganh;
CREATE DATABASE English;

-- 1️. Bảng loai_tai_khoan (Phân quyền tài khoản) chốt
CREATE TABLE LoaiTaiKhoan(
    LoaiTK NVARCHAR(20) PRIMARY KEY not null,
);
-- insert Loaitaikhoan ----
INSERT INTO LoaiTaiKhoan (LoaiTK) VALUES ('admin');
INSERT INTO LoaiTaiKhoan (LoaiTK) VALUES ('giangvien');
INSERT INTO LoaiTaiKhoan (LoaiTK) VALUES ('hocvien');

-- 2️ Bảng tai_khoan (Quản lý tài khoản) -- chốt
CREATE TABLE TaiKhoan (
    TenDangNhap VARCHAR(50) PRIMARY KEY not null,
	LoaiTK NVARCHAR(20),
    MatKhau VARCHAR(20),
    Email VARCHAR(100),
    SDT VARCHAR(15),
    TrangThai NVARCHAR(50),
    FOREIGN KEY (LoaiTK) REFERENCES LoaiTaiKhoan(LoaiTK)
);
--- insert  taikhoan --- chốt
INSERT INTO TaiKhoan (TenDangNhap, LoaiTK, MatKhau, Email, SDT, TrangThai) 
VALUES ('admin', 'admin', '123', 'admin01@gmail.com', '0123456789', N'Hoạt động')
INSERT INTO TaiKhoan (TenDangNhap, LoaiTK, MatKhau, Email, SDT, TrangThai) 
VALUES ('phuoc', 'giangvien', '123', 'giangvien@gmail.com', '0123456778', N'Hoạt động')
INSERT INTO TaiKhoan (TenDangNhap, LoaiTK, MatKhau, Email, SDT, TrangThai) 
VALUES ('phuc', 'hocvien', '123', 'phuc@gmail.com', '0123456700', N'Hoạt động')
INSERT INTO TaiKhoan (TenDangNhap, LoaiTK, MatKhau, Email, SDT, TrangThai) 
VALUES ('thanh', 'hocvien', '123', 'thanh@gmail.com', '0123456766', N'Khóa')

-- 3️ Bảng hoc_vien (Thông tin học viên) -- chốt 
CREATE TABLE HocVien (
    IDHocVien INT IDENTITY(2500,1) PRIMARY KEY not null,
    IDTenDangNhap VARCHAR(50),
	TenHV NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
	DiaChi NVARCHAR(255),
    FOREIGN KEY (IDTenDangNhap) REFERENCES TaiKhoan(TenDangNhap)
);


-- 4️ Bảng giang_vien (Thông tin giảng viên) chốt ---
CREATE TABLE GiangVien (
    IDGiangVien INT IDENTITY(100,1) PRIMARY KEY not null,
    IDTenDangNhap VARCHAR(50),
	TenGV NVARCHAR(100),
	NgaySinh DATE,
	GioiTinh NVARCHAR(10),
	DiaChi NVARCHAR(255),
    ChuyenMon NVARCHAR(MAX),
    BangCap NVARCHAR(MAX),
    FOREIGN KEY (IDTenDangNhap) REFERENCES TaiKhoan(TenDangNhap)
);

-- 5️ Bảng khoa_hoc (Thông tin khóa học) chốt ---
CREATE TABLE KhoaHoc (
    IDKhoaHoc NVARCHAR(50) PRIMARY KEY not null ,
    TenKhoaHoc NVARCHAR(255),
	DanhMuc NVARCHAR(50),
    MoTa NVARCHAR(MAX),
    HocPhi DECIMAL(18),
	HinhAnhKH NVARCHAR(50),
);
--- insert  KhoaHoc --- chốt
INSERT INTO KhoaHoc(IDKhoaHoc, TenKhoaHoc, DanhMuc, MoTa, HocPhi, HinhAnhKH) 
VALUES ('TIA2025', N'TOEIC Cơ Bản', N'TOEIC', N'Cung cấp kiến thức cơ bản về TOEIC, 
tập trung vào kỹ năng Nghe và Đọc. Giúp người học làm quen với định dạng đề thi 
và các dạng câu hỏi thường gặp.', '2000000', N'TI_CoBan.jpg')

INSERT INTO KhoaHoc(IDKhoaHoc, TenKhoaHoc, DanhMuc, MoTa, HocPhi, HinhAnhKH) 
VALUES ('TIB2025', N'TOEIC Trung Cấp', N'TOEIC', N'Hướng đến người học đã có nền tảng
và muốn nâng cao kỹ năng làm bài TOEIC. Bổ sung phương pháp làm bài hiệu quả, tăng cường
vốn từ vựng và chiến lược xử lý bài thi.', '3000000', N'TI_TrungCap.jpg')

INSERT INTO KhoaHoc(IDKhoaHoc, TenKhoaHoc, DanhMuc, MoTa, HocPhi, HinhAnhKH) 
VALUES ('TILD2025', N'TOEIC Luyện Đề', N'TOEIC', N'Được thiết kế để ôn luyện thông 
qua đề thi thực tế, giúp người học làm quen với cấu trúc đề thi TOEIC và rèn luyện 
kỹ năng giải đề trong thời gian quy định.', '2000000', N'TI_LuyenDe.jpg')

INSERT INTO KhoaHoc(IDKhoaHoc, TenKhoaHoc, DanhMuc, MoTa, HocPhi, HinhAnhKH) 
VALUES ('TIMT2025', N'TOEIC Master', N'TOEIC', N'Khóa học chuyên sâu dành cho người 
muốn đạt điểm TOEIC cao, tập trung vào mẹo và chiến lược giúp tối ưu hóa điểm số 
trong kỳ thi chính thức.', '4000000', N'TI_Master.jpg')

INSERT INTO KhoaHoc(IDKhoaHoc, TenKhoaHoc, DanhMuc, MoTa, HocPhi, HinhAnhKH) 
VALUES ('IEA2025', N'IELTS Cơ Bản', N'IELTS', N'Khóa học giúp người học xây dựng nền 
tảng vững chắc về IELTS, bao gồm các kỹ năng Nghe, Nói, Đọc, Viết. Phù hợp với người 
mới bắt đầu hoặc muốn cải thiện căn bản.', '2000000', N'NULL')


-- 6️ Bảng phong_hoc (Quản lý phòng học) chốt ---
CREATE TABLE PhongHoc (
    IDPhongHoc INT PRIMARY KEY not null,
    TenPhong NVARCHAR(50),
    SucChua INT
);

-- 7️ Bảng lop_hoc (Thông tin lớp học) chốt---
CREATE TABLE LopHoc (
    IDLopHoc NVARCHAR(50) PRIMARY KEY not null ,
	IDPhongHoc INT,
    IDKhoaHoc NVARCHAR(50),
    IDGiangVien INT,
	TenLop VARCHAR(100),
    NgayBatDau DATE,
    NgayKetThuc DATE,
	Slot INT,
	ThuTrongTuan NVARCHAR(50),
	GioHocBD TIME,
	GioHocKT TIME,
    FOREIGN KEY (IDKhoaHoc) REFERENCES KhoaHoc(IDKhoaHoc),
    FOREIGN KEY (IDGiangVien) REFERENCES GiangVien(IDGiangVien),
	FOREIGN KEY (IDPhongHoc) REFERENCES PhongHoc(IDPhongHoc)
);
-- Insert LopHoc
INSERT INTO LopHoc(IDLopHoc, IDPhongHoc, IDKhoaHoc, IDGiangVien, TenLop, NgayBatDau, NgayKetThuc, Slot, ThuTrongTuan, GioHocBD, GioHocKT)
VALUES 
('LH001', NULL, 'TIA2025', NULL, N'TIA1', '2025-05-01', '2025-07-01', 20, N'Thứ 2, Thứ 4', '08:00:00', '10:00:00'),

('LH006', NULL, 'TIA2025', NULL, N'TIA2', '2025-05-01', '2025-07-01', 20, N'Thứ 3, Thứ 5', '08:00:00', '10:00:00'),

('LH002', NULL, 'TIB2025', NULL, N'TIB1', '2025-05-02', '2025-07-10', 20, N'Thứ 3, Thứ 5', '13:30:00', '15:30:00'),

('LH003', NULL, 'TILD2025', NULL, N'TILD1', '2025-05-03', '2025-07-15', 20, N'Thứ 2, Thứ 6', '18:00:00', '20:00:00'),

('LH004', NULL, 'TIMT2025', NULL, N'TIMT1', '2025-05-04', '2025-08-04', 20, N'Thứ 7, Chủ Nhật', '09:00:00', '11:00:00'),

('LH005', NULL, 'IEA2025', NULL, N'IEA1', '2025-05-05', '2025-07-20', 20, N'Thứ 3, Thứ 5', '18:30:00', '20:30:00');



-- 9️ Bảng tai_lieu (Quản lý tài liệu)
CREATE TABLE TaiLieu (
    IDTaiLieu INT IDENTITY(1,1) PRIMARY KEY not null,
    IDKhoaHoc NVARCHAR(50),
    TenTaiLieu NVARCHAR(255),
    FileURL NVARCHAR(MAX),
    FOREIGN KEY (IDKhoaHoc) REFERENCES KhoaHoc(IDKhoaHoc)
);

-- 10 Bảng thanh_toan (Lịch sử thanh toán)
CREATE TABLE ThanhToan (
    IDThanhToan INT IDENTITY(1,1) PRIMARY KEY not null,
	IDLopHoc NVARCHAR(50),
    TenDangNhap VARCHAR(50),
    IDKhoaHoc NVARCHAR(50),
    SoTien DECIMAL(18),
    PhuongThucTT NVARCHAR(50),
    NgayThanhToan DATETIME,
    TrangThai NVARCHAR(50),
	FOREIGN KEY (IDLopHoc) REFERENCES Lophoc(IDLopHoc),
    FOREIGN KEY (TenDangNhap) REFERENCES TaiKhoan(TenDangNhap),
    FOREIGN KEY (IDKhoaHoc) REFERENCES KhoaHoc(IDKhoaHoc)
);

--ALTER TABLE ThanhToan
--DROP COLUMN SoKhoaHoc;

-- 1️1 Bảng giao_dich_vnpay (Chi tiết giao dịch VNPay)
CREATE TABLE GiaoDichVNPAY (
    IDGiaoDich INT IDENTITY(102025,1) PRIMARY KEY not null ,
    IDThanhToan INT,
    MaGiaoDich VARCHAR(100),
    NgayGiaoDich DATETIME,
    SoTien DECIMAL(18),
    TrangThai NVARCHAR(50) ,
    NoiDung NVARCHAR(MAX),
    PhanHoiVNPAY NVARCHAR(MAX),
    FOREIGN KEY (IDThanhToan) REFERENCES ThanhToan(IDThanhToan)
);

-- 1️2 Bảng hoc_vien_lop_hoc (Danh sách học viên trong lớp)
CREATE TABLE HocVienLopHoc (
    IDHocVien INT,
    IDLopHoc NVARCHAR(50),
	PRIMARY KEY (IDHocVien, IDLopHoc),
    FOREIGN KEY (IDHocVien) REFERENCES HocVien(IDHocVien),
    FOREIGN KEY (IDLopHoc) REFERENCES LopHoc(IDLopHoc)
);


-- 1️3 Bảng diem_so (Quản lý điểm)
---- ielts---
CREATE TABLE DiemIELTS (
    IDHocVien INT,
    IDLopHoc NVARCHAR(50),
    DiemNghe DECIMAL(3,1),
    DiemNoi DECIMAL(3,1),
    DiemDoc DECIMAL(3,1),
    DiemViet DECIMAL(3,1),
    TongDiem DECIMAL(4,2),
    PRIMARY KEY (IDHocVien, IDLopHoc),
    FOREIGN KEY (IDHocVien, IDLopHoc) REFERENCES HocVienLopHoc(IDHocVien, IDLopHoc)
);
---toeic---
CREATE TABLE DiemTOEIC (
    IDHocVien INT,
    IDLopHoc NVARCHAR(50),
    
    -- Nghe
    Part1 INT,
    Part2 INT,
    Part3 INT,
    Part4 INT,
    DiemNghe INT,  -- tổng
    
    -- Đọc
    Part5 INT,
    Part6 INT,
    Part7 INT,
    DiemDoc INT,   -- tổng

    -- Nói & Viết
    DiemNoi INT,
    DiemViet INT,

    TongDiem INT,

    PRIMARY KEY (IDHocVien, IDLopHoc),
    FOREIGN KEY (IDHocVien, IDLopHoc) REFERENCES HocVienLopHoc(IDHocVien, IDLopHoc)
);

-- 1️4 Bảng thong_bao (Gửi thông báo)
CREATE TABLE ThongBao (
    IDThongBao INT IDENTITY(100,1) PRIMARY KEY not null,
    IDNguoiGui VARCHAR(50),
    IDNguoiNhan VARCHAR(50),
	IDLopHoc NVARCHAR(50), 
    TieuDe NVARCHAR(255),
    NoiDung NVARCHAR(MAX),
    NgayGui DATETIME,
    FOREIGN KEY (IDNguoiGui) REFERENCES TaiKhoan(TenDangNhap),
    FOREIGN KEY (IDNguoiNhan) REFERENCES TaiKhoan(TenDangNhap),
	FOREIGN KEY (IDLopHoc) REFERENCES LopHoc(IDLopHoc),

);
-- 15 Bảng danh_gia
CREATE TABLE DanhGia (
    IDDanhGia INT IDENTITY(100,1) PRIMARY KEY not null,
    IDHocVien INT,
    IDKhoaHoc NVARCHAR(50),
    NhanXet NVARCHAR(MAX),
    NgayDanhGia DATETIME,
    FOREIGN KEY (IDHocVien) REFERENCES HocVien(IDHocVien),
    FOREIGN KEY (IDKhoaHoc) REFERENCES KhoaHoc(IDKhoaHoc)
);

---16 Bang ChatBotNoiDung ---
CREATE TABLE ChatBotNoiDung(
    MaChat INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    CauHoiMau NVARCHAR(MAX),   -- Câu hỏi mẫu để admin dễ hiểu, dễ quản lý
    TuKhoa NVARCHAR(MAX),      -- Các từ khóa cách nhau bằng dấu phẩy để chatbot dò
    CauTraLoi NVARCHAR(MAX)    -- Câu trả lời mà chatbot sẽ phản hồi
);

-- Câu hỏi về khóa học tiếng Anh
INSERT INTO ChatBotNoiDung (CauHoiMau, TuKhoa, CauTraLoi)
VALUES 
('Khóa học tiếng Anh có mức học phí bao nhiêu?', 'học phí, bao nhiêu, khóa học, tiếng Anh', 'Khóa học tiếng Anh có mức học phí từ 1,000,000 VND đến 3,000,000 VND tuỳ thuộc vào khóa học cụ thể.'),

-- Câu hỏi về các lớp học
('Có lớp học vào cuối tuần không?', 'lớp học, cuối tuần, có không', 'Chúng tôi có các lớp học vào cuối tuần cho bạn thoải mái lựa chọn. Liên hệ chúng tôi để biết thêm chi tiết.'),

-- Câu hỏi về các giảng viên
('Giảng viên dạy khóa học này là ai?', 'giảng viên, dạy khóa học', 'Giảng viên dạy khóa học này là cô Nguyễn Thị Mai, người có hơn 10 năm kinh nghiệm giảng dạy tiếng Anh.')

