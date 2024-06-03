CREATE DATABASE TRUONGDAIHOC_Final 
USE TRUONGDAIHOC_Final 

CREATE TABLE Khoa (
	MaKhoa NCHAR(8) NOT NULL PRIMARY KEY,
	TenKhoa NCHAR(50) NOT NULL,
	DiaDiemVP NCHAR(100) NOT NULL
);
CREATE TABLE MonHoc (
	MaMonHoc NCHAR(8) NOT NULL PRIMARY KEY,
	TenMonHoc NCHAR(50) NOT NULL,
	SoTinChi INT NOT NULL
);
CREATE TABLE SinhVien (
	MaSinhVien NCHAR(8) NOT NULL PRIMARY KEY,
	TenSinhVien NCHAR(50) NOT NULL
);
CREATE TABLE LopTinChi (
	MaLop NCHAR(8) NOT NULL PRIMARY KEY,
	TGBatDau DATETIME NOT NULL,
	TGKetthuc DATETIME NOT NULL,
	MaMonHoc NCHAR(8) NOT NULL,
	MaKhoa NCHAR(8) NOT NULL,
	FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc),
	FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
);
CREATE TABLE DiemThi (
	MaDiemThi NCHAR(8) NOT NULL PRIMARY KEY,
	Diem FLOAT(2) NOT NULL,
	MaLop NCHAR(8) NOT NULL,
	MaSinhVien NCHAR(8) NOT NULL,
	FOREIGN KEY (MaLop) REFERENCES LopTinChi(MaLop),
	FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien)
);

-- Thêm d? li?u vào b?ng Khoa
INSERT INTO Khoa (MaKhoa, TenKhoa, DiaDiemVP) VALUES
('K001', 'Khoa Công Ngh? Thông Tin', 'Tòa nhà A'),
('K002', 'Khoa Kinh T?', 'Tòa nhà B'),
('K003', 'Khoa K? Thu?t', 'Tòa nhà C'),
('K004', 'Khoa Xã H?i', 'Tòa nhà D'),
('K005', 'Khoa Ngôn Ng?', 'Tòa nhà E');

-- Thêm d? li?u vào b?ng MonHoc
INSERT INTO MonHoc (MaMonHoc, TenMonHoc, SoTinChi) VALUES
('MH001', 'L?p trình C++', 3),
('MH002', 'Kinh t? vi mô', 3),
('MH003', 'V?t lý d?i cuong', 4),
('MH004', 'Xã h?i h?c', 2),
('MH005', 'Ti?ng Anh co b?n', 3),
('MH006', 'L?p trình Java', 3),
('MH007', 'Kinh t? vi mô', 3),
('MH008', 'Co h?c ?ng d?ng', 4),
('MH009', 'Tâm lý h?c', 2),
('MH010', 'Ti?ng Nh?t co b?n', 3);

-- Thêm d? li?u vào b?ng SinhVien
INSERT INTO SinhVien (MaSinhVien, TenSinhVien) VALUES
('SV001', 'Nguy?n Van A'),
('SV002', 'Tr?n Th? B'),
('SV003', 'Lê Van C'),
('SV004', 'Ph?m Th? D'),
('SV005', 'Hoàng Van E'),
('SV006', 'Nguy?n Th? F'),
('SV007', 'Phan Van G'),
('SV008', 'Vu Th? H'),
('SV009', 'Ð? Van I'),
('SV010', 'Lý Th? J');

-- Thêm d? li?u vào b?ng LopTinChi
INSERT INTO LopTinChi (MaLop, TGBatDau, TGKetthuc, MaMonHoc, MaKhoa) VALUES
('L001', '2024-09-01 08:00:00', '2024-12-15 10:00:00', 'MH001', 'K001'),
('L002', '2024-09-01 10:00:00', '2024-12-15 12:00:00', 'MH002', 'K002'),
('L003', '2024-09-01 13:00:00', '2024-12-15 15:00:00', 'MH003', 'K003'),
('L004', '2024-09-01 15:00:00', '2024-12-15 17:00:00', 'MH004', 'K004'),
('L005', '2024-09-02 08:00:00', '2024-12-16 10:00:00', 'MH005', 'K005'),
('L006', '2024-09-02 10:00:00', '2024-12-16 12:00:00', 'MH006', 'K001'),
('L007', '2024-09-02 13:00:00', '2024-12-16 15:00:00', 'MH007', 'K002'),
('L008', '2024-09-02 15:00:00', '2024-12-16 17:00:00', 'MH008', 'K003'),
('L009', '2024-09-03 08:00:00', '2024-12-17 10:00:00', 'MH009', 'K004'),
('L010', '2024-09-03 10:00:00', '2024-12-17 12:00:00', 'MH010', 'K005');

-- Thêm d? li?u vào b?ng DiemThi
INSERT INTO DiemThi (MaDiemThi, Diem, MaLop, MaSinhVien) VALUES
('D001', 8.5, 'L001', 'SV001'),
('D002', 7.0, 'L002', 'SV002'),
('D003', 9.0, 'L003', 'SV003'),
('D004', 6.5, 'L004', 'SV004'),
('D005', 8.0, 'L005', 'SV005'),
('D006', 7.5, 'L006', 'SV001'),
('D007', 6.8, 'L007', 'SV002'),
('D008', 8.7, 'L008', 'SV003'),
('D009', 7.2, 'L009', 'SV004'),
('D010', 8.3, 'L010', 'SV005'),
('D011', 9.0, 'L001', 'SV006'),
('D012', 6.0, 'L002', 'SV007'),
('D013', 7.9, 'L003', 'SV008'),
('D014', 8.4, 'L004', 'SV009'),
('D015', 7.6, 'L005', 'SV010');

SELECT SV.MaSinhVien, SV.TenSinhVien
FROM SinhVien SV
JOIN DiemThi DT ON SV.MaSinhVien = DT.MaSinhVien
WHERE DT.MaLop = 'L003'
ORDER BY SV.TenSinhVien;

SELECT SV.MaSinhVien, SV.TenSinhVien
FROM SinhVien SV
JOIN DiemThi DT ON SV.MaSinhVien = DT.MaSinhVien
WHERE DT.MaLop = 'L005';

SELECT SV.MaSinhVien, SV.TenSinhVien, LTC.MaLop, MH.TenMonHoc, DT.Diem
FROM SinhVien SV
JOIN DiemThi DT ON SV.MaSinhVien = DT.MaSinhVien
JOIN LopTinChi LTC ON DT.MaLop = LTC.MaLop
JOIN MonHoc MH ON LTC.MaMonHoc = MH.MaMonHoc
WHERE SV.TenSinhVien = 'Nguy?n Van A';

SELECT 
    LTC.MaLop,
    COUNT(DT.MaSinhVien) AS SoSinhVien
FROM 
    LopTinChi LTC
JOIN 
    DiemThi DT ON LTC.MaLop = DT.MaLop
GROUP BY 
    LTC.MaLop;


SELECT 
    SV.MaSinhVien,
    SV.TenSinhVien,
    AVG(DT.Diem) AS DiemTrungBinhChung
FROM 
    SinhVien SV
JOIN 
    DiemThi DT ON SV.MaSinhVien = DT.MaSinhVien
GROUP BY 
    SV.MaSinhVien, SV.TenSinhVien;

