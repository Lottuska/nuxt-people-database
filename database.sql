SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `people` (`id`, `firstname`, `lastname`, `birthday`) VALUES
(1, 'Mary', 'Anderson', '1995-07-20'),
(2, 'Jamie', 'Hill', '1992-01-05'),
(3, 'Susan', 'Smith', '2000-03-10'),
(4, 'Annabelle', 'Taylor', '1998-09-04'),
(5, 'Oliver Mathias', 'Hunter', '1986-11-27');

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `specie` int(11) NOT NULL,
  `ownerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pets` (`id`, `name`, `specie`, `ownerid`) VALUES
(1, 'Mei', 1, 2),
(2, 'Nero', 1, 2),
(3, 'Rocky', 2, 4),
(4, 'Daisy', 5, 1),
(6, 'Cutie', 4, 2);

CREATE TABLE `pet_species` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pet_species` (`id`, `name`) VALUES
(1, 'cat'),
(2, 'dog'),
(3, 'guinea pig'),
(4, 'hamster'),
(5, 'horse'),
(6, 'mouse'),
(7, 'rabbit'),
(8, 'rat'),
(9, 'parrot');


ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ownerid` (`ownerid`),
  ADD KEY `specie` (`specie`);

ALTER TABLE `pet_species`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pets_ibfk_2` FOREIGN KEY (`specie`) REFERENCES `pet_species` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
