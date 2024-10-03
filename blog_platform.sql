-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2024 at 06:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `status` enum('draft','published') DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `tags`, `status`, `created_at`) VALUES
(1, 1, 'first post', 'this is my first blog', '', 'published', '2024-09-29 16:20:41'),
(3, 2, 'Xampp', 'I used Xampp for Php.', '', 'draft', '2024-09-30 14:40:02'),
(46, 3, 'Web Developer', 'Web developers are responsible for creating and maintaining websites and web applications. Their roles can vary based on their specialization, but generally, they perform tasks such as:\r\n\r\nFront-End Development:\r\n\r\nDesigning and implementing the user interface and user experience (UI/UX).\r\nWriting code using HTML, CSS, and JavaScript to create visually appealing and interactive web pages.\r\nBack-End Development:\r\n\r\nBuilding and maintaining the server-side of web applications.\r\nWorking with databases, server scripting languages (like PHP, Python, Ruby), and APIs to manage data and server logic.\r\nFull-Stack Development:\r\n\r\nCombining both front-end and back-end skills to handle all aspects of web development.\r\nManaging the entire development process from concept to deployment.\r\nResponsive Design:\r\n\r\nEnsuring websites are accessible and functional across various devices and screen sizes.\r\nTesting and Debugging:\r\n\r\nIdentifying and fixing bugs or issues in code to improve performance and functionality.\r\nCollaboration:\r\n\r\nWorking with designers, product managers, and other stakeholders to ensure that the final product meets user needs and project requirements.\r\nDeployment and Maintenance:\r\n\r\nLaunching websites and applications, monitoring their performance, and making updates or improvements as necessary.\r\nVersion Control:\r\n\r\nUsing tools like Git to manage code changes and collaborate with other developers.\r\nWeb developers can work in various settings, including tech companies, agencies, or as freelancers, and may specialize in areas like e-commerce, content management systems, or web applications.', '', 'published', '2024-10-03 16:40:12'),
(47, 3, 'Android Developer', 'Android developers focus on creating applications for the Android operating system. Their roles involve various tasks, including:\r\n\r\nApp Development:\r\n\r\nDesigning and building Android applications using programming languages like Java or Kotlin.\r\nImplementing app features and functionalities.\r\nUser Interface (UI) Design:\r\n\r\nCreating user-friendly interfaces that follow Android design guidelines.\r\nWorking with XML layouts to define app layouts and views.\r\nBackend Integration:\r\n\r\nConnecting the app to backend services and APIs for data storage and retrieval.\r\nUsing technologies like Firebase or RESTful APIs for cloud integration.\r\nTesting and Debugging:\r\n\r\nWriting unit tests and conducting manual testing to ensure app functionality and performance.\r\nUsing tools like Android Debug Bridge (ADB) and Android Studio’s debugger to troubleshoot issues.\r\nPerformance Optimization:\r\n\r\nMonitoring app performance and making improvements to ensure smooth user experience.\r\nUsing profiling tools to identify and fix performance bottlenecks.\r\nVersion Control:\r\n\r\nUtilizing version control systems like Git for collaborative development and code management.\r\nPublishing and Maintenance:\r\n\r\nPreparing applications for release on the Google Play Store, including meeting guidelines and standards.\r\nProviding ongoing maintenance and updates based on user feedback and operating system changes.\r\nCollaboration:\r\n\r\nWorking with designers, product managers, and other developers to deliver a cohesive product.\r\nParticipating in code reviews and team meetings to discuss project progress.\r\nAndroid developers may work in various settings, including tech companies, startups, or as freelancers, and often need to stay updated with the latest Android development trends and technologies.', '', 'published', '2024-10-03 16:40:54'),
(48, 3, 'Mahatma Gandhi', 'Mahatma Gandhi (1869–1948) was a prominent leader in the Indian independence movement against British colonial rule. Known for his philosophy of non-violence (Ahimsa) and civil disobedience (Satyagraha), he played a crucial role in mobilizing the Indian population towards independence. Here are some key points about him:\r\n\r\nEarly Life: Born in Porbandar, India, Gandhi studied law in London and later practiced in South Africa, where he first developed his ideas about civil rights.\r\n\r\nPhilosophy of Non-violence: Gandhi advocated for non-violent resistance to oppression. He believed that true change could be achieved without violence.\r\n\r\nSatyagraha Movement: This was Gandhi\'s method of non-violent protest against injustice. It involved peaceful resistance and civil disobedience.\r\n\r\nKey Campaigns:\r\n\r\nSalt March (1930): A 240-mile march to the Arabian Sea to protest the British salt tax, symbolizing a challenge to British authority.\r\nQuit India Movement (1942): A mass protest demanding an end to British rule in India.\r\nLegacy: Gandhi\'s principles of non-violence and civil rights have inspired various global movements for civil rights and social change, including those led by figures like Martin Luther King Jr. and Nelson Mandela.\r\n\r\nAssassination: Gandhi was assassinated on January 30, 1948, by Nathuram Godse, a Hindu nationalist opposed to Gandhi\'s philosophy of non-violence and his efforts to reconcile Hindus and Muslims in India.\r\n\r\nGandhi is often referred to as the \"Father of the Nation\" in India, and his birthday, October 2, is celebrated as Gandhi Jayanti and International Day of Non-Violence.', '', 'published', '2024-10-03 16:51:57'),
(49, 1, 'Space Satellite', 'Space satellites are artificial objects placed into orbit around Earth or other celestial bodies for various purposes. Here are some key aspects of space satellites:\r\n\r\nTypes of Satellites\r\nCommunication Satellites:\r\n\r\nUsed for telecommunication, broadcasting, and internet services.\r\nPositioned in geostationary orbits to maintain a constant position relative to the Earth.\r\nEarth Observation Satellites:\r\n\r\nDesigned to monitor and collect data about Earth\'s surface, weather patterns, and natural resources.\r\nUsed in applications like agriculture, disaster management, and environmental monitoring.\r\nNavigation Satellites:\r\n\r\nProvide positioning, navigation, and timing information (e.g., GPS satellites).\r\nEssential for various applications, including navigation systems in vehicles and smartphones.\r\nScientific Satellites:\r\n\r\nUsed for research and exploration of space, Earth, and other celestial bodies.\r\nExamples include telescopes (like the Hubble Space Telescope) and planetary probes.\r\nMilitary Satellites:\r\n\r\nUsed for reconnaissance, surveillance, and communication for military purposes.\r\nOften equipped with advanced sensors and technologies.\r\nKey Components\r\nPayload: The instruments and equipment that perform the satellite\'s primary functions, such as cameras or sensors.\r\nBus: The satellite\'s structure that houses the payload and contains systems for power, communication, and thermal control.\r\nPower Source: Most satellites use solar panels to generate electricity, but some may use batteries or nuclear power sources.\r\nPropulsion System: Used for orbital maneuvers and maintaining the satellite\'s position in orbit.\r\nOrbits\r\nGeostationary Orbit: Satellites in this orbit remain fixed over one point on Earth, making them ideal for communication and weather observation.\r\nLow Earth Orbit (LEO): Satellites in this orbit are closer to Earth, typically used for Earth observation and some communication satellites.\r\nPolar Orbit: Satellites in this orbit pass over the Earth\'s poles, allowing them to cover the entire surface of the Earth over time.\r\nApplications\r\nTelecommunications: Enabling global communication, broadcasting, and internet access.\r\nWeather Monitoring: Providing data for weather forecasting and climate research.\r\nSearch and Rescue: Assisting in locating and providing aid to people in distress.\r\nScientific Research: Supporting space exploration, astronomical observations, and Earth studies.\r\nSatellites play a vital role in modern society, impacting various fields, including communication, navigation, weather forecasting, and scientific research.', '', 'published', '2024-10-03 16:53:31'),
(50, 1, 'Cricket', 'Cricket is a popular bat-and-ball sport played between two teams, typically consisting of eleven players each. It originated in England and is widely played around the world, especially in countries like India, Australia, Pakistan, England, and South Africa. Here are some key aspects of cricket:\r\n\r\nBasic Rules\r\nObjective: The main objective of the game is to score more runs than the opposing team.\r\n\r\nPlaying Field:\r\n\r\nCricket is played on a circular or oval field with a 22-yard-long pitch at the center.\r\nThe pitch has wickets at both ends, each consisting of three stumps and two bails.\r\nInnings:\r\n\r\nEach team takes turns batting and fielding.\r\nThe batting team aims to score runs, while the fielding team tries to dismiss the batsmen and limit runs.\r\nScoring Runs:\r\n\r\nRuns can be scored by hitting the ball and running between the wickets or by hitting boundaries (4 runs if the ball hits the ground before crossing the boundary, 6 runs if it crosses the boundary without touching the ground).\r\nDismissals:\r\n\r\nA batsman can be dismissed in several ways, including being bowled, caught, leg before wicket (LBW), run out, or stumped.\r\nFormats of Cricket\r\nTest Cricket:\r\n\r\nThe longest format, played over five days with each team having two innings.\r\nIt tests players\' endurance, skill, and strategy.\r\nOne Day Internationals (ODIs):\r\n\r\nEach team faces a fixed number of overs, typically 50.\r\nThe match usually lasts around 8 hours.\r\nTwenty20 (T20):\r\n\r\nA shorter format where each team plays a maximum of 20 overs.\r\nMatches are completed in about three hours and emphasize aggressive batting.\r\nGoverning Body\r\nInternational Cricket Council (ICC): The global governing body for cricket, responsible for organizing international tournaments, including the Cricket World Cup and T20 World Cup.\r\nMajor Tournaments\r\nICC Cricket World Cup: The premier international championship for ODIs, held every four years.\r\nICC T20 World Cup: The championship for the T20 format, also held every few years.\r\nTest Series: Bilateral series played between two countries over multiple matches.\r\nPopularity\r\nCricket has a massive following, particularly in countries like India, where it is often referred to as a religion. It has a rich history, with legends such as Sir Donald Bradman, Sachin Tendulkar, Brian Lara, and Sir Vivian Richards making significant contributions to the sport.\r\n\r\nWhether played at a professional level or in local parks, cricket fosters teamwork, strategy, and sportsmanship.', '', 'published', '2024-10-03 16:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'gaurav', 'yadavgaurav101203@gmail.com', '$2y$10$B5eKJ11zOvq1Smygq8LhvumakPoiRZS3DZK2deFVwWJ85pcRP3j4K'),
(2, 'bansu', 'bansu@gmail.com', '$2y$10$bHsNOPPIkwvMp0ZV0Ubjz.uPA/DBQrdJIU9WDOZI.fbD0htcqwGtK'),
(3, 'smit', 'smit@gmail.com', '$2y$10$2wXdrHoajRjBS2iIQhmIrOYrCqicnZpPhxuZfyoiU/q1ccuJSKv6i');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
