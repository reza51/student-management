-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 06:53 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_em`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
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
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nis`, `nama_lengkap`, `username`, `password`, `status`, `foto`) VALUES
(1, '0', 'Reza F S.Kom,S.H', 'reja@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Y', 'bertrand-russelljpg-20211019065010.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bk`
--

CREATE TABLE `tb_bk` (
  `id_kepsek` int(11) NOT NULL,
  `nip` varchar(15) NOT NULL,
  `nama_kepsek` varchar(120) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_bk`
--

INSERT INTO `tb_bk` (`id_kepsek`, `nip`, `nama_kepsek`, `email`, `password`, `foto`, `status`) VALUES
(1, '123456789011', 'Sujono M.Pd', 'amirudiin@gmail.com', '4ce8e48be6c978348e4a6f4754b050de5581be4b', 'kepala.png', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_guru`
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
-- Dumping data for table `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nip`, `nama_guru`, `email`, `password`, `foto`, `status`) VALUES
(5, '005', 'Reza F S.Kom', 'reza@gmail.com', 'reza', 'ps.PNG', 'Y'),
(10, '1998', 'M Suhar S.H', 'makar1998@gmail.com', '3c4a80dbdfac57d174d1cab8d11d03ad91888820', '4idid.jfif', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_izin`
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
-- Table structure for table `tb_jurnal`
--

CREATE TABLE `tb_jurnal` (
  `id_jurnal` int(50) NOT NULL,
  `id_mkelas` int(50) NOT NULL,
  `nis` int(50) NOT NULL,
  `tgl_jurnal` date NOT NULL,
  `nama_pelatih` varchar(200) NOT NULL,
  `minat` varchar(50) NOT NULL,
  `kegiatan` varchar(200) NOT NULL,
  `kelas` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_mapel`
--

CREATE TABLE `tb_master_mapel` (
  `id_mapel` int(11) NOT NULL,
  `kode_mapel` varchar(40) NOT NULL,
  `mapel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_mapel`
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
-- Table structure for table `tb_mengajar`
--

CREATE TABLE `tb_mengajar` (
  `id_mengajar` int(11) NOT NULL,
  `kode_pelajaran` varchar(30) NOT NULL,
  `hari` varchar(40) NOT NULL,
  `jam_mengajar` varchar(60) NOT NULL,
  `jamke` varchar(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_mkelas` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_thajaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mengajar`
--

INSERT INTO `tb_mengajar` (`id_mengajar`, `kode_pelajaran`, `hari`, `jam_mengajar`, `jamke`, `id_admin`, `id_mapel`, `id_mkelas`, `id_semester`, `id_thajaran`) VALUES
(14, 'MB-1707970307', 'Kamis', '07.00-09.00', '1', 1, 11, 13, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mkelas`
--

CREATE TABLE `tb_mkelas` (
  `id_mkelas` int(11) NOT NULL,
  `kd_kelas` varchar(40) NOT NULL,
  `nama_kelas` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mkelas`
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
(16, 'KL-1707809857', 'X BDIB C');

-- --------------------------------------------------------

--
-- Table structure for table `tb_semester`
--

CREATE TABLE `tb_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_semester`
--

INSERT INTO `tb_semester` (`id_semester`, `semester`, `status`) VALUES
(4, 'Ganjil', 0),
(5, 'Genap', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
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
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `tempat_lahir`, `tgl_lahir`, `jk`, `alamat`, `password`, `foto`, `status`, `th_angkatan`, `id_mkelas`) VALUES
(1, '001', 'Imam Hambali', 'Jakarta', '2020-03-01', 'L', 'Jl. Mawar', 'e193a01ecf8d30ad0affefd332ce934e32ffce72', '355-3553881_stockvader-predicted-adig-user-profile-icon-png-clipart.jpg', '1', 2020, 1),
(2, '002', 'Agis Sagita', 'bogor', '2012-06-02', 'P', 'jl. batok tenjo-bogor', '6fc978af728d43c59faa400d5f6e0471ac850d4c', '17603.png', '1', 2019, 3),
(3, '004', 'indah nuraeni', 'bogor', '2009-07-01', 'L', 'bogor', 'c63528a52274a35d1c07bd9e55a83c6eb073de81', '17603.png', '1', 2019, 1),
(4, '12345', 'Suci', 'TANGERANG', '2002-09-21', 'P', 'Kademangan', '8cb2237d0679ca88db6464eac60da96345513964', 'IMG_20180830_164642_853.jpg', '1', 2019, 1),
(5, '21460', 'Nopa Jaya P.B', 'Ponorogo', '2004-11-30', 'P', 'Sarpon', '78c18c4afde27898c4dbd18f77ba05b829420084', 'dogi.png', '1', 2019, 10),
(6, '0511', 'Tomy S', '', '2000-11-05', 'L', 'jl Sekar Wangi no 15 rt 7 rw 2  Sulut Kalbar', '59dc237df3d441b6d490394e32cd6a41b3358d2f', '4idid.jfif', '1', 2023, 13),
(7, '0511987', 'Krisna Wahyu Indra Kusuma', '', '2024-02-15', 'L', 'ponorogo', 'd76e02c3f0966e45f131500de637d9c15173a6c3', '5ce2657013cc7c0a135b778730639351cb0f8e51db5b77bf970c05a143a1534a.png', '1', 2020, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tb_thajaran`
--

CREATE TABLE `tb_thajaran` (
  `id_thajaran` int(11) NOT NULL,
  `tahun_ajaran` varchar(30) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_thajaran`
--

INSERT INTO `tb_thajaran` (`id_thajaran`, `tahun_ajaran`, `status`) VALUES
(7, '2019/2020', 0),
(8, '2020/2021', 0),
(9, '2022/2023', 0),
(10, '2023/2024', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_walikelas`
--

CREATE TABLE `tb_walikelas` (
  `id_walikelas` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_mkelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_walikelas`
--

INSERT INTO `tb_walikelas` (`id_walikelas`, `id_guru`, `password`, `id_mkelas`) VALUES
(1, 2, '', 1),
(2, 1, '', 2),
(3, 5, '', 3),
(4, 6, '', 1),
(5, 8, '', 2),
(6, 9, '6', 10);

-- --------------------------------------------------------

--
-- Table structure for table `_logabsensi`
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
-- Dumping data for table `_logabsensi`
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
(16, 11, 6, '2024-02-13', 'A', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_bk`
--
ALTER TABLE `tb_bk`
  ADD PRIMARY KEY (`id_kepsek`);

--
-- Indexes for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tb_izin`
--
ALTER TABLE `tb_izin`
  ADD PRIMARY KEY (`id_izin`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_mengajar` (`id_mengajar`);

--
-- Indexes for table `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  ADD PRIMARY KEY (`id_jurnal`),
  ADD KEY `id_mkelas` (`id_mkelas`);

--
-- Indexes for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `tb_mengajar`
--
ALTER TABLE `tb_mengajar`
  ADD PRIMARY KEY (`id_mengajar`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_guru` (`id_admin`);

--
-- Indexes for table `tb_mkelas`
--
ALTER TABLE `tb_mkelas`
  ADD PRIMARY KEY (`id_mkelas`);

--
-- Indexes for table `tb_semester`
--
ALTER TABLE `tb_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tb_thajaran`
--
ALTER TABLE `tb_thajaran`
  ADD PRIMARY KEY (`id_thajaran`);

--
-- Indexes for table `tb_walikelas`
--
ALTER TABLE `tb_walikelas`
  ADD PRIMARY KEY (`id_walikelas`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indexes for table `_logabsensi`
--
ALTER TABLE `_logabsensi`
  ADD PRIMARY KEY (`id_presensi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_bk`
--
ALTER TABLE `tb_bk`
  MODIFY `id_kepsek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  MODIFY `id_jurnal` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_mengajar`
--
ALTER TABLE `tb_mengajar`
  MODIFY `id_mengajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_mkelas`
--
ALTER TABLE `tb_mkelas`
  MODIFY `id_mkelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_semester`
--
ALTER TABLE `tb_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_thajaran`
--
ALTER TABLE `tb_thajaran`
  MODIFY `id_thajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_walikelas`
--
ALTER TABLE `tb_walikelas`
  MODIFY `id_walikelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `_logabsensi`
--
ALTER TABLE `_logabsensi`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
