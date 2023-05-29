-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2023 at 05:41 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_rest`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `temp` ()   BEGIN
	DECLARE _rollback BOOL default 0;
    DECLARE CONTINUE HANDLER FOR 1051 SET _rollback=1;
    DECLARE CONTINUE HANDLER FOR 1048 SET _rollback=1;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _rollback=1;
	START TRANSACTION;
INSERT into users_orders(o_id,u_id,title,quantity,price,status,date) values('','','','','','','','','');
UPDATE users SET price = '' WHERE o_id = '' AND title = '' AND price = '';
INSERT into remark(u_id,id) values ('',''); 
		if _rollback = 1 then
			rollback;
		else
			commit;
		end if;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `orders` (`o_id` VARCHAR(255)) RETURNS VARCHAR(100) CHARSET utf8mb4 DETERMINISTIC BEGIN 
DECLARE cnt int;
DECLARE msg varchar(100);
set cnt=(select count(*) from users_orders as o where o.u_id=o_id);
if (cnt>2) then 
	set msg:= "cannot order current limit is over";
else 
	set msg:= "can order the dishes";
end if;
RETURN msg;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'admin@gmail.com', '', '2021-04-07 08:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `backup_users`
--

CREATE TABLE `backup_users` (
  `o_id` int(10) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `title` char(60) DEFAULT NULL,
  `quantity` int(80) DEFAULT NULL,
  `u_id` char(10) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `f_name` char(20) DEFAULT NULL,
  `l_name` char(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `address` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(1, 1, 'Paneer Saag', 'Cottage cheese cooked with fresh ground spinach, onion, garlic and indian herbs.', '390.00', '606d72f3cb12f.jpg'),
(2, 1, 'Chicken Achari', 'Dahi, achar, tomatoes, mustard oil, fennel seeds', '250.00', '606d73302ece2.jpg'),
(3, 1, 'Murgh Tikka Biryani', 'Chicken Tikka Biryani Recipe is the famous Indian delicacy of Punjabi Cuisine. Boneless Chicken is marinated in spicy mix of Yogurt and Spices.', '470.00', '606d73771366a.jpg'),
(4, 1, 'Murgh Zafrani Kabab', 'Murgh Zafrani Kabab. A plateful of succulent pieces of meat, straight out of tandoor, is tough to resist.', '380.00', '606d73d2d37f4.jpg'),
(6, 2, 'Cheesy Mashed Potato', 'Covered with mozzarella cheese.', '250.00', '606d74c416da5.jpg'),
(7, 2, 'Crispy Chicken Strips', 'Fried chicken strips, served with special honey mustard sauce.', '460.00', '606d74f6ecbbb.jpg'),
(8, 2, 'Lemon Grilled Chicken And Pasta', 'Marinated rosemary grilled chicken breast served with mashed potatoes and your choice of pasta.', '380.00', '606d752a209c3.jpg'),
(9, 3, 'Vegetable Fried Rice', 'Chinese rice wok with cabbage, beans, carrots, and spring onions.', '350.00', '606d7575798fb.jpg'),
(10, 3, 'Prawn Crackers', '12 pieces deep-fried prawn crackers', '120.00', '606d75a7e21ec.jpg'),
(11, 3, 'Spring Rolls', 'Lightly seasoned shredded cabbage, onion and carrots, wrapped in house made spring roll wrappers, deep fried to golden brown.', '470.00', '606d75ce105d0.jpg'),
(12, 3, 'Manchurian Chicken', 'Chicken pieces slow cooked with spring onions in our house made manchurian style sauce.', '500.00', '606d7600dc54c.jpg'),
(13, 4, ' Buffalo Wings', 'Fried chicken wings tossed in spicy Buffalo sauce served with crisp celery sticks and Blue cheese dip.', '450.00', '606d765f69a19.jpg'),
(14, 4, 'Mac N Cheese Bites', 'Served with our traditional spicy queso and marinara sauce.', '350.00', '606d768a1b2a1.jpg'),
(16, 4, 'Meatballs Penne Pasta', 'Garlic-herb beef meatballs tossed in our house-made marinara sauce and penne pasta topped with fresh parsley.', '470.00', '606d76eedbb99.jpg'),
(17, 2, 'French Fries', 'crispy spicy fried potato ', '130.00', '637f3c0c05ed1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(1, 1, 'Gazebo', 'gazebo@gmail.com', '4312533432', 'www.gazebo.com', '12pm', '12am', 'Mon-Sat', 'Borivali', '606d71a81ec5d.jpg', '2021-04-07 09:18:19'),
(2, 2, 'Eataly', 'eataly@gmail.com', '0557426406', 'www.eataly.com', '11am', '9pm', 'Mon-Sat', 'Goregaon', '606d720b5fc71.jpg', '2021-04-07 08:49:15'),
(3, 3, 'Mainland China', 'mainland@china.com', '4326538776', 'www.mainlandchina.com', '8am', '9pm', 'Mon-Fri', 'Malad', '606d72653306f.jpg', '2021-04-07 08:50:45'),
(4, 4, 'TGI Fridays', 'tgi@gmail.com', '2342353325', 'www.tgif.com', '9am', '9pm', 'Mon-Sat', 'Lower Parel', '606d72a49503a.jpg', '2021-04-07 08:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(1, 'Indian', '2021-04-07 08:45:20'),
(2, 'Italian', '2021-04-07 08:45:23'),
(3, 'indo-chinese', '2022-11-25 04:34:18'),
(4, 'American-mexican', '2022-11-25 03:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(1, 'SAL', 'Salman', 'Ansari', 'salman@gmail.com', '1324325445', 'a32de55ffd7a9c4101a0c5c8788b38ed', 'Mira Road', 1, '2021-04-07 08:43:49'),
(2, 'PAR', 'Parth', 'Desai', 'parth@gmail.com', '4325345332', 'bc28715006af20d0e961afd053a984d9', 'Vasai', 1, '2021-04-07 08:44:35'),
(10, 'DHE', 'dheekshith', 'naik', 'dheek@gmail.com', '8296805117', 'dheek88', 'mysore', 0, '0000-00-00 00:00:00'),
(11, 'MON', 'monika', 'naik', 'monika64@gmail.com', '9609645366', 'monika468', 'banglore', 0, '0000-00-00 00:00:00'),
(12, 'CHI', 'chirag', 'patel', 'chirag@gmail.com', '9845832567', 'chirag34', 'tumkur', 0, '0000-00-00 00:00:00'),
(13, 'ARU', 'arushi', 'singh', 'arushi56@gmail.com', '8764987493', 'arushi55', 'banglore', 0, '0000-00-00 00:00:00'),
(14, 'ANA', 'ananya', 'pandey', 'ananya99@gmail.com', '9687528024', 'ananya456', 'tumkur', 0, '0000-00-00 00:00:00'),
(15, 'VIH', 'vihar', 'lal', 'vihar567@gmail.com', '9434780884', 'vihar998', 'banglore', 0, '0000-00-00 00:00:00'),
(16, 'SOU', 'sourabh', 'kumar', 'sourabh789@gmail.com', '9643576198', 'sour456', 'mysore', 0, '0000-00-00 00:00:00'),
(18, 'NIK', 'nikhil', 'goel', 'nikhil123@gmail.com', '1234567891', 'nikhil123', 'banglore', 0, '0000-00-00 00:00:00'),
(21, 'username', 'f_name', 'l_name', 'email', 'phone', 'password', 'address', 0, '0000-00-00 00:00:00'),
(23, 'NAY', 'nayana', 'shetty', 'nayana86@gmail.com', '9986853436', 'nayana34', 'tumkur', 0, '0000-00-00 00:00:00'),
(28, 'RAJ', 'rajveer', 'singh', 'rajveer12@gmail.com', '2345675634', 'raj124', 'banglore', 0, '0000-00-00 00:00:00'),
(32, 'JOY', 'joseph', 'paul', 'joseph@gmail.com', '8765467845', 'joseph78', 'mysore', 0, '0000-00-00 00:00:00'),
(33, 'AKA', 'akash', 'mehta', 'akash67@gmail.com', '9876545567', 'akash11', 'tumkur', 0, '0000-00-00 00:00:00'),
(38, 'NEH', 'neha', 'sharma', 'neha34@gmail.com', '8796788678', 'neha898', 'banglore', 0, '0000-00-00 00:00:00'),
(40, 'Sinch', 'sinchana', 'd', 'sinchana123@gmail.com', '9866784566', 'f057dad7f9e38cbf2cf8d980c6806646', 'banglore', 1, '2022-11-24 08:19:47'),
(41, 'shrav', 'shravani', 'p', 'shravani@gmail.com', '88967552347', '61af575d8a2c91c45b620cd745034c5f', 'mysore', 1, '2022-11-24 08:22:25'),
(42, 'Sneha', 'sneha', 'priya', 'sneha@gmail.com', '8966443356', '5589b86d03110cd30f21cf09a67760d6', 'Tumkur', 1, '2022-11-24 08:44:13'),
(43, 'LEXI', 'LEXI', 'RIVERA', 'lexi@gmail.com', '6534567898', '7ee01c738e706930d83a3250ca880581', 'chitradurga', 1, '2022-11-24 08:46:56'),
(44, 'vaish', 'vaishnavi', 'r', 'vaishnavi@gmail.com', '9987876654', 'acfbe1dd7d8990397422b0552613aab1', 'banglore', 1, '2022-11-25 04:37:09'),
(45, 'rac', 'rachitha', 'singh', 'rachitha@gmail.com', '9986854321', 'a5a25c2a506d4601dd8817325d15dfac', 'banglore', 1, '2022-11-30 09:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `date`) VALUES
(10, 40, 'Murgh Tikka Biryani', 1, '470.00', NULL, '2022-11-24 08:20:27'),
(11, 40, 'Paneer Saag', 1, '390.00', NULL, '2022-11-24 08:20:27'),
(12, 40, 'Crispy Chicken Strips', 1, '460.00', NULL, '2022-11-24 08:20:53'),
(13, 40, 'Cheesy Mashed Potato', 1, '250.00', NULL, '2022-11-24 08:20:53'),
(14, 41, 'Murgh Tikka Biryani', 1, '470.00', NULL, '2022-11-24 08:23:08'),
(15, 41, 'Paneer Saag', 1, '390.00', NULL, '2022-11-24 08:23:08'),
(16, 42, 'Crispy Chicken Strips', 1, '460.00', NULL, '2022-11-24 08:45:45'),
(17, 42, 'Cheesy Mashed Potato', 1, '250.00', NULL, '2022-11-24 08:45:45'),
(18, 42, 'Pink Spaghetti Gamberoni', 1, '380.00', NULL, '2022-11-24 08:45:45'),
(19, 43, 'Crispy Chicken Strips', 1, '460.00', NULL, '2022-11-24 08:47:31'),
(20, 43, 'Pink Spaghetti Gamberoni', 1, '380.00', NULL, '2022-11-24 08:47:31'),
(21, 43, 'Lemon Grilled Chicken And Pasta', 1, '380.00', NULL, '2022-11-24 08:47:31'),
(45, 42, 'Paneer Saag', 2, '780.00', 'NULL', '0000-00-00 00:00:00'),
(49, 56, 'Murgh Tikka Biryani', 2, '780.00', 'NULL', '0000-00-00 00:00:00'),
(55, 52, 'Paneer Saag', 2, '780.00', 'NULL', '0000-00-00 00:00:00'),
(78, 78, 'Murgh Tikka Biriyani', 2, '780.00', 'NULL', '0000-00-00 00:00:00');

--
-- Triggers `users_orders`
--
DELIMITER $$
CREATE TRIGGER `insert_user_order` BEFORE INSERT ON `users_orders` FOR EACH ROW BEGIN
  IF NEW.title="Paneer Saag" THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='this is dish is currently unavailable';
  END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
