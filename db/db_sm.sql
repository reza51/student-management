-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Feb 2024 pada 08.07
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nis` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(5) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nis`, `nama_lengkap`, `username`, `password`, `status`, `foto`) VALUES
(1, '51551', 'Reza F S.Kom,S.H', 'reja@gmail.com', 'e91ae84b947633c0889e0a75e11c582bb8f89e2c', 'Y', 'bertrand-russelljpg-20211019065010.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nip` varchar(15) NOT NULL,
  `nama_guru` varchar(120) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nip`, `nama_guru`, `email`, `password`, `foto`, `status`) VALUES
(5, '005', 'Reza F S.Kom', 'reza@gmail.com', 'reza', 'ps.PNG', 'P'),
(10, '1998', 'M Suhar S.H', 'makar1998@gmail.com', '3c4a80dbdfac57d174d1cab8d11d03ad91888820', '4idid.jfif', 'P'),
(11, '9819489', 'Ahmad S.Gi', 'ahmd@gmail.com', '025e766d9c7ed66ef7573b51a0897d438b1fe504', 'pp1.jpg', 'Y'),
(12, '44234', 'Arman S.K', 'arman@gmail.com', 'ae51eff74599124b2708916f923b19275f6739ce', 'br.jpg', 'Y'),
(13, '89894839', 'Russel S.Ci', 'rsl@gmail.com', 'e19a717398901ad135874e0b5e94c96e2aee2b42', 'br.jpg', 'Y'),
(14, '123314', 'Russel S.Ci GGi', 'rslrich@gmail.com', '95c7599c4bd15db5a1bdf0af9120db7de306c6e0', 'br.jpg', 'P'),
(15, '00568342', 'Vijay S S.Kom,S.H', 'vijaybrara@gmail.com', 'c14cb4824f505327e25a0905888aed13ca1a99a6', 'br.jpg', 'Y'),
(16, 'A345245', 'Eva S.KOM', 'eva@gmail.com', 'fda867f28ccf0425c93b309caff1aac4ece4af27', 'pp3.jpg', 'P');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_izin`
--

CREATE TABLE `tb_izin` (
  `id_izin` int(3) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `id_mengajar` int(50) NOT NULL,
  `tgl_izin` date NOT NULL,
  `ket_izin` varchar(50) NOT NULL,
  `persetujuan` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurnal`
--

CREATE TABLE `tb_jurnal` (
  `id_jurnal` int(50) NOT NULL,
  `id_mkelas` int(50) NOT NULL,
  `id_guru` int(100) NOT NULL,
  `id_mapel` int(100) NOT NULL,
  `nis` int(50) NOT NULL,
  `tgl_jurnal` date NOT NULL,
  `kegiatan` varchar(200) NOT NULL,
  `kelas` varchar(200) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jurnal`
--

INSERT INTO `tb_jurnal` (`id_jurnal`, `id_mkelas`, `id_guru`, `id_mapel`, `nis`, `tgl_jurnal`, `kegiatan`, `kelas`, `foto`) VALUES
(1, 10, 0, 0, 29108, '2024-02-17', 'melukis pd3', 'X RPL A', ''),
(3, 9, 10, 15, 1998, '2024-02-18', 'menyelam laut natuna', '9', 'people-diver-divers-diving.jpg'),
(8, 9, 14, 11, 1243212, '2024-02-19', 'melukis masa depan', '', 'pp3.jpg'),
(9, 8, 10, 15, 1998, '2024-02-20', '', '', 'br.jpg'),
(10, 9, 10, 15, 1998, '2024-02-22', 're', '', 'people-diver-divers-diving.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_mapel`
--

CREATE TABLE `tb_master_mapel` (
  `id_mapel` int(11) NOT NULL,
  `kode_mapel` varchar(40) NOT NULL,
  `mapel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_master_mapel`
--

INSERT INTO `tb_master_mapel` (`id_mapel`, `kode_mapel`, `mapel`) VALUES
(11, 'MB-1707958418', 'Seni Lukis'),
(12, 'MB-1707958506', 'Sepak Bola'),
(13, 'MB-1707958546', 'Bola Voli'),
(14, 'MB-1707958554', 'Bulu Tangkis'),
(15, 'MB-1707958569', 'Renang'),
(16, 'MB-1707958581', 'Bola Basket'),
(17, 'MB-1707958594', 'Pemprograman'),
(18, 'MB-1707958624', 'Robotika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mengajar`
--

CREATE TABLE `tb_mengajar` (
  `id_mengajar` int(11) NOT NULL,
  `kode_pelajaran` varchar(30) NOT NULL,
  `hari` varchar(40) NOT NULL,
  `jam_mengajar` varchar(60) NOT NULL,
  `jamke` varchar(11) NOT NULL,
  `id_guru` int(99) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_mkelas` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_thajaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_mengajar`
--

INSERT INTO `tb_mengajar` (`id_mengajar`, `kode_pelajaran`, `hari`, `jam_mengajar`, `jamke`, `id_guru`, `id_mapel`, `id_mkelas`, `id_semester`, `id_thajaran`) VALUES
(15, 'MB-1708215290', 'Sabtu', '07.00-09.00', '9', 14, 15, 17, 5, 10),
(17, 'MB-1708215789', 'Selasa', '09.00-11.00', '9', 10, 15, 8, 5, 10),
(18, 'MB-1708478970', 'Rabu', '08.00-12.00', '1-3', 14, 13, 9, 5, 10),
(19, 'MB-1708479371', 'Rabu', '08.00-12.00', '2', 15, 12, 8, 5, 10),
(20, 'MB-1708479512', 'Rabu', '08.00-12.00', '2', 14, 13, 8, 5, 10),
(22, 'MB-1708653001', 'Sabtu', '00.00-03.00', '1', 16, 17, 11, 5, 10),
(23, 'MB-1709000583', 'Selasa', '08.00-12.00', '2', 10, 15, 10, 5, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mkelas`
--

CREATE TABLE `tb_mkelas` (
  `id_mkelas` int(11) NOT NULL,
  `kd_kelas` varchar(40) NOT NULL,
  `nama_kelas` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_mkelas`
--

INSERT INTO `tb_mkelas` (`id_mkelas`, `kd_kelas`, `nama_kelas`) VALUES
(8, 'KL-1698886411', 'XII RPL A'),
(9, 'KL-1698886431', 'XII RPL B'),
(10, 'KL-1698886442', 'XII RPL C'),
(11, 'KL-1707809780', 'X RPL A'),
(12, 'KL-1707809807', 'X RPL B'),
(13, 'KL-1707809818', 'X RPL C'),
(14, 'KL-1707809829', 'X BDIB A'),
(15, 'KL-1707809843', 'X BDIB B'),
(16, 'KL-1707809857', 'X BDIB C'),
(17, 'KL-1708151758', 'XI RPL D');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_semester`
--

CREATE TABLE `tb_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_semester`
--

INSERT INTO `tb_semester` (`id_semester`, `semester`, `status`) VALUES
(4, 'Ganjil', 0),
(5, 'Genap', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(60) NOT NULL,
  `nama_siswa` varchar(120) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `th_angkatan` year(4) NOT NULL,
  `id_mkelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `tempat_lahir`, `tgl_lahir`, `jk`, `alamat`, `password`, `foto`, `status`, `th_angkatan`, `id_mkelas`) VALUES
(1, '001', 'Imam Hambali', 'Jakarta', '2020-03-01', 'L', 'Jl. Mawar', 'e193a01ecf8d30ad0affefd332ce934e32ffce72', '355-3553881_stockvader-predicted-adig-user-profile-icon-png-clipart.jpg', '1', 2020, 1),
(3, '004', 'indah nuraeni', 'bogor', '2009-07-01', 'L', 'bogor', 'c63528a52274a35d1c07bd9e55a83c6eb073de81', '17603.png', '1', 2019, 1),
(4, '12345', 'Suci', 'TANGERANG', '2002-09-21', 'P', 'Kademangan', '8cb2237d0679ca88db6464eac60da96345513964', 'IMG_20180830_164642_853.jpg', '1', 2019, 1),
(5, '21460', 'Nopa Jaya P.B', 'Ponorogo', '2004-11-30', 'P', 'Sarpon', '78c18c4afde27898c4dbd18f77ba05b829420084', 'dogi.png', '1', 2019, 10),
(6, '0511', 'Tomy S', '', '2000-11-05', 'L', 'jl Sekar Wangi no 15 rt 7 rw 2  Sulut Kalbar', '59dc237df3d441b6d490394e32cd6a41b3358d2f', '4idid.jfif', '1', 2023, 13),
(7, '0511987', 'Krisna Wahyu Indra Kusuma', '', '2024-02-15', 'L', 'ponorogo', 'd76e02c3f0966e45f131500de637d9c15173a6c3', '5ce2657013cc7c0a135b778730639351cb0f8e51db5b77bf970c05a143a1534a.png', '1', 2020, 14),
(8, '34321', 'Abdul Sahid', 'Banja Negara', '2005-02-14', 'L', 'Sarpon', '1afef429595cfff1882572657598170c03f60654', 'pp1.jpg', '1', 2021, 9),
(9, '67696', 'Rina Putri', 'Jpeang', '2005-12-31', 'P', 'jepang', '88786e664ae1ef683dbe5543aa6cf10310111a4a', 'pp3.jpg', '1', 2020, 9),
(10, '8172998', 'Jatmiko', 'Ponorogo', '2024-02-20', 'L', 'Ponorogo', 'd781efc2e30d1f06c2c584b9add9c959d139302e', 'pp1.jpg', '1', 2021, 13),
(11, '521341', 'Ari Yani', 'ponorogo', '2024-02-22', 'P', 'ponorogo', '391aeecd1a387b61acdc10ea05863ec58eb330a9', 'pp3.jpg', '1', 2021, 17),
(12, '1213123', 'ari s', 'Ponorogo', '2009-02-23', 'L', 'ponorogo', 'a5d1c10496ab4161866ffd476c960cede586ac5d', 'br.jpg', '1', 2021, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_thajaran`
--

CREATE TABLE `tb_thajaran` (
  `id_thajaran` int(11) NOT NULL,
  `tahun_ajaran` varchar(30) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_thajaran`
--

INSERT INTO `tb_thajaran` (`id_thajaran`, `tahun_ajaran`, `status`) VALUES
(7, '2019/2020', 0),
(8, '2020/2021', 0),
(9, '2022/2023', 0),
(10, '2023/2024', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `_logabsensi`
--

CREATE TABLE `_logabsensi` (
  `id_presensi` int(11) NOT NULL,
  `id_mengajar` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tgl_absen` date NOT NULL,
  `ket` enum('H','I','S','T','A','C') NOT NULL,
  `pertemuan_ke` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `_logabsensi`
--

INSERT INTO `_logabsensi` (`id_presensi`, `id_mengajar`, `id_siswa`, `tgl_absen`, `ket`, `pertemuan_ke`) VALUES
(1, 2, 1, '2021-03-02', '', '1'),
(2, 4, 2, '2021-03-06', 'I', '1'),
(3, 2, 1, '2021-03-21', 'H', '2'),
(4, 2, 3, '2021-03-21', 'H', '3'),
(5, 5, 1, '2021-03-21', 'H', '1'),
(6, 5, 3, '2021-03-21', 'H', '1'),
(7, 2, 1, '2021-03-23', 'H', '4'),
(8, 2, 3, '2021-03-23', 'I', '4'),
(9, 6, 1, '2021-03-23', 'H', '1'),
(10, 6, 3, '2021-03-23', 'H', '1'),
(11, 6, 4, '2021-03-23', 'H', '1'),
(12, 6, 1, '2021-03-25', 'I', '2'),
(13, 6, 3, '2021-03-25', 'I', '2'),
(14, 6, 4, '2021-03-25', 'I', '2'),
(15, 10, 5, '2023-12-07', 'H', '1'),
(16, 11, 6, '2024-02-13', 'A', '1'),
(17, 17, 8, '2024-02-18', 'H', '1'),
(18, 17, 9, '2024-02-18', 'H', '1'),
(19, 17, 8, '2024-02-19', 'A', '2'),
(20, 17, 9, '2024-02-19', 'I', '2'),
(21, 17, 8, '2024-02-20', 'A', '3'),
(22, 17, 9, '2024-02-20', 'A', '3'),
(23, 17, 8, '2024-02-22', 'H', '4'),
(24, 17, 9, '2024-02-22', 'H', '4'),
(25, 22, 12, '2024-02-23', 'H', '1'),
(26, 23, 5, '2024-02-27', 'A', '1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `tb_izin`
--
ALTER TABLE `tb_izin`
  ADD PRIMARY KEY (`id_izin`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_mengajar` (`id_mengajar`);

--
-- Indeks untuk tabel `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  ADD PRIMARY KEY (`id_jurnal`),
  ADD KEY `id_mkelas` (`id_mkelas`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `tb_mengajar`
--
ALTER TABLE `tb_mengajar`
  ADD PRIMARY KEY (`id_mengajar`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indeks untuk tabel `tb_mkelas`
--
ALTER TABLE `tb_mkelas`
  ADD PRIMARY KEY (`id_mkelas`);

--
-- Indeks untuk tabel `tb_semester`
--
ALTER TABLE `tb_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `tb_thajaran`
--
ALTER TABLE `tb_thajaran`
  ADD PRIMARY KEY (`id_thajaran`);

--
-- Indeks untuk tabel `_logabsensi`
--
ALTER TABLE `_logabsensi`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_mengajar` (`id_mengajar`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  MODIFY `id_jurnal` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_mengajar`
--
ALTER TABLE `tb_mengajar`
  MODIFY `id_mengajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_mkelas`
--
ALTER TABLE `tb_mkelas`
  MODIFY `id_mkelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_semester`
--
ALTER TABLE `tb_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_thajaran`
--
ALTER TABLE `tb_thajaran`
  MODIFY `id_thajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `_logabsensi`
--
ALTER TABLE `_logabsensi`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_mengajar`
--
ALTER TABLE `tb_mengajar`
  ADD CONSTRAINT `tb_mengajar_ibfk_1` FOREIGN KEY (`id_mapel`) REFERENCES `tb_master_mapel` (`id_mapel`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
