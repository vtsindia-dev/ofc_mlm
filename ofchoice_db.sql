-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 02, 2022 at 08:17 PM
-- Server version: 10.2.41-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ofchoice_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'gnanamurugan@vrikshatech.in', 'admin', NULL, '5ff1c3531ed3f1609679699.jpg', '$2y$10$Nme89BF4BVMDmQ3D5fcXqOswwR0HhSSxvB1GhVlrnJTAlUAW1qam.', NULL, '2022-04-02 09:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 2, 'New member registered', 0, '/admin/user/detail/2', '2022-04-02 04:46:31', '2022-04-02 04:46:31'),
(2, 2, 'Plan subscribe successful', 0, '/admin/plan/subscribers', '2022-04-02 04:46:31', '2022-04-02 04:46:31'),
(3, 3, 'New member registered', 0, '/admin/user/detail/3', '2022-04-02 04:56:54', '2022-04-02 04:56:54'),
(4, 3, 'Plan subscribe successful', 0, '/admin/plan/subscribers', '2022-04-02 04:56:54', '2022-04-02 04:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(6, 'Men Collection', '20220324130855.jpg', '2022-03-24 07:38:55', '2022-03-24 07:38:55'),
(7, 'Women Collection', '20220324130926.jpg', '2022-03-24 07:39:26', '2022-03-24 07:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT 0 COMMENT 'Referral Commission : 0 ',
  `mark` tinyint(1) DEFAULT 0 COMMENT 'Referal : 1, Level : 2',
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `user_id`, `from_user_id`, `amount`, `charge`, `post_balance`, `trx`, `level`, `mark`, `details`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '142.50000000', '0.00000000', '142.50000000', 'KDXM3CUNACF9', 1, 2, 'Level 1 commission from gnanamurugan (Tax applied 5%)', '2022-04-02 04:56:54', '2022-04-02 04:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method_code` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mail_sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-06 00:49:06'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-07 10:23:47'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-03 23:35:10'),
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-24 23:04:05', '2020-03-08 01:28:52'),
(5, '2FA_ENABLE', 'Google Two Factor - Enable', 'Google Two Factor Authentication is now  Enabled for Your Account', '<div>You just enabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Enabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Your verification code is: {{code}}', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:42:59'),
(6, '2FA_DISABLE', 'Google Two Factor Disable', 'Google Two Factor Authentication is now  Disabled for Your Account', '<div>You just Disabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Disabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Google two factor verification is disabled', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:43:46'),
(16, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply ', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{{subject}}\r\n\r\n{{reply}}\r\n\r\n\r\nClick here to reply:  {{link}}', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For relpy\"}', 1, 1, '2020-06-08 18:00:00', '2020-05-04 02:24:40'),
(206, 'DEPOSIT_COMPLETE', 'Automated Deposit - Successful', 'Deposit Completed Successfully', '<div>Your deposit of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br></div>', '{{amount}} {{currrency}} Deposit successfully by {{gateway_name}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-24 18:00:00', '2020-11-17 03:10:00'),
(207, 'DEPOSIT_REQUEST', 'Manual Deposit - User Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div>', '{{amount}} Deposit requested by {{method}}. Charge: {{charge}} . Trx: {{trx}}\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, '2020-05-31 18:00:00', '2020-06-01 18:00:00'),
(208, 'DEPOSIT_APPROVE', 'Manual Deposit - Admin Approved', 'Your Deposit is Approved', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br></div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-16 18:00:00', '2020-06-14 18:00:00'),
(209, 'DEPOSIT_REJECT', 'Manual Deposit - Admin Rejected', 'Your Deposit Request is Rejected', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}', 'Admin Rejected Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"rejection_message\":\"Rejection message\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(210, 'WITHDRAW_REQUEST', 'Withdraw  - User Requested', 'Withdraw Request Submitted Successfully', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been submitted Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"4\" color=\"#FF0000\"><b><br></b></font></div><div><font size=\"4\" color=\"#FF0000\"><b>This may take {{delay}} to process the payment.</b></font><br></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br><br></div>', '{{amount}} {{currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} in {{delay}}. Trx: {{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\", \"delay\":\"Delay time for processing\"}', 1, 1, '2020-06-07 18:00:00', '2021-05-08 06:49:06'),
(211, 'WITHDRAW_REJECT', 'Withdraw - Admin Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Rejected.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You should get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div><div>----</div><div><font size=\"3\"><br></font></div><div><font size=\"3\"> {{amount}} {{currency}} has been <b>refunded </b>to your account and your current Balance is <b>{{post_balance}}</b><b> {{currency}}</b></font></div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Rejection :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br><br></div>', 'Admin Rejected Your {{amount}} {{currency}} withdraw request. Your Main Balance {{main_balance}}  {{method}} , Transaction {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(212, 'WITHDRAW_APPROVE', 'Withdraw - Admin  Approved', 'Withdraw Request has been Processed and your money is sent', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Processed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Processed Payment :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br></div>', 'Admin Approve Your {{amount}} {{currency}} withdraw request by {{method}}. Transaction {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-10 18:00:00', '2020-06-06 18:00:00'),
(215, 'BAL_ADD', 'Balance Add by Admin', 'Your Account has been Credited', '<div>{{amount}} {{currency}} has been added to your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}&nbsp;</b></font>', '{{amount}} {{currency}} credited in your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2021-01-06 00:46:18'),
(216, 'BAL_SUB', 'Balance Subtracted by Admin', 'Your Account has been Debited', '<div>{{amount}} {{currency}} has been subtracted from your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{{amount}} {{currency}} debited from your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2019-11-10 09:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2021-05-18 05:37:12'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\r\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\r\n<div class=\"g-recaptcha\" data-sitekey=\"{{sitekey}}\" data-callback=\"verifyCaptcha\"></div>\r\n<div id=\"g-recaptcha-error\"></div>', '{\"sitekey\":{\"title\":\"Site Key\",\"value\":\"6Lfpm3cUAAAAAGIjbEJKhJNKS4X1Gns9ANjh8MfH\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2021-05-10 06:18:01'),
(3, 'custom-captcha', 'Custom Captcha', 'Just Put Any Random String', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, NULL, '2019-10-18 23:16:05', '2021-05-10 06:05:42'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, NULL, '2021-05-12 05:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"OFC\"],\"description\":\"OFC\",\"social_title\":\"OFC\",\"social_description\":\"OFC\",\"image\":\"62429f8a2dc2f1648533386.png\"}', '2020-07-04 23:42:52', '2022-03-29 00:27:08'),
(24, 'about.content', '{\"heading\":\"Make Best Invest Business Through Us\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\",\"description\":\"Dolor sit amet consectetur adipisicing elit. Itaque perspiciatis fugiat esse molestias sunt neque nulla doloribus inventore quo maiores pariatur commodi similique quidem, mollitia consequatur, repellendus suscipit explicabo nisi.\",\"button_name\":\"Invest Now\",\"button_url\":\"login\",\"video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=C72WkcUZvco\",\"has_image\":\"1\",\"video_background_image\":\"60ae1d6798b871622023527.jpg\"}', '2020-10-28 00:51:20', '2021-06-27 07:44:21'),
(25, 'blog.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Hic tenetur nihil ex. Doloremque ipsa velit, ea molestias expedita sed voluptatem ex voluptatibus temporibus sequi. sddd\"}', '2020-10-28 00:51:34', '2020-10-28 00:52:52'),
(26, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Advantages Minimal Repair Technique\",\"description_nic\":\"<p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Posuere justo diam, commodo wisi dolor vivamus non velit. Luctus faucibus eget id imdiet nibh molestie, eu id convallis libero consectetuer magna, montes curabitur, pellentesque luctus mollis. In et, lacus venenatisMorbi viverra nonummy eget sed libero morbi. Etiam sit lacinia suspendisse sociosqu aliquam nunc. Dictum class non ut consequat eget consectetuer. Suscipit est eleifend porta pharetra, nullam iaculis, vel pretium molestie, aliquam pulvinar rerum arcu. Ac imperdiet at velit vel eu, nisl lacinia ut est gravida pharetra mauris, hendrerit laoreet. Nulla augue primis ut nec augue sapien, sollicitudin parturient sodales nunc justo consectetuer at, scelerisque pede a faucibus, maecenas elit diam. Maecenas facilisis wisi duis lobortis, suscipit laoreet ultricies nec, a mauris convallis, ullamcorper volutpat. Ante cras lacus ullamcorper, interdum rhoncus vitae enim diam vestibulum, mauris mauris pellentesque et blandit aliquet.<\\/p><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Vitae porttitor quam. Accumsan interdum id consectetuer aliquam, a duis sit praesent vestibulum et, et habitant purus nam litora, sit lorem eget neque in id, aenean non. Risus suspendisse, totam lacinia dolor. Tristique ipsum, eget massa a, sollicitudin aliquam risus at, semper ac nec porttito<\\/p><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\"><span style=\\\"color:rgb(85,85,85);\\\">Curabitur sit, amet sit. Ante ac mauris, donec sed arcu neque eget lacinia elit. Rhoncus felis massa malesuada. Ad et, rhoncus scelerisque nunc donec odio, wisi ac quos odio integer rutrum, urna dui integer placerat. Sagittis placerat praesent, nullam quam nam tortor mus, torquent facilisi, fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa lectus diam eu, lectus orci elementum nihil.<\\/span><br \\/><\\/p><blockquote style=\\\"margin-bottom:39px;padding-left:30px;font-size:22px;font-style:italic;line-height:1.4;color:rgb(85,85,85);font-family:Monda, sans-serif;background-color:rgba(255,255,255,0.05);\\\">Fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa nislvel malesuadat<\\/blockquote><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">tiam nisl sit quis, ante tempus pede phasellus vitae nulla, id semper vestibulum. Auctor pulvinar eget id at aliquam, lorem mattis praesent donec amet magna in, mauris etiam est ligula cras. Nec quisque. Pellentesque eget suspendisse ut. In eros, magna auctor augue ligula, amet vel erat amet litora ante. Auctor vestibulum erat vulputate, eget dictum amet quisque sem, a quaerat sed, ipsum aenean integer tellus, rutrum feugiat pellentesque turpis pede a quam.<\\/p>\",\"blog_image\":\"60bb15cbb8dc11622873547.jpg\"}', '2020-10-28 00:57:19', '2021-06-05 07:12:28'),
(27, 'contact_us.content', '{\"title\":\"We are always here for you\",\"email_address\":\"demo@example.com\",\"contact_address\":\"USA, New York.\",\"contact_number\":\"880123456789\"}', '2020-10-28 00:59:19', '2021-05-26 11:51:42'),
(28, 'counter.content', '{\"heading\":\"Our Statistics\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\",\"has_image\":\"1\",\"background_image\":\"60ae1e45657b91622023749.jpg\"}', '2020-10-28 01:04:02', '2021-05-26 09:39:09'),
(30, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Advantages Minimal Repair Technique\",\"description_nic\":\"<p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Posuere justo diam, commodo wisi dolor vivamus non velit. Luctus faucibus eget id imdiet nibh molestie, eu id convallis libero consectetuer magna, montes curabitur, pellentesque luctus mollis. In et, lacus venenatisMorbi viverra nonummy eget sed libero morbi. Etiam sit lacinia suspendisse sociosqu aliquam nunc. Dictum class non ut consequat eget consectetuer. Suscipit est eleifend porta pharetra, nullam iaculis, vel pretium molestie, aliquam pulvinar rerum arcu. Ac imperdiet at velit vel eu, nisl lacinia ut est gravida pharetra mauris, hendrerit laoreet. Nulla augue primis ut nec augue sapien, sollicitudin parturient sodales nunc justo consectetuer at, scelerisque pede a faucibus, maecenas elit diam. Maecenas facilisis wisi duis lobortis, suscipit laoreet ultricies nec, a mauris convallis, ullamcorper volutpat. Ante cras lacus ullamcorper, interdum rhoncus vitae enim diam vestibulum, mauris mauris pellentesque et blandit aliquet.<\\/p><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Vitae porttitor quam. Accumsan interdum id consectetuer aliquam, a duis sit praesent vestibulum et, et habitant purus nam litora, sit lorem eget neque in id, aenean non. Risus suspendisse, totam lacinia dolor. Tristique ipsum, eget massa a, sollicitudin aliquam risus at, semper ac nec porttito<\\/p><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Curabitur sit, amet sit. Ante ac mauris, donec sed arcu neque eget lacinia elit. Rhoncus felis massa malesuada. Ad et, rhoncus scelerisque nunc donec odio, wisi ac quos odio integer rutrum, urna dui integer placerat. Sagittis placerat praesent, nullam quam nam tortor mus, torquent facilisi, fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa lectus diam eu, lectus orci elementum nihil.<\\/p><blockquote style=\\\"margin-bottom:39px;padding-left:30px;font-size:22px;font-style:italic;line-height:1.4;color:rgb(85,85,85);font-family:Monda, sans-serif;background-color:rgba(255,255,255,0.05);\\\">Fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa nislvel malesuadat<\\/blockquote><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">tiam nisl sit quis, ante tempus pede phasellus vitae nulla, id semper vestibulum. Auctor pulvinar eget id at aliquam, lorem mattis praesent donec amet magna in, mauris etiam est ligula cras. Nec quisque. Pellentesque eget suspendisse ut. In eros, magna auctor augue ligula, amet vel erat amet litora ante. Auctor vestibulum erat vulputate, eget dictum amet quisque sem, a quaerat sed, ipsum aenean integer tellus, rutrum feugiat pellentesque turpis pede a quam.<\\/p><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Libero tincidunt tristique, vestibulum tempor ipsum praesent. A a, dolor in dui mauris sed proin sit, mattis ipsum id molestie integer sollicitudin, quis vivamus hymenaeos mi leo, sed condimentum. Sodales dolore vestibulum<\\/p>\",\"blog_image\":\"60bb1598e5c681622873496.jpg\"}', '2020-10-31 00:39:05', '2021-06-05 07:11:37'),
(31, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2020-11-12 04:07:30', '2021-05-26 08:49:49'),
(33, 'feature.content', '{\"heading\":\"Our Feature\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\",\"has_image\":\"1\",\"background_image\":\"60ae201bba9ed1622024219.jpg\"}', '2021-01-03 23:40:54', '2021-05-26 09:47:00'),
(34, 'feature.element', '{\"title\":\"Instant Withdrawal\",\"sub_title\":\"Obcaecati officiis aliquid perspiciatis libero omnis culpa, tempora perferendis\",\"feature_icon\":\"<i class=\\\"las la-arrow-alt-circle-left\\\"><\\/i>\"}', '2021-01-03 23:41:02', '2021-05-26 05:51:53'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', '2021-03-06 01:12:10', '2021-03-06 01:12:10'),
(36, 'service.content', '{\"trx_type\":\"withdraw\",\"heading\":\"asdf fffff\",\"sub_heading\":\"asdf asdfasdf\"}', '2021-03-06 01:27:34', '2021-03-06 02:19:39'),
(39, 'banner.content', '{\"has_image\":\"1\",\"first_heading\":\"Investing in\",\"second_heading\":\"Currency Trading\",\"sub_heading\":\"is not complicated anymore\",\"description\":\"Velit vitae rerum placeat illum hic maxime optio quasi dignissimos impedit dolore dolorem facere quae alias eius expedita laborum voluptas\",\"first_button_name\":\"Registration Now\",\"first_button_url\":\"register\",\"second_button_name\":\"Invest Now\",\"second_button_url\":\"plan\",\"background_image\":\"623d9914e19541648204052.png\",\"main_image\":\"60ae1aaf819371622022831.png\",\"image_1\":\"60ae1cdab47061622023386.png\",\"image_2\":\"60ae1cdab86ff1622023386.png\",\"image_3\":\"60ae1cdab92b21622023386.png\",\"image_4\":\"60ae1cdaba2801622023386.png\",\"image_5\":\"60ae1cdabc0f91622023386.png\"}', '2021-05-02 06:09:30', '2022-03-25 04:57:33'),
(41, 'cookie.data', '{\"link\":\"#\",\"description\":\"<span font-family:=\\\"\\\" \\\"=\\\"\\\" open=\\\"\\\" sans\\\",=\\\"\\\" arial,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;=\\\"\\\" text-align:=\\\"\\\" justify;\\\"=\\\"\\\">It is a long established fact that a reader will be distracted by the readable content.<\\/span>\",\"status\":0}', '2020-07-04 23:42:52', '2021-06-05 11:02:46'),
(47, 'counter.element', '{\"title\":\"Total Clients\",\"counter_digit\":\"200k\",\"counter_icon\":\"<i class=\\\"lar la-user\\\"><\\/i>\"}', '2021-05-26 05:45:07', '2021-05-26 05:45:07'),
(48, 'counter.element', '{\"title\":\"Total Deposit\",\"counter_digit\":\"20000 USD\",\"counter_icon\":\"<i class=\\\"fas fa-money-check\\\"><\\/i>\"}', '2021-05-26 05:45:47', '2021-05-26 05:45:47'),
(49, 'counter.element', '{\"title\":\"Total Withdraw\",\"counter_digit\":\"300M\",\"counter_icon\":\"<i class=\\\"las la-money-bill\\\"><\\/i>\"}', '2021-05-26 05:46:13', '2021-05-26 05:46:13'),
(50, 'counter.element', '{\"title\":\"Company Run\",\"counter_digit\":\"323Y\",\"counter_icon\":\"<i class=\\\"las la-hockey-puck\\\"><\\/i>\"}', '2021-05-26 05:46:32', '2021-05-26 05:46:32'),
(51, 'how_to_work.content', '{\"heading\":\"How To Get Starts\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\"}', '2021-05-26 05:46:55', '2021-05-26 09:44:00'),
(52, 'how_to_work.element', '{\"title\":\"Open an accounts\",\"sub_title\":\"Odit repellendus omnis facere odio eveniet consectetur, dolorem consequatur corrupti aperiam.\",\"work_icon\":\"<i class=\\\"las la-user\\\"><\\/i>\"}', '2021-05-26 05:47:19', '2021-05-26 09:43:57'),
(53, 'how_to_work.element', '{\"title\":\"Make your first deposit\",\"sub_title\":\"Odit repellendus omnis facere odio eveniet consectetur, dolorem consequatur corrupti aperiam\",\"work_icon\":\"<i class=\\\"fas fa-money-bill-wave\\\"><\\/i>\"}', '2021-05-26 05:47:40', '2021-05-26 05:47:41'),
(54, 'how_to_work.element', '{\"title\":\"Request for withdrawal\",\"sub_title\":\"Odit repellendus omnis facere odio eveniet consectetur, dolorem consequatur corrupti aperiam.\",\"work_icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\"}', '2021-05-26 05:48:01', '2021-05-26 05:48:01'),
(55, 'how_to_work.element', '{\"title\":\"Sign in Here\",\"sub_title\":\"Odit repellendus omnis facere odio eveniet consectetur, dolorem consequatur corrupti aperiam\",\"work_icon\":\"<i class=\\\"las la-align-center\\\"><\\/i>\"}', '2021-05-26 05:48:52', '2021-05-26 05:48:52'),
(58, 'feature.element', '{\"title\":\"Customer Support\",\"sub_title\":\"Obcaecati officiis aliquid perspiciatis libero omnis culpa, tempora perferendis\",\"feature_icon\":\"<i class=\\\"las la-calendar-alt\\\"><\\/i>\"}', '2021-05-26 05:51:33', '2021-05-26 05:51:33'),
(59, 'feature.element', '{\"title\":\"Deposit limit\",\"sub_title\":\"Obcaecati officiis aliquid perspiciatis libero omnis culpa, tempora perferendis\",\"feature_icon\":\"<i class=\\\"lab la-joomla\\\"><\\/i>\"}', '2021-05-26 05:52:17', '2021-05-26 05:52:17'),
(60, 'feature.element', '{\"title\":\"SSL Security\",\"sub_title\":\"Obcaecati officiis aliquid perspiciatis libero omnis culpa, tempora perferendis\",\"feature_icon\":\"<i class=\\\"las la-info-circle\\\"><\\/i>\"}', '2021-05-26 05:52:36', '2021-05-26 05:52:36'),
(61, 'feature.element', '{\"title\":\"Referral Bonus\",\"sub_title\":\"Obcaecati officiis aliquid perspiciatis libero omnis culpa, tempora perferendis\",\"feature_icon\":\"<i class=\\\"fas fa-plane-arrival\\\"><\\/i>\"}', '2021-05-26 05:52:56', '2021-05-26 05:52:56'),
(62, 'feature.element', '{\"title\":\"SSL Security\",\"sub_title\":\"Obcaecati officiis aliquid perspiciatis libero omnis culpa, tempora perferendis\",\"feature_icon\":\"<i class=\\\"lab la-houzz\\\"><\\/i>\"}', '2021-05-26 05:53:19', '2021-05-26 05:53:19'),
(63, 'plan.content', '{\"heading\":\"Our Plan\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\"}', '2021-05-26 05:53:48', '2021-05-26 05:53:48'),
(64, 'client.content', '{\"heading\":\"What Our Client\'s Say\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\",\"has_image\":\"1\",\"background_image\":\"60ae212735ab01622024487.jpg\"}', '2021-05-26 05:54:12', '2021-05-26 09:51:27'),
(65, 'client.element', '{\"has_image\":[\"1\"],\"name\":\"Litan Khan\",\"designation\":\"Backend Developer\",\"description\":\"There are many variations of passages of available, but the majority have suffered alteration in some form, by injected humour,\",\"image\":\"60ae21f6024bd1622024694.jpg\"}', '2021-05-26 05:55:12', '2021-06-27 07:45:13'),
(66, 'client.element', '{\"has_image\":[\"1\"],\"name\":\"LITECOIN\",\"designation\":\"Frontend Developer\",\"description\":\"There are many variations of passages of available, but the majority have suffered alteration in some form, by injected humour,\",\"image\":\"60ae21ec4b1241622024684.jpg\"}', '2021-05-26 05:55:29', '2021-06-27 07:45:24'),
(67, 'client.element', '{\"has_image\":[\"1\"],\"name\":\"Md Demo\",\"designation\":\"Backend Developer\",\"description\":\"There are many variations of passages of available, but the majority have suffered alteration in some form, by injected humour,\",\"image\":\"60ae21e3964981622024675.jpg\"}', '2021-05-26 05:55:50', '2021-06-27 07:45:34'),
(68, 'call.content', '{\"has_image\":\"1\",\"heading\":\"Nulla Ut Laboriosam Nam Eius Quas Voluptas\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Ab totam nihil vitae impedit at delectus dignissimos perspiciatis, fugit voluptas repudiandae aliquam quod.\",\"button_name\":\"Join Now\",\"button_url\":\"login\",\"background_image\":\"60ae2e96504b21622027926.jpg\"}', '2021-05-26 05:56:47', '2021-09-26 09:40:53'),
(69, 'subscribe.content', '{\"heading\":\"Subscribe Our Newsletter to get the news and updates first\",\"has_image\":\"1\",\"background_image\":\"60ae0eb7b746e1622019767.jpg\"}', '2021-05-26 08:32:47', '2021-05-26 08:32:47'),
(70, 'footer.content', '{\"heading\":\"dolor sit amet consectetur adipisicing elit. Voluptatum repudiandae, dolorem ex quod qui aliquid magnam animi adipisci sed cupiditate, sint, excepturi nesciunt? Consequatur ex fugit sit et! Consequuntur, adipisci.\",\"has_image\":\"1\",\"background_image\":\"60b4cd763ba541622461814.jpg\"}', '2021-05-26 08:47:57', '2021-06-27 07:44:01'),
(71, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/\"}', '2021-05-26 08:50:16', '2021-05-26 08:50:16'),
(72, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"fab fa-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\\/\"}', '2021-05-26 08:50:38', '2021-05-26 08:50:38'),
(73, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', '2021-05-26 08:51:00', '2021-05-26 08:51:00'),
(74, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"fab fa-youtube\\\"><\\/i>\",\"url\":\"https:\\/\\/www.youtube.com\\/\"}', '2021-05-26 08:51:23', '2021-05-26 08:51:23'),
(82, 'deposit_withdraw.content', '{\"deposit_heading\":\"Latest Deposit\",\"deposit_sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\",\"withdraw_heading\":\"Latest Withdraw\",\"withdraw_sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\"}', '2021-05-26 09:57:49', '2021-09-26 10:55:16'),
(83, 'deposit_withdraw.element', '{\"trx_type\":\"deposit\",\"heading\":\"Latest Deposit\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\"}', '2021-05-26 10:00:01', '2021-05-26 10:00:01'),
(84, 'deposit_withdraw.element', '{\"trx_type\":\"withdraw\",\"heading\":\"Latest Withdraw\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\"}', '2021-05-26 10:00:21', '2021-05-26 10:00:21'),
(85, 'faq.content', '{\"heading\":\"Faqs\",\"sub_heading\":\"Quidem cum autem ipsam Qui impedit distinctio minima illum! Facere, aspernatur saepe.\"}', '2021-05-26 10:31:38', '2021-05-26 10:31:38'),
(86, 'faq.element', '{\"question\":\"What is the main service of  semper lectus nec dolor suscipit rutrum matrix?\",\"answers\":\"Earum, ex a recusandae veritatis quos eligendi provident, dolores nam dolor suscipit saepe! Labore earum nemo eius officiis ratione! Autem, repellat quae.\"}', '2021-05-26 10:32:00', '2021-05-26 10:43:23'),
(87, 'faq.element', '{\"question\":\"What is the main service of   semper lectus nec dolor suscipit rutrum matrix?\",\"answers\":\"Earum, ex a recusandae veritatis quos eligendi provident, dolores nam dolor suscipit saepe! Labore earum nemo eius officiis ratione! Autem, repellat quae\"}', '2021-05-26 10:32:16', '2021-05-26 10:43:31'),
(88, 'faq.element', '{\"question\":\"What is the main service of  semper lectus nec dolor suscipit rutrum matrix?\",\"answers\":\"Earum, ex a recusandae veritatis quos eligendi provident, dolores nam dolor suscipit saepe! Labore earum nemo eius officiis ratione! Autem, repellat quae.\"}', '2021-05-26 10:32:35', '2021-05-26 10:43:39'),
(89, 'faq.element', '{\"question\":\"What is the main service of  semper lectus nec dolor suscipit rutrum matrix?\",\"answers\":\"Earum, ex a recusandae veritatis quos eligendi provident, dolores nam dolor suscipit saepe! Labore earum nemo eius officiis ratione! Autem, repellat quae\"}', '2021-05-26 10:32:50', '2021-05-26 10:43:49'),
(90, 'faq.element', '{\"question\":\"What is the main service of  semper lectus nec dolor suscipit rutrum matrix?\",\"answers\":\"Earum, ex a recusandae veritatis quos eligendi provident, dolores nam dolor suscipit saepe! Labore earum nemo eius officiis ratione! Autem, repellat quae.\"}', '2021-05-26 10:33:06', '2021-05-26 10:43:58'),
(92, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Advantages Minimal Repair Technique\",\"description_nic\":\"<p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Posuere justo diam, commodo wisi dolor vivamus non velit. Luctus faucibus eget id imdiet nibh molestie, eu id convallis libero consectetuer magna, montes curabitur, pellentesque luctus mollis. In et, lacus venenatisMorbi viverra nonummy eget sed libero morbi. Etiam sit lacinia suspendisse sociosqu aliquam nunc. Dictum class non ut consequat eget consectetuer. Suscipit est eleifend porta pharetra, nullam iaculis, vel pretium molestie, aliquam pulvinar rerum arcu. Ac imperdiet at velit vel eu, nisl lacinia ut est gravida pharetra mauris, hendrerit laoreet. Nulla augue primis ut nec augue sapien, sollicitudin parturient sodales nunc justo consectetuer at, scelerisque pede a faucibus, maecenas elit diam. Maecenas facilisis wisi duis lobortis, suscipit laoreet ultricies nec, a mauris convallis, ullamcorper volutpat. Ante cras lacus ullamcorper, interdum rhoncus vitae enim diam vestibulum, mauris mauris pellentesque et blandit aliquet.<\\/p><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Vitae porttitor quam. Accumsan interdum id consectetuer aliquam, a duis sit praesent vestibulum et, et habitant purus nam litora, sit lorem eget neque in id, aenean non. Risus suspendisse, totam lacinia dolor. Tristique ipsum, eget massa a, sollicitudin aliquam risus at, semper ac nec porttit<\\/p><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Curabitur sit, amet sit. Ante ac mauris, donec sed arcu neque eget lacinia elit. Rhoncus felis massa malesuada. Ad et, rhoncus scelerisque nunc donec odio, wisi ac quos odio integer rutrum, urna dui integer placerat. Sagittis placerat praesent, nullam quam nam tortor mus, torquent facilisi, fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa lectus diam eu, lectus orci elementum nihil.<\\/p><blockquote style=\\\"margin-bottom:39px;padding-left:30px;font-size:22px;font-style:italic;line-height:1.4;color:rgb(85,85,85);font-family:Monda, sans-serif;background-color:rgba(255,255,255,0.05);\\\">Fermentum risus adipiscing amet dictumst. Senectus quo ut nunc in sem ac. Praesent et in ligula enim, dolor sit. Quis sapien, nec hac fusce iaculis, quisque ut consequat orci ullamcorper sit vestibulum. Dolor arcu quis massa nislvel malesuadat<\\/blockquote><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">tiam nisl sit quis, ante tempus pede phasellus vitae nulla, id semper vestibulum. Auctor pulvinar eget id at aliquam, lorem mattis praesent donec amet magna in, mauris etiam est ligula cras. Nec quisque. Pellentesque eget suspendisse ut. In eros, magna auctor augue ligula, amet vel erat amet litora ante. Auctor vestibulum erat vulputate, eget dictum amet quisque sem, a quaerat sed, ipsum aenean integer tellus, rutrum feugiat pellentesque turpis pede a quam.<\\/p><p style=\\\"margin-top:-8px;margin-bottom:31px;color:rgb(85,85,85);font-family:Monda, sans-serif;font-size:16px;background-color:rgba(255,255,255,0.05);\\\">Libero tincidunt tristique, vestibulum tempor ipsum praesent. A a, dolor in dui mauris sed proin sit, mattis ipsum id molestie integer sollicitudin, quis vivamus hymenaeos mi leo, sed condimentum. Sodales dolore vestibulum<\\/p>\",\"blog_image\":\"60bb158c68b591622873484.jpg\"}', '2021-05-26 11:09:25', '2021-06-05 07:11:24'),
(93, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"60b4cd5a60f7e1622461786.jpg\"}', '2021-05-26 11:48:31', '2021-05-31 12:49:46'),
(94, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Various versions have evolved over the years, sometimes\",\"description_nic\":\"<span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><br \\/><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div>\",\"blog_image\":\"60b33730f13d71622357808.jpg\"}', '2021-05-30 06:26:48', '2021-05-30 06:31:36'),
(95, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"be distracted by the readable content of a page when\",\"description_nic\":\"<span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><br \\/><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><br \\/><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><br \\/><\\/div>\",\"blog_image\":\"60b33745827d21622357829.jpg\"}', '2021-05-30 06:27:09', '2021-05-30 06:31:47'),
(96, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"It is a long established fact that a reader will be distracted\",\"description_nic\":\"<span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><br \\/><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div><div><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like<\\/span><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/div>\",\"blog_image\":\"60b3377b1b9421622357883.jpg\"}', '2021-05-30 06:28:03', '2021-05-30 06:32:53'),
(97, 'policy_pages.element', '{\"menu\":\"Privacy  Policy\",\"description\":\"<div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">What information do we collect?<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">We gather data from you when you \\r\\nregister on our site, submit a request, buy any services, react to an \\r\\noverview, or round out a structure. \\r\\n                    At the point when requesting any assistance or \\r\\nenrolling on our site, as suitable, you might be approached to enter \\r\\nyour: name, email address, or telephone number. You may, nonetheless, \\r\\nvisit our site anonymously.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">How do we protect your information?<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">\\r\\n                        All provided delicate\\/credit data is sent through Stripe. \\r\\n                        <br \\/>\\r\\n                        After an exchange, your private data (credit \\r\\ncards, social security numbers, financials, and so on) won\'t be put away\\r\\n on our workers.\\r\\n                    <\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Do we disclose any information to outside parties?<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">\\r\\n                    We don\'t sell, exchange, or in any case move to \\r\\noutside gatherings by and by recognizable data. This does exclude \\r\\nconfided in outsiders who help us in working our site, leading our \\r\\nbusiness, or adjusting you, since those gatherings consent to keep this \\r\\ndata private. We may likewise deliver your data when we accept discharge\\r\\n is suitable to follow the law, implement our site strategies, or ensure\\r\\n our own or others\' rights, property, or wellbeing.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">We are consistent with the \\r\\nprerequisites of COPPA (Children\'s Online Privacy Protection Act), we \\r\\ndon\'t gather any data from anybody under 13 years old. Our site, items, \\r\\nand administrations are completely coordinated to individuals who are in\\r\\n any event 13 years of age or more established.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Changes to our Privacy Policy<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">How long we retain your information?<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">At the point when you register \\r\\nfor our site, we cycle and keep your information we have about you \\r\\nhowever long you don\'t erase the record or withdraw yourself (subject to\\r\\n laws and guidelines).<\\/p>\\r\\n                <\\/div>\\r\\n                \\r\\n                    <h3 class=\\\"mb-3\\\">What we don\\u2019t do with your data<\\/h3>\\r\\n                    We don\'t and will never share, \\r\\nunveil, sell, or in any case give your information to different \\r\\norganizations for the promoting of their items or administrations\"}', '2021-06-01 07:52:46', '2021-06-03 11:27:19');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(98, 'policy_pages.element', '{\"menu\":\"Terms and conditions\",\"description\":\"<div class=\\\"mb-5\\\">\\r\\n                    <p class=\\\"font-18\\\">We claim all authority to \\r\\ndismiss, end, or handicap any help with or without cause per \\r\\nadministrator discretion. This is a Complete independent facilitating, \\r\\non the off chance that you misuse our ticket or Livechat or emotionally \\r\\nsupportive network by submitting solicitations or protests we will \\r\\nimpair your record. The solitary time you should reach us about the \\r\\nseaward facilitating is if there is an issue with the worker. We have \\r\\nnot many substance limitations and everything is as per laws and \\r\\nguidelines. Try not to join on the off chance that you intend to do \\r\\nanything contrary to the guidelines, we do check these things and we \\r\\nwill know, don\'t burn through our own and your time by joining on the \\r\\noff chance that you figure you will have the option to sneak by us and \\r\\nbreak the terms.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <ul class=\\\"font-18\\\"><li>Configuration requests - If you have a fully\\r\\n managed dedicated server with us then we offer custom PHP\\/MySQL \\r\\nconfigurations, firewalls for dedicated IPs, DNS, and httpd \\r\\nconfigurations.<\\/li><li>Software requests - Cpanel Extension \\r\\nInstallation will be granted as long as it does not interfere with the \\r\\nsecurity, stability, and performance of other users on the server.<\\/li><li>Emergency Support - We do not provide \\r\\nemergency support \\/ Phone Support \\/ LiveChat Support. Support may take \\r\\nsome hours sometimes.<\\/li><li>Webmaster help - We do not offer any support\\r\\n for webmaster related issues and difficulty including coding, &amp; \\r\\ninstalls, Error solving. if there is an issue where a library or \\r\\nconfiguration of the server then we can help you if it\'s possible from \\r\\nour end.<\\/li><li>Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li>We Don\'t support any child porn or such material.<\\/li><li>No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li>No harassing material that may cause people to retaliate against you.<\\/li><li>No phishing pages.<\\/li><li>You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li>If Anyone attempting to hack or exploit the \\r\\nserver by using your script or hosting, we will terminate your account \\r\\nto keep safe other users.<\\/li><li>Malicious Botnets are strictly forbidden.<\\/li><li>Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li>Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/li><li>Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li>Php\\/CGI proxies are strictly forbidden.<\\/li><li>CGI-IRC is strictly forbidden.<\\/li><li>No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li>NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Terms &amp; Conditions for Users<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">Before getting to this site, you \\r\\nare consenting to be limited by these site Terms and Conditions of Use, \\r\\nevery single appropriate law, and guidelines, and concur that you are \\r\\nanswerable for consistency with any material neighborhood laws. If you \\r\\ndisagree with any of these terms, you are restricted from utilizing or \\r\\ngetting to this site.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Support<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">Whenever you have downloaded our \\r\\nitem, you may get in touch with us for help through email and we will \\r\\ngive a valiant effort to determine your issue. We will attempt to answer\\r\\n using the Email for more modest bug fixes, after which we will refresh \\r\\nthe center bundle. Content help is offered to confirmed clients by \\r\\nTickets as it were. Backing demands made by email and Livechat. \\r\\n                    <\\/p>\\r\\n                    <p class=\\\"my-3 font-18 font-weight-bold\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p>\\r\\n                    <ul class=\\\"font-18\\\"><li>Hang tight for additional update discharge. <\\/li><li>Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Ownership<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">You may not guarantee scholarly \\r\\nor selective possession of any of our items, altered or unmodified. All \\r\\nitems are property, we created them. Our items are given \\\"with no \\r\\nguarantees\\\" without guarantee of any sort, either communicated or \\r\\nsuggested. On no occasion will our juridical individual be subject to \\r\\nany harms including, however not restricted to, immediate, roundabout, \\r\\nextraordinary, accidental, or significant harms or different misfortunes\\r\\n emerging out of the utilization of or powerlessness to utilize our \\r\\nitems.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Warranty<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">We don\'t offer any guarantee or \\r\\nassurance of these Services in any way. When our Services have been \\r\\nmodified we can\'t ensure they will work with all outsider plugins, \\r\\nmodules, or internet browsers. Program similarity ought to be tried \\r\\nagainst the show formats on the demo worker. If you don\'t mind guarantee\\r\\n that the programs you use will work with the component, as we can not \\r\\nensure that our systems will work with all program mixes.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Unauthorized\\/Illegal Usage<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">\\r\\n                        You may not utilize our things for any illicit \\r\\nor unapproved reason or may you, in the utilization of the stage, \\r\\ndisregard any laws in your locale (counting yet not restricted to \\r\\ncopyright laws) just as the laws of your nation and International law. \\r\\nSpecifically, it is disallowed to utilize the things on our foundation \\r\\nfor pages that advance: brutality, illegal intimidation, hard sexual \\r\\nentertainment, bigotry, obscenity content or warez programming joins. \\r\\n                        <br \\/><br \\/>\\r\\n                        You can\'t imitate, copy, duplicate, sell, \\r\\nexchange or adventure any of our segment, utilization of the offered on \\r\\nour things, or admittance to the administration without the express \\r\\ncomposed consent by us or item proprietor. \\r\\n                        <br \\/><br \\/>\\r\\n                        Our Members are liable for all substance posted \\r\\non the discussion and demo and movement that happens under your record. \\r\\n                        <br \\/><br \\/>\\r\\n                        We hold the chance of hindering your \\r\\nparticipation account quickly if we will think about a particularly not \\r\\nallowed conduct. \\r\\n                        <br \\/><br \\/>\\r\\n                    If you make a record on our site, you are liable for\\r\\n keeping up the security of your record, and you are completely \\r\\nanswerable for all exercises that happen under the record and some other\\r\\n activities taken regarding the record. You should quickly inform us, of\\r\\n any unapproved employments of your record or some other penetrates of \\r\\nsecurity.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">We do NOT ensure full SEO \\r\\ncampaign conveyance within 24 hours. We make no assurance for conveyance\\r\\n time by any means. We give our best assessment to orders during the \\r\\nputting in of requests, anyway, these are gauges. We won\'t be considered\\r\\n liable for loss of assets, negative surveys or you being prohibited for\\r\\n late conveyance. If you are selling on a site that requires time touchy\\r\\n outcomes, utilize Our SEO Services at your own risk.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Payment\\/Refund Policy<\\/h3>\\r\\n                    <p class=\\\"font-18\\\">No refund or cash back will be \\r\\nmade. After a deposit has been finished, it is extremely unlikely to \\r\\ninvert it. You should utilize your equilibrium on requests our \\r\\nadministrations, Hosting, SEO campaign. You concur that once you \\r\\ncomplete a deposit, you won\'t document a debate or a chargeback against \\r\\nus in any way, shape, or form. \\r\\n                        <br \\/><br \\/>\\r\\n                        If you document a debate or chargeback against \\r\\nus after a deposit, we claim all authority to end every single future \\r\\nrequest, prohibit you from our site. \\r\\n                    False action, for example, utilizing unapproved or \\r\\ntaken charge cards will prompt the end of your record. There are no \\r\\nspecial cases.<\\/p>\\r\\n                <\\/div>\\r\\n                \\r\\n                    <h3 class=\\\"mb-3\\\">Free Balance \\/ Coupon Policy<\\/h3>\\r\\n                    We offer numerous approaches to \\r\\nget FREE Balance, Coupons and Deposit offers yet we generally reserve \\r\\nthe privilege to audit it and deduct it from your record offset with any\\r\\n explanation we may it is a sort of misuse. If we choose to deduct a few\\r\\n or all of free Balance from your record balance, and your record \\r\\nbalance becomes negative, at that point the record will naturally be \\r\\nsuspended. If your record is suspended because of a negative Balance you\\r\\n can request to make a custom payment to settle your equilibrium to \\r\\nactuate your record<br \\/><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><\\/span>\"}', '2021-06-01 07:52:54', '2021-06-03 11:30:07'),
(99, 'policy_pages.element', '{\"menu\":\"Refund Policy\",\"description\":\"<div class=\\\"mb-5\\\">\\r\\n                    <p class=\\\"font-18\\\">We endeavor to make our clients \\r\\nhappy with the item they\'ve bought from us. In case you\'re experiencing \\r\\ndifficulty with excellent items or trust it is blemished, or potentially\\r\\n you\'re feeling baffled, at that point please present a pass to our \\r\\nHelpdesk to report your inadequate item and our team will help you at \\r\\nthe earliest opportunity. For a harmed content, augmentation or layout, \\r\\nwe will demand from you a connection and add a screen capture of the \\r\\nissue to be shipped off our help administration.<\\/p>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <h3 class=\\\"mb-3\\\">Refund Is Not Possible When:<\\/h3>\\r\\n                    <ul class=\\\"font-18\\\"><li>The framework turns out great on your side yet includes don\'t match or you may have thought something different. <\\/li><li>Your necessities are currently modified and you needn\'t bother with the Script anymore. <\\/li><li>You end up discovering some other Software which you believe is better. <\\/li><li>You don\'t need a site or administration right now. <\\/li><li>Our highlights don\'t address your issues and prerequisites or aren\'t as extensive as you suspected. <\\/li><li>You don\'t have such an environment for your worker to run our framework. <\\/li><li>On the off chance that you as of now download our framework.<\\/li><\\/ul>\\r\\n                <\\/div>\\r\\n                <div class=\\\"mb-5\\\">\\r\\n                    <p class=\\\"font-18\\\">\\r\\n                        <strong>No returns\\/refunds will be offered for digital products except if the product you\\u2019ve purchased is:<\\/strong>\\r\\n                        <\\/p><ul><li>Completely non-functional \\/ not same as demo.<\\/li><li>If you\\u2019ve opened a support ticket but you didn\'t get any response in 48 hours (2 Business days).<\\/li><li>The product description was fully misleading.<\\/li><\\/ul>\\r\\n                    \\r\\n                <\\/div>\\r\\n                \\r\\n                    <p class=\\\"font-18\\\">\\r\\n                        <\\/p><h3 class=\\\"mb-3\\\">Please also note that:<\\/h3>\\r\\n                        <ul class=\\\"font-18\\\"><li>Refunds can take up to 45 days (depends on Bank and payment Methods) to reflect in your account.<\\/li><li>We normally charge 20% (4% gateway fee + 9% Dispute Fee + 7% Processing Fee) as Refund Processing fee.<\\/li><li>You can cancel your account at any time; no refunds for cancellation.<\\/li><li>You will be unable to download or use the item when you claim for refund.<\\/li><li>If you have been downloaded items then no refund allowed.<\\/li><\\/ul>\"}', '2021-06-01 07:53:51', '2021-06-03 11:29:18'),
(100, 'auth.content', '{\"has_image\":\"1\",\"image\":\"6151bba8a30ce1632746408.jpg\"}', '2021-09-27 06:40:08', '2021-09-27 06:40:09');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_form` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(1, 101, 'Paypal', 'Paypal', '5f6f1bd8678601601117144.jpg', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 102, 'Perfect Money', 'PerfectMoney', '5f6f1d2a742211601117482.jpg', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 103, 'Stripe Hosted', 'Stripe', '5f6f1d4bc69e71601117515.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 104, 'Skrill', 'Skrill', '5f6f1d41257181601117505.jpg', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 105, 'PayTM', 'Paytm', '5f6f1d1d3ec731601117469.jpg', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 106, 'Payeer', 'Payeer', '5f6f1bc61518b1601117126.jpg', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, NULL, '2019-09-14 13:14:22', '2020-12-28 01:26:58'),
(7, 107, 'PayStack', 'Paystack', '5f7096563dfb71601214038.jpg', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 108, 'VoguePay', 'Voguepay', '5f6f1d5951a111601117529.jpg', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 109, 'Flutterwave', 'Flutterwave', '5f6f1b9e4bb961601117086.jpg', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 110, 'RazorPay', 'Razorpay', '5f6f1d3672dd61601117494.jpg', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 111, 'Stripe Storefront', 'StripeJs', '5f7096a31ed9a1601214115.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 112, 'Instamojo', 'Instamojo', '5f6f1babbdbb31601117099.jpg', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 501, 'Blockchain', 'Blockchain', '5f6f1b2b20c6f1601116971.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:25:00'),
(14, 502, 'Block.io', 'Blockio', '5f6f19432bedf1601116483.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":false,\"value\":\"1658-8015-2e5e-9afb\"},\"api_pin\":{\"title\":\"API PIN\",\"global\":true,\"value\":\"75757575\"}}', '{\"BTC\":\"BTC\",\"LTC\":\"LTC\"}', 1, '{\"cron\":{\"title\": \"Cron URL\",\"value\":\"ipn.Blockio\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:31:09'),
(15, 503, 'CoinPayments', 'Coinpayments', '5f6f1b6c02ecd1601117036.jpg', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', '5f6f1b94e9b2b1601117076.jpg', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 505, 'Coingate', 'Coingate', '5f6f1b5fe18ee1601117023.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:49:30'),
(18, 506, 'Coinbase Commerce', 'CoinbaseCommerce', '5f6f1b4c774af1601117004.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 113, 'Paypal Express', 'PaypalSdk', '5f6f1bec255c61601117164.jpg', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 114, 'Stripe Checkout', 'StripeV3', '5f709684736321601214084.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 115, 'Mollie', 'Mollie', '5f6f1bb765ab11601117111.jpg', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 116, 'Cashmaal', 'Cashmaal', '61505ff77ce0d1632657399.jpg', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, NULL, '2021-09-26 11:26:39'),
(36, 119, 'Mercado Pago', 'MercadoPago', '6150601fcef191632657439.png', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, NULL, '2021-09-26 11:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matrix_height` int(11) DEFAULT NULL,
  `matrix_width` int(11) DEFAULT NULL,
  `balance_transfer` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 0',
  `balance_transfer_fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `balance_transfer_percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `epin_charge` decimal(5,2) DEFAULT 0.00,
  `epin_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Enable : 1, Disable : 0',
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_version` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `matrix_height`, `matrix_width`, `balance_transfer`, `balance_transfer_fixed_charge`, `balance_transfer_percent_charge`, `epin_charge`, `epin_status`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_api`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `secure_password`, `agree`, `registration`, `active_template`, `sys_version`, `created_at`, `updated_at`) VALUES
(1, 'OFC', 5, 100000000, 1, '34.00000000', '12.00', '4.00', 1, 'INR', '₹', 'do-not-reply@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{name}}, {{message}}', 'ef501b', '2CA4FF', '{\"name\":\"php\"}', '{\"clickatell_api_key\":\"----------------------------\",\"infobip_username\":\"--------------\",\"infobip_password\":\"----------------------\",\"message_bird_api_key\":\"-------------------\",\"nexmo_api_key\":\"----------------------\",\"nexmo_api_secret\":\"----------------------\",\"sms_broadcast_username\":\"----------------------\",\"sms_broadcast_password\":\"-----------------------------\",\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\",\"text_magic_username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\",\"name\":\"textMagic\"}', 0, 1, 0, 0, 1, 0, 1, 1, 'basic', NULL, NULL, '2022-04-02 03:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `gpins`
--

CREATE TABLE `gpins` (
  `id` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1- enable, 0 - disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gpins`
--

INSERT INTO `gpins` (`id`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'kcJftHU3c', 0, '2022-04-02 04:46:09', '2022-04-02 04:46:31'),
(2, '9ivR69mwM', 0, '2022-04-02 04:56:14', '2022-04-02 04:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 0, '2020-07-06 03:47:55', '2021-05-18 05:37:23'),
(5, 'Hindi', 'hn', NULL, 0, 0, '2020-12-29 02:20:07', '2020-12-29 02:20:16'),
(9, 'Bangla', 'bn', NULL, 0, 0, '2021-03-14 04:37:41', '2021-05-12 05:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `plan_id`, `level`, `amount`, `created_at`, `updated_at`) VALUES
(84, 1, 1, '5.00000000', '2022-04-01 07:56:56', '2022-04-01 07:56:56'),
(85, 1, 2, '4.00000000', '2022-04-01 07:56:56', '2022-04-01 07:56:56'),
(86, 1, 3, '3.00000000', '2022-04-01 07:56:56', '2022-04-01 07:56:56'),
(87, 1, 4, '2.00000000', '2022-04-01 07:56:56', '2022-04-01 07:56:56'),
(88, 1, 5, '1.00000000', '2022-04-01 07:56:56', '2022-04-01 07:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` double(20,2) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0- pending,1-shipped, 2-delievered',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2000.00, 1, '2022-04-02 08:58:44', '2022-04-02 08:59:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 7, 2, '2022-04-02 08:58:45', '2022-04-02 08:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', 'home', 'templates.basic.', '[\"about\",\"counter\",\"how_to_work\",\"feature\",\"plan\",\"client\",\"deposit_withdraw\",\"subscribe\",\"faq\",\"call\",\"blog\"]', 1, '2020-07-11 06:23:58', '2021-05-26 10:45:14'),
(12, 'About', 'about', 'templates.basic.', '[\"about\",\"call\",\"how_to_work\"]', 0, '2021-05-30 12:14:18', '2021-05-30 12:29:56'),
(13, 'Plan', 'plan', 'templates.basic.', '[\"plan\",\"feature\",\"deposit_withdraw\"]', 1, '2021-05-30 12:14:55', '2021-05-30 12:31:55'),
(16, 'Blog', 'blog', 'templates.basic.', NULL, 1, '2021-09-26 09:57:40', '2021-09-26 09:57:40'),
(17, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2021-09-26 09:57:48', '2021-09-26 09:57:48'),
(18, 'Products', 'Products', 'templates.basic.', NULL, 1, '2022-03-24 07:15:45', '2022-03-24 07:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nk@gmail.com', '770884', '2022-03-31 07:31:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'eadb01341a653ddce111d90fd168606b90bef722109dd395f7f42bcd054dd779', '[\"*\"]', NULL, '2022-03-23 05:49:43', '2022-03-23 05:49:43'),
(2, 'App\\Models\\User', 1, 'auth_token', 'c222a1f03fd980169f7624c14a590d67f4791b1ffccc060c9ce2686136756992', '[\"*\"]', NULL, '2022-03-23 05:49:59', '2022-03-23 05:49:59'),
(3, 'App\\Models\\User', 1, 'auth_token', '84adf8956e548fa1e2aea9e601234719a5a406d74636f1f7aa040f90e56ffc28', '[\"*\"]', NULL, '2022-03-23 06:28:18', '2022-03-23 06:28:18'),
(4, 'App\\Models\\User', 1, 'auth_token', '51227038a6a1a15f1ba20140328f6ef122f8ca9cb058688b306a1333859c071d', '[\"*\"]', NULL, '2022-03-23 06:53:11', '2022-03-23 06:53:11'),
(5, 'App\\Models\\User', 1, 'auth_token', '19028645b92f0e4786c9d531b8d55c48472767582d6e1af2ff77bb2604e030dd', '[\"*\"]', NULL, '2022-03-23 06:54:04', '2022-03-23 06:54:04'),
(6, 'App\\Models\\User', 1, 'auth_token', '4849167106a18e2c9ebd96deb9f98d096e5ceea4e0f65ea205f92f9909783640', '[\"*\"]', NULL, '2022-03-23 23:56:44', '2022-03-23 23:56:44'),
(7, 'App\\Models\\User', 1, 'auth_token', '449e39f00d14e07663f33ed8dd01f68a8ea1481e6b73c9ea2fc1b3f88f48999f', '[\"*\"]', NULL, '2022-03-23 23:59:42', '2022-03-23 23:59:42'),
(8, 'App\\Models\\User', 4, 'auth_token', '1b335b70111c559ed555cc21e80d6c8be526b5012eb9bc3cd7f12ca254491723', '[\"*\"]', NULL, '2022-03-24 00:53:06', '2022-03-24 00:53:06'),
(9, 'App\\Models\\User', 4, 'auth_token', '03d84056ff81c0e1ee89d75329990ce3b6b25b88381a95068d15afe11d80c5f4', '[\"*\"]', NULL, '2022-03-24 01:58:16', '2022-03-24 01:58:16'),
(10, 'App\\Models\\User', 1, 'auth_token', '2bf55c4bc2dbde3a0f29426ecc47a2156d89af005ed3ee15441b585e1d77c993', '[\"*\"]', NULL, '2022-03-24 01:59:04', '2022-03-24 01:59:04'),
(11, 'App\\Models\\User', 1, 'auth_token', '2d5bd91de707d9188fe431f5d501373b23b5e36d92eba2093fad820e6f6aa319', '[\"*\"]', NULL, '2022-03-24 01:59:18', '2022-03-24 01:59:18'),
(12, 'App\\Models\\User', 1, 'auth_token', '71bdff814948aa4f5b616bfb811cf1a104ba453faf28068a5dd70560ec448d55', '[\"*\"]', NULL, '2022-03-24 02:00:02', '2022-03-24 02:00:02'),
(13, 'App\\Models\\User', 3, 'auth_token', 'a6d706632735a73cad0c10ec3598753c9a6f31ee341779451c761505e2630d47', '[\"*\"]', NULL, '2022-03-24 02:07:41', '2022-03-24 02:07:41'),
(14, 'App\\Models\\User', 1, 'auth_token', 'e4219e5590a8fc34eece5daa1b9176ecbe1cdf5cafddc7b08284021ce13f1641', '[\"*\"]', NULL, '2022-03-24 02:13:09', '2022-03-24 02:13:09'),
(15, 'App\\Models\\User', 1, 'auth_token', 'dc4f7db7787459e7d7a1ae7b5d4de17baf9a339a9e4cd203a0d4db8d62ef1aa8', '[\"*\"]', NULL, '2022-03-24 02:13:42', '2022-03-24 02:13:42'),
(16, 'App\\Models\\User', 1, 'auth_token', 'b10a14147879ecb5df52565c1e0e728e958ce77ddf6f08695b2809ec246b6657', '[\"*\"]', NULL, '2022-03-24 02:14:13', '2022-03-24 02:14:13'),
(17, 'App\\Models\\User', 3, 'auth_token', 'f482b81925303bedeeb84f352aa4c33b287833f0ee4e77dbfa7e91219eb336b1', '[\"*\"]', NULL, '2022-03-24 02:40:47', '2022-03-24 02:40:47'),
(18, 'App\\Models\\User', 1, 'auth_token', 'b4bb4d583ae39c3e86f3343a0223df9ce732170c368d9b88f89ba0e3beb5a2e1', '[\"*\"]', NULL, '2022-03-24 02:50:18', '2022-03-24 02:50:18'),
(19, 'App\\Models\\User', 3, 'auth_token', '564869e1fa15e901f6875c1d5a4a9d853665996cc7ad353792d729cf922fc5b2', '[\"*\"]', NULL, '2022-03-24 02:55:27', '2022-03-24 02:55:27'),
(20, 'App\\Models\\User', 3, 'auth_token', '9ea3901382f4a1ba007624733300d658c67e8e4f84d10e074630cf72427e8173', '[\"*\"]', NULL, '2022-03-24 03:02:19', '2022-03-24 03:02:19'),
(21, 'App\\Models\\User', 3, 'auth_token', '2c15456bf7c62efb85295da4c6afd6773edf0ba76dbf651b773aca3ef85be351', '[\"*\"]', NULL, '2022-03-24 03:03:14', '2022-03-24 03:03:14'),
(22, 'App\\Models\\User', 3, 'auth_token', '2dae297b28d496128ebef45867242e4885f8dbb1798abe9ced10e03a5e7cdb20', '[\"*\"]', NULL, '2022-03-24 03:06:12', '2022-03-24 03:06:12'),
(23, 'App\\Models\\User', 3, 'auth_token', '8c22a9f7671321fdbe41530250cc018b7a983b94d3491e98154579321f270a14', '[\"*\"]', NULL, '2022-03-24 03:08:28', '2022-03-24 03:08:28'),
(24, 'App\\Models\\User', 3, 'auth_token', '0ea9e7e7cc96a1d02afba428b119684870a731e52287bf2c8436e603772d2975', '[\"*\"]', NULL, '2022-03-24 03:08:35', '2022-03-24 03:08:35'),
(25, 'App\\Models\\User', 3, 'auth_token', 'a0de71386c0535d65d53e9f8d7916d75c686e2bb323bcaf38524dbddbc865522', '[\"*\"]', NULL, '2022-03-24 03:09:25', '2022-03-24 03:09:25'),
(26, 'App\\Models\\User', 3, 'auth_token', 'e1a5d1dc0da71eb2dbd9f2df98c0a2ae5b7b3aaff78ac72898fbf46726c734fb', '[\"*\"]', NULL, '2022-03-24 03:12:57', '2022-03-24 03:12:57'),
(27, 'App\\Models\\User', 3, 'auth_token', 'bd103cc04a146f11629730a4566d5ef9088239905793f2ff7143e6a60c21793f', '[\"*\"]', NULL, '2022-03-24 03:12:58', '2022-03-24 03:12:58'),
(28, 'App\\Models\\User', 3, 'auth_token', '6bc815338838f792e06c6803c42d537f0926a0f7d6beacb787547ad1be2591ea', '[\"*\"]', NULL, '2022-03-24 03:12:58', '2022-03-24 03:12:58'),
(29, 'App\\Models\\User', 3, 'auth_token', '4bfa8d2a97bdb9ad8fa91a996b602e398dd57520c3fced9a24b46d26c0cefadd', '[\"*\"]', NULL, '2022-03-24 03:13:44', '2022-03-24 03:13:44'),
(30, 'App\\Models\\User', 3, 'auth_token', '04f76650c4fc83e17b07992f602e66c852a555c4de3e622e94c3c282698b184b', '[\"*\"]', NULL, '2022-03-24 03:18:39', '2022-03-24 03:18:39'),
(31, 'App\\Models\\User', 1, 'auth_token', 'b7a6606d5e97a9c9b225000ab61424c210485819e6b5a45c64f4bc078edfc1f3', '[\"*\"]', NULL, '2022-03-24 03:27:57', '2022-03-24 03:27:57'),
(32, 'App\\Models\\User', 1, 'auth_token', '13d5a2796b16cd34415861250f7bc7438f03edcf4512a4a9837be62bdce3d491', '[\"*\"]', NULL, '2022-03-24 03:33:54', '2022-03-24 03:33:54'),
(33, 'App\\Models\\User', 1, 'auth_token', '60f0418032c79157a11d5f179df03e2ac65dafb79815fb49a0d43df71c47abb1', '[\"*\"]', NULL, '2022-03-24 03:44:39', '2022-03-24 03:44:39'),
(34, 'App\\Models\\User', 1, 'auth_token', '68a30cddd92ae3dc30a8ca1d3afe9c7cd673b0e0ce4fb906764ca2780fcf2077', '[\"*\"]', NULL, '2022-03-24 03:45:27', '2022-03-24 03:45:27'),
(35, 'App\\Models\\User', 1, 'auth_token', 'd865e042e90c94a7d2f59e3dc6df8ed3882876a7213d86928beff31cec216248', '[\"*\"]', NULL, '2022-03-24 03:46:33', '2022-03-24 03:46:33'),
(36, 'App\\Models\\User', 1, 'auth_token', 'f0d5a7245bbd5c1a3d8c6c1048f61845cf1a8f048c35629ca0ce8caedff98bae', '[\"*\"]', NULL, '2022-03-24 03:46:39', '2022-03-24 03:46:39'),
(37, 'App\\Models\\User', 1, 'auth_token', 'f809fdf48c7413c26efe8a4ea12cae2d6189290116d9b667d782961648611a6c', '[\"*\"]', NULL, '2022-03-24 03:48:28', '2022-03-24 03:48:28'),
(38, 'App\\Models\\User', 1, 'auth_token', '505852cb10cd10f317ec2e692248a7dc8181be9b2749602f8d10a38fe7f68519', '[\"*\"]', NULL, '2022-03-24 03:49:06', '2022-03-24 03:49:06'),
(39, 'App\\Models\\User', 1, 'auth_token', '21a5dc0e1177e0e15e3bfa4748d3376d71ef0e03460f56e79dd9a7eb05f436f2', '[\"*\"]', NULL, '2022-03-24 03:51:41', '2022-03-24 03:51:41'),
(40, 'App\\Models\\User', 1, 'auth_token', 'e40c183625cf9aaffc5659162c1bf9efbafa2775e0ce2e0cc810bfd8eb9c4fc9', '[\"*\"]', NULL, '2022-03-24 03:54:18', '2022-03-24 03:54:18'),
(41, 'App\\Models\\User', 1, 'auth_token', 'be78ab20e0dc445779db15f76bd3a85429ac70a91400288fb0a589d071ffaa64', '[\"*\"]', NULL, '2022-03-24 03:55:15', '2022-03-24 03:55:15'),
(42, 'App\\Models\\User', 3, 'auth_token', 'ab7efa70c861c336859ad143f69b8cd24cbed97f82eb1d5af4946861b5ff9360', '[\"*\"]', NULL, '2022-03-24 03:57:33', '2022-03-24 03:57:33'),
(43, 'App\\Models\\User', 1, 'auth_token', '6d5a3fb79ee9eddf056fb846ec2faa8ab2240c67176b879dd4805d14eff88cc5', '[\"*\"]', NULL, '2022-03-24 03:58:17', '2022-03-24 03:58:17'),
(44, 'App\\Models\\User', 3, 'auth_token', 'b702b311ceaffa7b422a98f58c1fefce404517cf6a8491368b939a7b22493e46', '[\"*\"]', NULL, '2022-03-24 04:28:55', '2022-03-24 04:28:55'),
(45, 'App\\Models\\User', 3, 'auth_token', '34a10cfc9264dc2fce03004e5cc19fd26f86b2da3a9a6091f677ba78958807c5', '[\"*\"]', NULL, '2022-03-24 04:32:25', '2022-03-24 04:32:25'),
(46, 'App\\Models\\User', 1, 'auth_token', 'ec223298fd08e04734c3bb3573590faedd90e540fcc54887fe1f108315fc054f', '[\"*\"]', NULL, '2022-03-24 05:21:37', '2022-03-24 05:21:37'),
(47, 'App\\Models\\User', 1, 'auth_token', '26c4d48053a57b9d1b07e2eb086c25d9c9a17f631ab0468224c352eea255bb4f', '[\"*\"]', NULL, '2022-03-24 05:22:34', '2022-03-24 05:22:34'),
(48, 'App\\Models\\User', 1, 'auth_token', '3778368fb24b73c796016ec9e0ddf3a05bafab999013982206fd28bcb9a7f928', '[\"*\"]', NULL, '2022-03-24 05:35:02', '2022-03-24 05:35:02'),
(49, 'App\\Models\\User', 3, 'auth_token', '3181ba31a0a8d747ea67f1375d63ba6966c8111bc71529294db2a795769d1b5c', '[\"*\"]', NULL, '2022-03-24 05:41:54', '2022-03-24 05:41:54'),
(50, 'App\\Models\\User', 3, 'auth_token', 'c30bbed211e81f0ab7c37ae89cc954c051838e0ba9b2b7b00e59b1b4d8a6a98f', '[\"*\"]', NULL, '2022-03-24 05:45:54', '2022-03-24 05:45:54'),
(51, 'App\\Models\\User', 16, 'auth_token', '6f88b9e6f04f91714921f2d37e9517cfc2164c932f24b7967cccc96d9c83c4fa', '[\"*\"]', NULL, '2022-03-24 06:08:45', '2022-03-24 06:08:45'),
(52, 'App\\Models\\User', 23, 'auth_token', '61264a9d8466e2bf2dffeb4490bd0d5b49d520b5af7ed0cb47ec5dbbd9048281', '[\"*\"]', NULL, '2022-03-24 07:25:56', '2022-03-24 07:25:56'),
(53, 'App\\Models\\User', 24, 'auth_token', '1a1e8b71a22a9933a2846d32957e9b85aadf99a9975e5c3a4d8d3f783115a0d2', '[\"*\"]', NULL, '2022-03-24 07:30:06', '2022-03-24 07:30:06'),
(54, 'App\\Models\\User', 25, 'auth_token', 'f1ec31b9ce41866d355fedc68a5cca84ecf93c56f287a778b7bd5388e730ecb9', '[\"*\"]', NULL, '2022-03-24 07:32:40', '2022-03-24 07:32:40'),
(55, 'App\\Models\\User', 27, 'auth_token', '6e3a07a661bfbe02275ca007228d39a6f7b62db213c242cdacfda8b9f2824343', '[\"*\"]', NULL, '2022-03-24 22:18:54', '2022-03-24 22:18:54'),
(56, 'App\\Models\\User', 3, 'auth_token', 'cb30480f48b74be1897d4e84b61d2784b73ecd6896b39d3f0542a922c652db73', '[\"*\"]', NULL, '2022-03-24 22:44:28', '2022-03-24 22:44:28'),
(57, 'App\\Models\\User', 3, 'auth_token', 'd9d9032271e062eeb491379df7ced8ab3a9586fc60d0a7a81ea7e644d60408a8', '[\"*\"]', NULL, '2022-03-24 22:47:46', '2022-03-24 22:47:46'),
(58, 'App\\Models\\User', 3, 'auth_token', '433fa351b77d73a1fc04003827251e61f423c7a7f47e3850c03b62649d4648d3', '[\"*\"]', NULL, '2022-03-25 05:16:32', '2022-03-25 05:16:32'),
(59, 'App\\Models\\User', 3, 'auth_token', '03a4b8c4a8684f93cd9cc0e2d70dc4429379d376cd6083ea45d509b0448e4e1d', '[\"*\"]', NULL, '2022-03-25 06:32:37', '2022-03-25 06:32:37'),
(60, 'App\\Models\\User', 3, 'auth_token', '6a923c2dd13f50208827f6af89f6cd75b9733d09f0426328d56130a14477c8cf', '[\"*\"]', NULL, '2022-03-25 07:08:15', '2022-03-25 07:08:15'),
(61, 'App\\Models\\User', 3, 'auth_token', 'b6da4f5adf15008a915ad3d5c9ee0435858824999ddb5bd14d7ee89ca97c7c49', '[\"*\"]', NULL, '2022-03-25 07:15:41', '2022-03-25 07:15:41'),
(62, 'App\\Models\\User', 3, 'auth_token', '4d184ec3042dee70b826f1b1dd6768191d46a2f7d00eee307df365fb77ec180b', '[\"*\"]', NULL, '2022-03-25 07:42:10', '2022-03-25 07:42:10'),
(63, 'App\\Models\\User', 3, 'auth_token', 'c2b94e5cc857f4c0e207f78d41ee998684d89f2ca1df9bf2fa6c77f0df0f3032', '[\"*\"]', NULL, '2022-03-25 08:23:11', '2022-03-25 08:23:11'),
(64, 'App\\Models\\User', 3, 'auth_token', 'c98d29b51878668a50a4762c9d4fed340754093d7c08352bb4b2c2df29840d6e', '[\"*\"]', NULL, '2022-03-27 22:42:47', '2022-03-27 22:42:47'),
(65, 'App\\Models\\User', 3, 'auth_token', '870f87ad8dd04da26a4706fbf148835552aea57278c6078c99ff98bd6b35329e', '[\"*\"]', NULL, '2022-03-27 22:47:16', '2022-03-27 22:47:16'),
(66, 'App\\Models\\User', 3, 'auth_token', '81df0714cca2669c7573757d7e6519501e0a5a77aa7c6f4c3feb8a618e3a2510', '[\"*\"]', NULL, '2022-03-27 22:55:58', '2022-03-27 22:55:58'),
(67, 'App\\Models\\User', 3, 'auth_token', '8d51ddfa5a79299507dbd455d2d9f95f60c57058d2faf134209765726d8f6c5e', '[\"*\"]', NULL, '2022-03-27 23:04:11', '2022-03-27 23:04:11'),
(68, 'App\\Models\\User', 3, 'auth_token', '1d42cdd47bdb2ea35ecd498eb223df6cc779da1ec917abf7c617792b671a831e', '[\"*\"]', NULL, '2022-03-27 23:12:45', '2022-03-27 23:12:45'),
(69, 'App\\Models\\User', 3, 'auth_token', '989dd96d01e3a81a196c53e0c56a3f5d8f018d878296a277a162029c0e27d1c4', '[\"*\"]', NULL, '2022-03-27 23:19:28', '2022-03-27 23:19:28'),
(70, 'App\\Models\\User', 3, 'auth_token', '7c568c4957bd4ea68e54e3fc3b3afd87f13c405dbddfed480832fbc211e95eca', '[\"*\"]', NULL, '2022-03-27 23:24:43', '2022-03-27 23:24:43'),
(71, 'App\\Models\\User', 3, 'auth_token', '88dd929d75460d198f541ebbb6cc3522ab58dfe719b7a8f2db979cb7e9aea366', '[\"*\"]', NULL, '2022-03-27 23:26:56', '2022-03-27 23:26:56'),
(72, 'App\\Models\\User', 3, 'auth_token', 'b005e16639cee82d5fdb28be7fdd88b3af96497c00246378006db22fd874d7ca', '[\"*\"]', NULL, '2022-03-27 23:28:19', '2022-03-27 23:28:19'),
(73, 'App\\Models\\User', 3, 'auth_token', '40b90ac29e9b655791e9ca9f97198c978ca7b473c65e14dcf241d613998e2419', '[\"*\"]', NULL, '2022-03-27 23:29:13', '2022-03-27 23:29:13'),
(74, 'App\\Models\\User', 3, 'auth_token', '1d3ec7dbc23738e03a477e8270a41f60a331828365b57d1afc21829cce38394b', '[\"*\"]', NULL, '2022-03-27 23:33:40', '2022-03-27 23:33:40');

-- --------------------------------------------------------

--
-- Table structure for table `pins`
--

CREATE TABLE `pins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `generate_user_id` int(11) DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `pin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Unused: 0, Used: 1',
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` int(8) NOT NULL,
  `price` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `referral_bonus` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Active : 1, Inactive :0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `tax`, `month`, `price`, `referral_bonus`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Basic Plan', '5', 20, '3000.00000000', '150.00000000', 1, '2022-03-21 23:35:42', '2022-04-01 07:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscriptions`
--

CREATE TABLE `plan_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_subscriptions`
--

INSERT INTO `plan_subscriptions` (`id`, `user_id`, `plan_id`, `order_number`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'MUW9K3PA932T', '3000.00000000', '2022-04-02 04:46:31', '2022-04-02 04:46:31'),
(2, 3, 1, 'HFYOF2Q33GCJ', '3000.00000000', '2022-04-02 04:56:54', '2022-04-02 04:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `category_id` int(11) NOT NULL,
  `short_description` varchar(100) DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `material_type` varchar(100) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `image` varchar(100) DEFAULT NULL,
  `price` double(20,0) NOT NULL,
  `size` varchar(20) NOT NULL,
  `dimension` varchar(100) DEFAULT NULL,
  `quantity` int(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `short_description`, `long_description`, `material_type`, `status`, `image`, `price`, `size`, `dimension`, `quantity`, `created_at`, `updated_at`) VALUES
(6, 'saree', 7, 'Different types of Pleats Making.', 'For all kinds of Sarees like Chiffon, Cotton,Silk etc...', 'cotton', 1, '20220325041259.jpg', 2000, 'XLL', '6ft', 0, '2022-03-23 08:14:15', '2022-04-01 00:47:57'),
(7, 'shirts', 6, 'look beautiful, perfect fit', 'cotton, look perfect, black colour', 'fabric', 1, '20220324135654.jpg', 1000, 'M', '120', 0, '2022-03-24 08:25:51', '2022-04-01 00:48:39'),
(8, 'modern dress', 7, 'test', 'test', 'fancy', 1, '20220325043327.avif', 10000, 'XL', 'test', 4, '2022-03-24 23:02:57', '2022-03-24 23:03:27'),
(9, 'Fancy dress', 7, 'fancy,expensive', 'demo piece', 'fancy', 1, '20220325043418.avif', 10000, 'M', '5ft', 0, '2022-03-24 23:04:18', '2022-04-01 00:50:17'),
(10, 'material modern dress', 7, 'test', 'test', 'fancy', 1, '20220325043627.avif', 12000, 'XL', 'test', 0, '2022-03-24 23:06:27', '2022-04-01 00:46:43'),
(11, 'casual dress', 6, 'test', 'test', 'fancy', 1, '20220325043730.avif', 10000, 'M', '2m', 0, '2022-03-24 23:07:30', '2022-04-01 00:46:36'),
(12, 'Men in black', 6, 'test', 'test', 'casual', 1, '20220325043826.avif', 10000, 'XL', '30cm', 0, '2022-03-24 23:08:26', '2022-04-01 00:46:19'),
(13, 'formal dress', 6, 'test', 'test', 'Formal', 1, '20220325043913.avif', 10000, 'S', '5m', 0, '2022-03-24 23:09:13', '2022-04-01 00:46:28'),
(14, 'Pant', 6, 'Demo piece', 'perfect fit', 'cotton', 0, '20220331132849.jpg', 800, 'M', '600', 0, '2022-03-31 07:42:25', '2022-04-01 01:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `return_payments`
--

CREATE TABLE `return_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date_of_payment` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `return_payments`
--

INSERT INTO `return_payments` (`id`, `user_id`, `date`, `amount`, `status`, `date_of_payment`, `created_at`, `updated_at`) VALUES
(1, 2, '2022-05-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(2, 2, '2022-06-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(3, 2, '2022-07-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(4, 2, '2022-08-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(5, 2, '2022-09-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(6, 2, '2022-10-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(7, 2, '2022-11-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(8, 2, '2022-12-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(9, 2, '2023-01-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(10, 2, '2023-02-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(11, 2, '2023-03-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(12, 2, '2023-04-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(13, 2, '2023-05-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(14, 2, '2023-06-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(15, 2, '2023-07-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(16, 2, '2023-08-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(17, 2, '2023-09-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(18, 2, '2023-10-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(19, 2, '2023-11-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(20, 2, '2023-12-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(21, 3, '2022-05-15', '125', 1, '2022-04-02 14:16:35', NULL, '2022-04-02 08:46:35'),
(22, 3, '2022-06-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(23, 3, '2022-07-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(24, 3, '2022-08-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(25, 3, '2022-09-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(26, 3, '2022-10-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(27, 3, '2022-11-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(28, 3, '2022-12-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(29, 3, '2023-01-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(30, 3, '2023-02-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(31, 3, '2023-03-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(32, 3, '2023-04-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(33, 3, '2023-05-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(34, 3, '2023-06-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(35, 3, '2023-07-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(36, 3, '2023-08-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(37, 3, '2023-09-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(38, 3, '2023-10-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(39, 3, '2023-11-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL),
(40, 3, '2023-12-15', NULL, 0, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supportticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mark` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Recharge Log : 1 Normarl : 0',
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `mark`, `details`, `created_at`, `updated_at`) VALUES
(1, 2, '3000.00000000', '0.00000000', '0.00000000', '-', 'MUW9K3PA932T', 0, 'Subscribe Plan Basic Plan', '2022-04-02 04:46:31', '2022-04-02 04:46:31'),
(2, 3, '3000.00000000', '0.00000000', '0.00000000', '-', 'HFYOF2Q33GCJ', 0, 'Subscribe Plan Basic Plan', '2022-04-02 04:56:54', '2022-04-02 04:56:54'),
(3, 2, '142.50000000', '0.00000000', '142.50000000', '+', 'KDXM3CUNACF9', 0, 'Level 1 commission from gnanamurugan (Tax applied 5%)', '2022-04-02 04:56:54', '2022-04-02 04:56:54'),
(4, 3, '125.00000000', '0.00000000', '0.00000000', '+', 'N1GCXHV7US9V', 0, 'Return Payment For 2022-05-15', '2022-04-02 08:46:35', '2022-04-02 08:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `position_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `pin`, `ref_by`, `position_id`, `position`, `balance`, `password`, `image`, `address`, `status`, `ev`, `sv`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Gnana', 'Murugan', 'Gnanam', 'gnanamurugan@vrikshatech.in', 'IN', '938870970098', '', 0, NULL, NULL, '0.00000000', '$2y$10$..gB9oIqP/L0/rvVNzO/XOzu2/3xY3yHRNCUFlxQN/yj1hraeep62', NULL, '{\"address\":\"No 3 new afdddress\",\"city\":\"Chennai\",\"state\":\"Tamil Nadu\",\"zip\":\"600056\",\"country\":\"India\",\"acc_name\":\"Nirmal Kumar\",\"acc_no\":\"789798789449YU\",\"br_name\":\"Chennai\",\"ifsc\":\"ISH7987\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '2022-03-21 23:34:53', '2022-04-02 08:40:07'),
(2, 'Nirmal', 'Kumar', 'nirmalkumar', 'kumar.venkat@vrikshatech.in', 'IN', '919585265254', 'kcJftHU3c', 0, NULL, NULL, '142.50000000', '$2y$10$d38DH1wPuyuFXvOuMcIWh.IwmmDEffsceB1F1WOe/ypsE6oIjJTFO', NULL, '{\"address\":\"No #3 new address\",\"state\":\"Tamil Nadu\",\"zip\":\"600056\",\"country\":\"India\",\"city\":\"Chennai\",\"acc_name\":\"Nirmal Kumar N\",\"acc_no\":\"2344444444\",\"br_name\":\"Chennaii\",\"ifsc\":\"ISH798788\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '2022-04-02 04:46:31', '2022-04-02 08:58:07'),
(3, 'murugan', 'gnana', 'gnanamurugan', 'gnanamurugan12@vrikshatech.in', 'IN', '91855896555555', '9ivR69mwM', 2, 2, 1, '0.00000000', '$2y$10$LuI0leJrvK5iT1OPUghjVOxLjpVED20DZDCdCcDmS5JDc1J6QHCGi', NULL, '{\"address\":null,\"city\":\"Chennai\",\"state\":\"Tamil Nadu\",\"zip\":null,\"country\":\"India\",\"acc_name\":\"Nirmal Kumar\",\"acc_no\":\"789798789449YU\",\"br_name\":\"Chennai\",\"ifsc\":\"ISH7987\"}', 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '2022-04-02 04:56:54', '2022-04-02 04:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 2, '27.5.248.115', 'Chennai', 'India', 'IN', '80.2785', '13.0878', 'Chrome', 'Windows 10', '2022-04-02 04:46:31', '2022-04-02 04:46:31'),
(2, 3, '27.5.248.115', 'Chennai', 'India', 'IN', '80.2785', '13.0878', 'Chrome', 'Windows 10', '2022-04-02 04:56:54', '2022-04-02 04:56:54'),
(3, 2, '27.5.248.115', 'Chennai', 'India', 'IN', '80.2785', '13.0878', 'Chrome', 'Windows 10', '2022-04-02 04:57:16', '2022-04-02 04:57:16'),
(4, 2, '27.5.248.115', 'Chennai', 'India', 'IN', '80.2785', '13.0878', 'Chrome', 'Windows 10', '2022-04-02 08:40:27', '2022-04-02 08:40:27'),
(5, 2, '27.5.248.115', 'Chennai', 'India', 'IN', '80.2785', '13.0878', 'Chrome', 'Windows 10', '2022-04-02 08:57:34', '2022-04-02 08:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `delay` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gpins`
--
ALTER TABLE `gpins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pins`
--
ALTER TABLE `pins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_payments`
--
ALTER TABLE `return_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gpins`
--
ALTER TABLE `gpins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `pins`
--
ALTER TABLE `pins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `return_payments`
--
ALTER TABLE `return_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
