-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2021 at 01:38 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bkfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
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
-- Dumping data for table `account`
--

INSERT INTO `account` (`ID`, `Fname`, `Lname`, `Age`, `Email`, `Password`) VALUES
(1, 'Trần Lê', 'Khánh', 20, 'trankhanh@gmail.com', '44c1bc87d6067efc72a3f7ba290cf297'),
(2, 'Nguyễn', 'Bảo', 20, 'baonguyen@gmail.com', 'df707955fcdf7cd0479dc79f315eab9e'),
(3, 'Vũ', 'Công', 20, 'congvu@gmail.com', '9ebed6f3090c9bdee1cb10094679f872'),
(4, 'Khac', 'Bao', 22, 'kb@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
(5, 'Trần', 'Ngáo', 45, 'huanhoahong@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b'),
(6, 'Trần', 'Ngáo', 45, 'bk@gmail.com', 'c81e728d9d4c2f636f067f89cc14862c'),
(7, 'Trần Lê', 'Khánh', 12, 'butbixanh20@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `ID` int(11) NOT NULL,
  `PayTime` date NOT NULL,
  `Total` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `complete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`ID`, `PayTime`, `Total`, `Customer_ID`, `complete`) VALUES
(25, '2021-11-11', 103000, 7, 0),
(26, '2021-11-11', 33000, 7, 0),
(27, '2021-11-11', 50000, 7, 0),
(28, '2021-11-12', 175000, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill_info`
--

CREATE TABLE `bill_info` (
  `Bill_ID` int(11) NOT NULL,
  `Food_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill_info`
--

INSERT INTO `bill_info` (`Bill_ID`, `Food_ID`, `quantity`) VALUES
(25, 3, 1),
(25, 4, 1),
(25, 6, 1),
(25, 7, 2),
(26, 2, 1),
(26, 5, 1),
(27, 4, 1),
(27, 8, 1),
(28, 6, 1),
(28, 7, 4),
(28, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chefaccount`
--

CREATE TABLE `chefaccount` (
  `ID` int(11) NOT NULL,
  `Fname` varchar(100) NOT NULL,
  `Lname` varchar(100) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chefaccount`
--

INSERT INTO `chefaccount` (`ID`, `Fname`, `Lname`, `Age`, `Username`, `Password`) VALUES
(1, 'Phạm', 'Đạt', 30, 'pdat1991', 'd09863bc207ba0671b6f8ce6551291f9'),
(2, 'Lương', 'Hoàng', 40, 'hoang9999', '3dde5c03ba8ba94cde17bc0f197899fa');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Type` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `img` varchar(250) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`ID`, `Name`, `Type`, `Description`, `img`, `Amount`, `Price`) VALUES
(1, 'Bánh mì cuộn', 1, 'Bánh mì cuộn hay còn gọi là bánh Wrap là một món ăn làm từ bánh mì lát với độ dai mềm để cuộn tròn quanh nhân bánh và thông thường được nướng lên tạo nên lớp vỏ ngoài vàng ruộm, dai dai cùng vị thanh mát của lớp nhân ngập sốt. Vỏ bánh được làm từ bột ngô cán mỏng thành bạt.', '01_01', 100, 10000),
(2, 'Bánh mì kẹp', 1, NULL, '01_02', 100, 12000),
(3, 'Bánh nướng chảo', 1, 'Bánh nướng chảo là một loại bánh phẳng được chế biến từ bột làm từ tinh bột có thể chứa trứng, sữa và bơ. Món ăn thường mỏng và tròn và có thể nấu trên một bề mặt nóng như vỉ nướng hoặc chảo rán, thường chiên với dầu hoặc bơ', '01_03', 100, 20000),
(4, 'Gà lắc', 1, 'gà goujons, gà dải hoặc gà phi lê, là thịt gà được chế biến từ các cơ nhỏ ở ngực của động vật. Những dải thịt trắng này nằm ở hai bên xương ức, dưới phần thịt ức.', '01_04', 100, 25000),
(5, 'Gà rán', 1, 'gồm những miếng gà đã được tẩm bột hoặc bột nêm rồi áp chảo, rán giòn, rán áp suất hoặc rán không khí. Việc tẩm bột sẽ tạo thêm lớp phủ hoặc lớp vỏ giòn bên ngoài thịt gà trong khi vẫn giữ được nước trong thịt. Gà thịt được sử dụng phổ biến nhất.', '01_05', 100, 21000),
(6, 'Hamburger', 1, 'Hamburger pho mát hay Burger phô mai là một loại hamburger với topping là pho mát. Theo truyền thống, miếng pho mát thường được đặt bên trên miếng thịt. Người ta thường cho thêm pho mát vào miếng thịt bò xay đang nấu trong thời gian ngắn, điều này tạo điều kiện cho pho mát tan chảy.', '01_06', 100, 30000),
(7, 'Khoai tây chiên', 1, 'Khoai tây chiên kiểu Pháp, hay French-fried potatoes là khoai tây chiên giòn cắt thành sợi hoặc hình que.', '01_07', 100, 14000),
(8, 'KFC', 1, 'Món gà Rán nổi tiếng của KFC', '01_08', 100, 25000),
(9, 'Pizza', 1, 'Pizza, Tiếng La tinh thường đọc là Pi-da, là loại bánh dẹt, tròn được chế biến từ bột mì, nấm men... sau khi đã được ủ bột để nghỉ ít nhất 24 tiếng đồng hồ và nhào nặn thành loại bánh có hình dạng tròn và dẹt, và được cho vào lò nướng chín trước khi ăn', '01_09', 100, 40000),
(10, 'Bắp xào phô mai', 1, 'Bắp xào là một món ăn vặt được rất nhiều người yêu thích, món này không chỉ ngon mà còn cung cấp khá nhiều các khoáng chất cần thiết cho cơ thể bạn nữa.', '01_10', 100, 13500),
(11, 'Bún bò Huế', 2, 'Tại Huế, món này được gọi đơn giản là \"bún bò\" hoặc gọi cụ thể hơn là \"bún bò thịt bò\". Các địa phương khác gọi là \"bún bò Huế\", \"bún bò gốc Huế\" để chỉ xuất xứ của món ăn này.', '02_11', 100, 25000),
(12, 'Bún đậu mắm tôm', 2, 'Bún đậu mắm tôm là món ăn đơn giản, dân dã trong ẩm thực miền Bắc Việt Nam. Đây là món thường được dùng như bữa ăn nhẹ, ăn chơi. Thành phần chính gồm có bún tươi, đậu hũ chiên vàng, chả cốm, nem chua, mắm tôm pha chanh, ớt và ăn kèm với các loại rau thơm như tía tô, kinh giới, rau húng, xà lách, cà pháo..', '02_12', 100, 20000),
(13, 'Lẩu thái', 2, 'Lẩu Thái hay được gọi đơn giản là lẩu ở Thái Lan, là một biến thể của món lẩu ở Thái Lan và cũng là một trong những đặc sản và là món ăn truyền thống của xứ này. Lẩu Thái về cơ bản là một món ăn nóng, thực khách nhúng thịt, hải sản, mì và rau vào nồi nước dùng nấu ăn tại bàn và nhúng nó một hỗn hợp trước khi ăn.', '02_13', 100, 100000),
(14, 'Tôm hùm nướng', 2, 'Họ Tôm hùm càng là tên gọi dùng để chỉ một họ chứa các loài tôm hùm. Họ Tôm hùm càng có đặc điểm gồm thân dài và có một cái đuôi cơ bắp, hầu hết họ tôm hùm này đều có một đôi càng lớn và đầy sức mạnh', '02_14', 100, 70000),
(15, 'Lẩu basa', 2, 'Lẩu cá basa thực chất là món canh chua truyền thống của miền Nam, được nấu với loại cá ba sa vừa béo lại vừa ngọt thịt. Món ăn có đủ các vị mặn, ngọt, chua, cay, béo, được dọn trong một cái lẩu để giữ nóng suốt bữa ăn.', '02_15', 100, 120000),
(16, 'Bún mắm', 2, 'Bún mắm là món ăn nổi tiếng thơm ngon lạ miệng của người miền Tây với sự kết hợp của nhiều loại hải sản, rau, thịt heo quay cực ngon!', '02_16', 100, 10000),
(17, 'Cafe truyền thống', 3, 'Cà phê đen được xem là loại thức uống mang đến nhiều tác dụng đối với sức khỏe. Sử dụng cà phê đen đúng cách sẽ giúp bạn giải tỏa căng thẳng, mệt mỏi.', '03_17', 100, 7000),
(18, 'Cafe sữa', 3, 'Cà phê đen với 10% sữa', '03_18', 100, 8000),
(19, 'Capuchino', 3, 'Cappuccino là thức uống có nguồn gốc từ Ý gồm cà phê và sữa khuấy bông. Ở Ý, quốc gia mà đồ uống này phổ biến nhất', '03_19', 100, 16000),
(20, 'Trà đào', 3, 'Trà đào ngọt thanh mát', '03_20', 100, 10000),
(21, 'Trà sữa trân châu', 3, 'Trà sữa trân châu hay trà sữa Đài Loan là thức uống được chế biến từ trà xanh hoặc trà đen được các cửa hàng đồ uống tại Đài Trung, Đài Loan phát triển từ những năm 1980. Đặc điểm của trà sữa trân châu là khi bị lắc, một lớp bọt nước mỏng được tạo thành trên bề mặt', '03_21', 100, 15000),
(22, 'Trà matcha', 3, 'Matcha là phần bột nghiền mịn của lá trà xanh được trồng và chế biến đặc biệt, được tiêu thụ theo truyền thống tại Đông Á', '03_22', 100, 20000),
(23, 'Soda chanh', 3, 'Soda sủi bọt quyện với nước cốt chanh chua chua được đằm vị bằng một chút nước đường đã tạo nên một hương vị chua ngọt thơm ngon khó cưỡng.', '03_23', 100, 12000),
(24, 'Socola', 3, 'là đồ uống nóng thường bao gồm sô-cô-la cạo, sô-cô-la hòa tan hay cacao, đun nóng với sữa hoặc nước và đường.', '03_24', 100, 15000),
(25, 'Cacao', 3, 'là đồ uống nóng thường bao gồm sô-cô-la cạo, sô-cô-la hòa tan hay cacao, đun nóng với sữa hoặc nước và đường.', '03_25', 100, 15000),
(26, 'Americano', 3, 'Caffè Americano, hay Americano là một phong cách cà phê chuẩn bị bằng cách thêm nước nóng vào espresso, điều này làm cà phê có độ đậm tương tự, nhưng hương vị lại khác, giống cà phê phin. Độ đạm của một tách Americano thay đổi theo số lượng tách espresso và lượng nước bổ sung.', '03_26', 100, 15000),
(27, 'Cocacola', 3, 'nước ngọt có ga chứa nước cacbon dioxide bão hòa được sản xuất bởi Công ty Coca-Cola', '03_27', 100, 7000),
(28, 'Trà gừng', 3, 'Gừng có tính nóng và chứa một số chất chống oxy hóa có lợi cho sức khỏe tim mạch', '03_28', 100, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`ID`, `Name`) VALUES
(1, 'Đồ ăn nhanh'),
(2, 'Đồ ăn chính'),
(3, 'Đồ uống');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bill_info`
--
ALTER TABLE `bill_info`
  ADD PRIMARY KEY (`Bill_ID`,`Food_ID`);

--
-- Indexes for table `chefaccount`
--
ALTER TABLE `chefaccount`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
