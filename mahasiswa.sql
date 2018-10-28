-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2018 at 03:03 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE IF NOT EXISTS `jurusan` (
`id_jurusan` int(2) NOT NULL,
  `namajurusan` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `namajurusan`) VALUES
(1, 'Budidaya Tanaman Pangan'),
(2, 'Budidaya Tanaman Perkebunan'),
(3, 'Teknologi Pertanian'),
(4, 'Peternakan'),
(5, 'Ekonomi dan Bisnis');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
`id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `npm` varchar(8) NOT NULL,
  `id_prodi` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `npm`, `id_prodi`) VALUES
(1, 'Raenita Anggraini Wita', '15753054', 1),
(2, 'Renta Wati', '15753059', 2),
(3, 'Vanny Annisa', '15753072', 3),
(4, 'Novita Sari', '15753051', 4),
(5, 'Riska Rahmatul Janah', '15753062', 4),
(6, 'Yohana Ayuningtias', '15753076', 5),
(7, 'Ratih Kartika sari', '15753057', 6),
(8, 'Triyana Maulida', '15753071', 7),
(9, 'Yonada Triayu Nalamba', '15753077', 8),
(10, 'Tri Okta Riana', '15753069', 10),
(11, 'okta r', '12345678', 8),
(14, 'udah tau', '9294956', 3);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE IF NOT EXISTS `prodi` (
`id_prodi` int(3) NOT NULL,
  `namaprodi` varchar(50) NOT NULL,
  `id_jurusan` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `namaprodi`, `id_jurusan`) VALUES
(1, 'Produksi Tanaman Pangan', 1),
(2, 'Hortikultura', 1),
(3, 'Produksi Tanaman Perkebunan', 2),
(4, 'Mekanisasi Pertanian', 3),
(5, 'Teknologi Pangan', 3),
(6, 'Produksi Ternak', 4),
(7, 'Budidaya Perikanan', 3),
(8, 'Agribisnis', 5),
(9, 'Akuntansi', 5),
(10, 'Manajemen Informatika', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
 ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
 ADD PRIMARY KEY (`id_mahasiswa`), ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
 ADD PRIMARY KEY (`id_prodi`), ADD KEY `id_jurusan` (`id_jurusan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
MODIFY `id_jurusan` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
MODIFY `id_prodi` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
