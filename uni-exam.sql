-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 28 Ağu 2022, 22:24:18
-- Sunucu sürümü: 10.4.24-MariaDB
-- PHP Sürümü: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `uni-exam`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `departments`
--

INSERT INTO `departments` (`id`, `name`, `slug`) VALUES
(1, 'Elektrik-Elektronik Mühendisliği', 'elektrik-elektronik-muhendisligi'),
(2, 'Bilgisayar Mühendisliği', 'bilgisayar-muhendisligi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `download_count` int(11) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `upload_date` date DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL,
  `download_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `exams`
--

INSERT INTO `exams` (`id`, `department_id`, `lecture_id`, `img_url`, `download_count`, `file_type`, `file_name`, `file_size`, `upload_date`, `status`, `download_url`) VALUES
(7, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/rhc0ecd1.jpg', 0, '.jpg', 'rhc0ecd1.jpg', '182.51', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/rhc0ecd1.jpg'),
(8, 1, 2, 'http://192.168.1.3/uni-exam-api/uploads/kbeuu1o1.jpg', 1, '.jpg', 'kbeuu1o1.jpg', '95.67', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/kbeuu1o1.jpg'),
(9, 1, 2, 'http://192.168.1.3/uni-exam-api/uploads/kj30ixu1.jpg', 0, '.jpg', 'kj30ixu1.jpg', '84.49', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/kj30ixu1.jpg'),
(10, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0004.jpg', 0, '.jpg', 'IMG-20220828-WA0004.jpg', '83.48', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0004.jpg'),
(11, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0005.jpg', 0, '.jpg', 'IMG-20220828-WA0005.jpg', '39.58', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0005.jpg'),
(12, 1, 2, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0006.jpg', 0, '.jpg', 'IMG-20220828-WA0006.jpg', '59.9', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0006.jpg'),
(13, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0007.jpg', 0, '.jpg', 'IMG-20220828-WA0007.jpg', '33.99', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0007.jpg'),
(14, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0009.jpg', 0, '.jpg', 'IMG-20220828-WA0009.jpg', '44.92', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0009.jpg'),
(15, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0010.jpg', 0, '.jpg', 'IMG-20220828-WA0010.jpg', '57.13', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0010.jpg'),
(16, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0011.jpg', 0, '.jpg', 'IMG-20220828-WA0011.jpg', '36.01', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0011.jpg'),
(17, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0013.jpg', 0, '.jpg', 'IMG-20220828-WA0013.jpg', '30.12', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0013.jpg'),
(18, 2, 3, 'http://192.168.1.3/uni-exam-api/uploads/1416690843_veri-yapilari-algoritmalar-final-sorulari.jpg', 0, '.jpg', '1416690843_veri-yapilari-algoritmalar-final-sorulari.jpg', '129.72', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/1416690843_veri-yapilari-algoritmalar-final-sorulari.jpg'),
(19, 2, 4, 'http://192.168.1.3/uni-exam-api/uploads/1486669364_yapay-zeka-dersi-final-sorulari-firat-1.jpg', 0, '.jpg', '1486669364_yapay-zeka-dersi-final-sorulari-firat-1.jpg', '427.91', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/1486669364_yapay-zeka-dersi-final-sorulari-firat-1.jpg'),
(20, 1, 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0022.jpg', 0, '.jpg', 'IMG-20220828-WA0022.jpg', '37.33', '2022-08-28', 1, 'http://192.168.1.3/uni-exam-api/uploads/IMG-20220828-WA0022.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lectures`
--

CREATE TABLE `lectures` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `lectures`
--

INSERT INTO `lectures` (`id`, `department_id`, `name`, `slug`) VALUES
(1, 1, 'Enerji Dağıtım Sistemleri', 'enerji-dagitim-sistemleri'),
(2, 1, 'Uygulamalı Güç Elektroniği', 'uygulamali-guc-elektronigi'),
(3, 2, 'Veri Yapıları ve Algoritmalar', 'veri-yapilari-ve-algoritmalar'),
(4, 2, 'Biçimsel Diller ve Özdevinirler Kuramı', 'bicimsel-diller-ve-ozdevinirler-kurami');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
