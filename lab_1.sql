-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 14 2022 г., 21:38
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `computer`
--

-- --------------------------------------------------------

--
-- Структура таблицы `computers`
--

CREATE TABLE `computers` (
  `ID_Computer` int(11) NOT NULL,
  `netname` varchar(40) NOT NULL,
  `motherboard` varchar(40) NOT NULL,
  `RAM_capacity` int(11) NOT NULL,
  `HDD_capacity` int(11) NOT NULL,
  `monitor` varchar(40) NOT NULL,
  `vendor` varchar(40) NOT NULL,
  `guarantee` date NOT NULL,
  `FID_Processor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computers`
--

INSERT INTO `computers` (`ID_Computer`, `netname`, `motherboard`, `RAM_capacity`, `HDD_capacity`, `monitor`, `vendor`, `guarantee`, `FID_Processor`) VALUES
(1, 'user-1-programmer', 'Asus', 32000, 1000000, 'Asus', 'Asus', '2023-05-31', 5),
(2, 'user-2-admin', 'NVidia', 32000, 2000000, 'NVidia', 'NVidia', '2022-05-18', 2),
(3, 'user-3-accountant', 'Gigabyte', 16000, 1500000, 'Gigabyte', 'Gigabyte', '2021-05-19', 1),
(4, 'user-4-manager', 'MSI', 8000, 500000, 'MSI', 'MSI', '2022-05-10', 1),
(5, 'user-5-lawyer', 'Intel', 32000, 2000000, 'Intel', 'Intel', '2022-05-31', 2),
(6, 'user-6-newbie', 'Biostar', 16000, 1500000, 'Biostar', 'Biostar', '2024-05-22', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `computer_softwares`
--

CREATE TABLE `computer_softwares` (
  `FID_Computer` int(11) NOT NULL,
  `FID_Software` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computer_softwares`
--

INSERT INTO `computer_softwares` (`FID_Computer`, `FID_Software`) VALUES
(1, 3),
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(4, 1),
(5, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `processors`
--

CREATE TABLE `processors` (
  `ID_Pocessor` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `frequency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `processors`
--

INSERT INTO `processors` (`ID_Pocessor`, `name`, `frequency`) VALUES
(1, 'Intel Pentium', 150),
(2, 'Intel Core i6', 200),
(3, 'Intel Core i7', 300),
(4, 'Intel Core i9', 400),
(5, 'AMD Rysen 3', 300);

-- --------------------------------------------------------

--
-- Структура таблицы `softwares`
--

CREATE TABLE `softwares` (
  `ID_Software` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `softwares`
--

INSERT INTO `softwares` (`ID_Software`, `name`) VALUES
(1, 'Microsoft Office 2019'),
(2, 'Adobe PhotoShop'),
(3, 'PHP Storm');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`ID_Computer`),
  ADD KEY `FID_Processor` (`FID_Processor`);

--
-- Индексы таблицы `computer_softwares`
--
ALTER TABLE `computer_softwares`
  ADD KEY `FID_Computer` (`FID_Computer`),
  ADD KEY `FID_Software` (`FID_Software`);

--
-- Индексы таблицы `processors`
--
ALTER TABLE `processors`
  ADD PRIMARY KEY (`ID_Pocessor`);

--
-- Индексы таблицы `softwares`
--
ALTER TABLE `softwares`
  ADD PRIMARY KEY (`ID_Software`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `computers`
--
ALTER TABLE `computers`
  MODIFY `ID_Computer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `processors`
--
ALTER TABLE `processors`
  MODIFY `ID_Pocessor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `softwares`
--
ALTER TABLE `softwares`
  MODIFY `ID_Software` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `computers`
--
ALTER TABLE `computers`
  ADD CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`FID_Processor`) REFERENCES `processors` (`ID_Pocessor`);

--
-- Ограничения внешнего ключа таблицы `computer_softwares`
--
ALTER TABLE `computer_softwares`
  ADD CONSTRAINT `computer_softwares_ibfk_1` FOREIGN KEY (`FID_Software`) REFERENCES `softwares` (`ID_Software`),
  ADD CONSTRAINT `computer_softwares_ibfk_2` FOREIGN KEY (`FID_Computer`) REFERENCES `computers` (`ID_Computer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;