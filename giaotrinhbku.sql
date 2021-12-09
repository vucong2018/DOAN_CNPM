-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th12 09, 2021 lúc 10:07 AM
-- Phiên bản máy phục vụ: 5.7.33
-- Phiên bản PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `giaotrinhbku`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `Fname` varchar(250) NOT NULL,
  `Lname` varchar(250) NOT NULL,
  `Age` int(50) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`ID`, `Fname`, `Lname`, `Age`, `Email`, `Password`) VALUES
(1, 'Trần Lê', 'Khánh', 20, 'trankhanh@gmail.com', '44c1bc87d6067efc72a3f7ba290cf297'),
(2, 'Nguyễn', 'Bảo', 20, 'baonguyen@gmail.com', 'df707955fcdf7cd0479dc79f315eab9e'),
(3, 'Vũ', 'Công', 20, 'congvu@gmail.com', '9ebed6f3090c9bdee1cb10094679f872'),
(4, 'Khac', 'Bao', 22, 'kb@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
(5, 'Trần', 'Ngáo', 45, 'huanhoahong@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b'),
(6, 'Trần', 'Ngáo', 45, 'bk@gmail.com', 'c81e728d9d4c2f636f067f89cc14862c'),
(7, 'Trần Lê', 'Khánh', 12, 'butbixanh20@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b'),
(8, 'Mèo Nga cute Vũ', 'Công', 19, 'root@gmail.com', '8a30d69f36c0035a0d67bfaaad132fc8'),
(9, 'Công Thành', 'Vũ', 29, 'vucong2018@gmail.com', '8a30d69f36c0035a0d67bfaaad132fc8'),
(10, 'Vũ Thành ', 'Công', 19, 'demo@gmail.com', '8a30d69f36c0035a0d67bfaaad132fc8'),
(11, 'Vũ', 'Thành', 29, 'aichoai1812@gmail.com', '8a30d69f36c0035a0d67bfaaad132fc8');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
