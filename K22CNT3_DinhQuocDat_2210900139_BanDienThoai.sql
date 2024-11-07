CREATE DATABASE K22CNT3_DinhQuocDat_2210900139_BanDienThoai;
USE K22CNT3_DinhQuocDat_2210900139_BanDienThoai;

CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY,
    Ho VARCHAR(50) NOT NULL,
    Ten VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    SoDienThoai VARCHAR(20),
    DiaChi TEXT
);

CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY,
    TenSanPham VARCHAR(100) NOT NULL,
    DanhMuc VARCHAR(50),
    Gia DECIMAL(10, 2) NOT NULL,
    TonKho INT DEFAULT 0
);

CREATE TABLE DonHang (
    MaDonHang INT PRIMARY KEY,
    MaKhachHang INT NOT NULL,
    NgayDat DATETIME DEFAULT CURRENT_TIMESTAMP,
    TongTien DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

CREATE TABLE ChiTietDonHang (
    MaChiTietDonHang INT PRIMARY KEY,
    MaDonHang INT NOT NULL,
    MaSanPham INT NOT NULL,
    SoLuong INT NOT NULL,
    Gia DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

CREATE TABLE ThanhToan (
    MaThanhToan INT PRIMARY KEY,
    MaDonHang INT NOT NULL,
    PhuongThucThanhToan VARCHAR(50) NOT NULL,
    SoTienThanhToan DECIMAL(10, 2) NOT NULL,
    NgayThanhToan DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
);
Select * from KhachHang
Select * from SanPham
Select * from DonHang
Select * from ChiTietDonHang
Select * from ThanhToan


INSERT INTO KhachHang (MaKhachHang, Ho, Ten, Email, SoDienThoai, DiaChi) VALUES
(1,'Nguyễn', 'Van A', 'nva@example.com', '0999514411', 'Hà Nội, Việt Nam'),
(2,'Đinh', 'Quốc Đạt', 'dqd@example.com', '0357100129', 'Hà Nội, Việt Nam');

INSERT INTO SanPham (MaSanPham, TenSanPham, DanhMuc, Gia, TonKho) VALUES
(1,'IP15', 'iphone', 15000.00, 10),
(2,'samsung galaxy', 'samsung', 12000.00, 7),
(3,'mastel', 'mastel', 17000.00, 8),
(4,'nokia a7', 'nokia', 19000.00, 9),
(5,'vivo a1', 'vivo', 14000.00, 8);

-- Bảng DonHang
INSERT INTO DonHang (MaDonHang, MaKhachHang, TongTien) VALUES
(1120,1, 15000.00),
(1121,2, 12000.00);

-- Bảng ChiTietDonHang
INSERT INTO ChiTietDonHang (MaChiTietDonHang,MaDonHang, MaSanPham, SoLuong, Gia) VALUES
(0010,1120, 1, 1, 15000.00),
(0011,1121, 2, 1, 12000.00);

-- Bảng ThanhToan
INSERT INTO ThanhToan (MaThanhToan,MaDonHang, PhuongThucThanhToan, SoTienThanhToan) VALUES
(0010,1120, 'Chuyển khoản ngân hàng', 15000.00),
(0011,1121, 'Thanh toán khi nhận hàng', 12000.00);
