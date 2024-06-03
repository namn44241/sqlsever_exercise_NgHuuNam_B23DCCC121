# Báo cáo mô tả nội dung câu lệnh SQL

## Đề bài:

Cho tình huống xây dựng cơ sở dữ liệu với yêu cầu như sau: Một trường đại học có nhiều khoa giảng dạy. Thông tin về khoa bao gồm: Mã khoa, tên khoa, địa điểm văn phòng Khoa. Một khoa giảng dạy nhiều môn học. Thông tin về môn học gồm: Mã môn học, tên và số lượng tín chỉ môn học. Các sinh viên học các môn học bằng cách đăng ký lớp tín chỉ tương ứng. Thông tin của sinh viên gồm: Mã sinh viên, tên sinh viên. Thông tin lớp tín chỉ gồm: Mã lớp, thời gian bắt đầu, thời gian kết thúc. Hệ thống sẽ lưu điểm thi cuối phần của sinh viên tương ứng với lớp tín chỉ đã học.

Thực hiện yêu cầu sau:

1. Tạo các bảng dữ liệu quan hệ theo thiết kế của lược đồ quan hệ cho tình huống nêu trên vào hệ cơ sở dữ liệu (ví dụ: MS SQL Server)
2. Thực hiện thêm dữ liệu (tối thiểu 5 dòng) vào các bảng đã xây dựng nêu trên
3. Liệt kê danh sách các sinh viên học tại một lớp tín chỉ (Ví dụ: INT13) theo thứ tự Tên sinh viên với các trường thông tin gồm: Mã sinh viên, Tên sinh viên
4. Lập danh sách điểm thi cuối phần của một sinh viên (Ví dụ: sinh viên Nguyễn Văn A) với các trường thông tin gồm: Mã sinh viên, Tên sinh viên, Mã Lớp tín chỉ, Tên môn học, Điểm cuối phần
5. Lập danh sách thông tin các lớp đã có gồm: Mã lớp, Số sinh viên đã có điểm cuối phần trong lớp
6. Lập danh sách tính điểm trung bình chung của các sinh viên với các trường thông tin gồm: Mã sinh viên, Tên sinh viên, Điểm trung bình chung. Biết rằng điểm trung bình chung của một sinh viên bằng tổng các điểm cuối phần đã có chia cho số lượng môn học đã có điểm cuối phần

## Bài làm:

### 1. Lược đồ quan hệ & Bảng dữ liệu quan hệ

#### Lược đồ quan hệ:

- Lược đồ quan hệ sẽ được xây dựng như sau:

#### Bảng dữ liệu quan hệ:

- Bảng Khoa:
  - Mã khoa
  - Tên khoa
  - Địa điểm văn phòng Khoa

- Bảng DiemThi:
  - Mã sinh viên
  - Mã lớp
  - Điểm cuối phần

- Bảng SinhVien:
  - Mã sinh viên
  - Tên sinh viên

- Bảng MonHoc:
  - Mã môn học
  - Tên môn học
  - Số lượng tín chỉ

- Bảng LopTinChi:
  - Mã lớp
  - Thời gian bắt đầu
  - Thời gian kết thúc

### 2. Thêm dữ liệu

- Thêm dữ liệu vào các bảng với tối thiểu 5 dòng dữ liệu

#### Bảng Khoa:

```sql
INSERT INTO Khoa (MaKhoa, TenKhoa, DiaDiem)
VALUES
('K1', 'Khoa Công nghệ Thông tin', 'Tòa nhà A'),
('K2', 'Khoa Kinh tế', 'Tòa nhà B'),
('K3', 'Khoa Ngoại ngữ', 'Tòa nhà C'),
('K4', 'Khoa Khoa học Tự nhiên', 'Tòa nhà D'),
('K5', 'Khoa Luật', 'Tòa nhà E');
```

#### Bảng MonHoc:

```sql
INSERT INTO MonHoc (MaMonHoc, TenMonHoc, SoTinChi)
VALUES
('MH1', 'Lập trình C', 3),
('MH2', 'Kinh tế vi mô', 3),
('MH3', 'Tiếng Anh giao tiếp', 2),
('MH4', 'Toán cao cấp', 4),
('MH5', 'Luật dân sự', 3);
```

#### Bảng SinhVien:

```sql
INSERT INTO SinhVien (MaSinhVien, TenSinhVien)
VALUES
('SV1', 'Nguyễn Văn A'),
('SV2', 'Trần Thị B'),
('SV3', 'Lê Văn C'),
('SV4', 'Phạm Thị D'),
('SV5', 'Hoàng Văn E');
```

#### Bảng LopTinChi:

```sql
INSERT INTO LopTinChi (MaLop, ThoiGianBatDau, ThoiGianKetThuc)
VALUES
('LTC1', '2024-01-01', '2024-06-01'),
('LTC2', '2024-02-01', '2024-07-01'),
('LTC3', '2024-03-01', '2024-08-01'),
('LTC4', '2024-04-01', '2024-09-01'),
('LTC5', '2024-05-01', '2024-10-01');
```

#### Bảng DiemThi:

```sql
INSERT INTO DiemThi (MaSinhVien, MaLop, DiemCuoiPhan)
VALUES
('SV1', 'LTC1', 8.5),
('SV2', 'LTC1', 7.0),
('SV3', 'LTC2', 9.0),
('SV4', 'LTC3', 6.5),
('SV5', 'LTC4', 7.5);
```

### 3. Liệt kê danh sách các sinh viên học tại một lớp tín chỉ (Ví dụ: INT13) theo thứ tự Tên sinh viên với các trường thông tin gồm: Mã sinh viên, Tên sinh viên

```sql
SELECT sv.MaSinhVien, sv.TenSinhVien
FROM SinhVien sv
JOIN DiemThi dt ON sv.MaSinhVien = dt.MaSinhVien
WHERE dt.MaLop = 'INT13'
ORDER BY sv.TenSinhVien;
```

### 4. Lập danh sách điểm thi cuối phần của một sinh viên (Ví dụ: sinh viên Nguyễn Văn A) với các trường thông tin gồm: Mã sinh viên, Tên sinh viên, Mã Lớp tín chỉ, Tên môn học, Điểm cuối phần

```sql
SELECT sv.MaSinhVien, sv.TenSinhVien, ltc.MaLop, mh.TenMonHoc, dt.DiemCuoiPhan
FROM SinhVien sv
JOIN DiemThi dt ON sv.MaSinhVien = dt.MaSinhVien
JOIN LopTinChi ltc ON dt.MaLop = ltc.MaLop
JOIN MonHoc mh ON ltc.MaMonHoc = mh.MaMonHoc
WHERE sv.TenSinhVien = 'Nguyễn Văn A';
```

### 5. Lập danh sách thông tin các lớp đã có gồm: Mã lớp, Số sinh viên đã có điểm cuối phần trong lớp

```sql
SELECT ltc.MaLop, COUNT(dt.MaSinhVien) AS SoSinhVienCoDiem
FROM LopTinChi ltc
JOIN DiemThi dt ON ltc.MaLop = dt.MaLop
GROUP BY ltc.MaLop;
```

### 6. Lập danh sách tính điểm trung bình chung của các sinh viên với các trường thông tin gồm: Mã sinh viên, Tên sinh viên, Điểm trung bình chung

```sql
SELECT sv.MaSinhVien, sv.TenSinhVien, AVG(dt.DiemCuoiPhan) AS DiemTrungBinh
FROM SinhVien sv
JOIN DiemThi dt ON sv.MaSinhVien = dt.MaSinhVien
GROUP BY sv.MaSinhVien, sv.TenSinhVien;
```



