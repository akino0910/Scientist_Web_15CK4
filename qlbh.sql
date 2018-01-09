/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : qlbh

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 09/01/2018 18:08:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `CatID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Máy ảnh DSLR');
INSERT INTO `categories` VALUES (2, 'Máy ảnh du lịch');
INSERT INTO `categories` VALUES (3, 'Máy ảnh Mirrorless');
INSERT INTO `categories` VALUES (4, 'Camera Action');
INSERT INTO `categories` VALUES (5, 'Máy quay phim');
INSERT INTO `categories` VALUES (6, 'Phụ kiện');

-- ----------------------------
-- Table structure for nsx
-- ----------------------------
DROP TABLE IF EXISTS `nsx`;
CREATE TABLE `nsx`  (
  `IDNSX` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NameNSX` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDNSX`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nsx
-- ----------------------------
INSERT INTO `nsx` VALUES (1, 'Canon');
INSERT INTO `nsx` VALUES (2, 'Fujifilm ');
INSERT INTO `nsx` VALUES (3, 'Nikon');
INSERT INTO `nsx` VALUES (4, 'Sony');
INSERT INTO `nsx` VALUES (5, 'DJI');
INSERT INTO `nsx` VALUES (6, 'Khác');

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES (1, 1, 32, 1, 32990000, 32990000);
INSERT INTO `orderdetails` VALUES (2, 2, 21, 1, 77990000, 77990000);
INSERT INTO `orderdetails` VALUES (3, 2, 25, 1, 19990000, 19990000);
INSERT INTO `orderdetails` VALUES (4, 2, 26, 1, 20990000, 20990000);
INSERT INTO `orderdetails` VALUES (5, 2, 22, 3, 21990000, 65970000);
INSERT INTO `orderdetails` VALUES (6, 3, 21, 1, 77990000, 77990000);
INSERT INTO `orderdetails` VALUES (7, 3, 24, 1, 10990000, 10990000);
INSERT INTO `orderdetails` VALUES (8, 3, 25, 1, 19990000, 19990000);
INSERT INTO `orderdetails` VALUES (9, 3, 22, 2, 21990000, 43980000);
INSERT INTO `orderdetails` VALUES (10, 4, 39, 1, 49900000, 49900000);
INSERT INTO `orderdetails` VALUES (11, 5, 32, 5, 32990000, 164950000);
INSERT INTO `orderdetails` VALUES (12, 5, 36, 1, 9490000, 9490000);
INSERT INTO `orderdetails` VALUES (14, 5, 55, 1, 9990000, 9990000);
INSERT INTO `orderdetails` VALUES (15, 5, 51, 1, 29990000, 29990000);
INSERT INTO `orderdetails` VALUES (16, 5, 38, 1, 5490000, 5490000);
INSERT INTO `orderdetails` VALUES (17, 5, 31, 1, 11490000, 11490000);
INSERT INTO `orderdetails` VALUES (18, 5, 35, 1, 5490000, 5490000);
INSERT INTO `orderdetails` VALUES (19, 5, 36, 1, 9490000, 9490000);
INSERT INTO `orderdetails` VALUES (20, 5, 33, 1, 41490000, 41490000);
INSERT INTO `orderdetails` VALUES (21, 6, 52, 1, 10790000, 10790000);
INSERT INTO `orderdetails` VALUES (22, 6, 56, 1, 7490000, 7490000);
INSERT INTO `orderdetails` VALUES (23, 6, 44, 1, 8990000, 8990000);
INSERT INTO `orderdetails` VALUES (24, 7, 21, 1, 77990000, 77990000);
INSERT INTO `orderdetails` VALUES (25, 7, 25, 1, 19990000, 19990000);
INSERT INTO `orderdetails` VALUES (26, 7, 23, 1, 150000000, 150000000);
INSERT INTO `orderdetails` VALUES (27, 7, 26, 1, 20990000, 20990000);
INSERT INTO `orderdetails` VALUES (28, 8, 1, 3, 79000000, 237000000);
INSERT INTO `orderdetails` VALUES (29, 9, 1, 1, 79000000, 79000000);
INSERT INTO `orderdetails` VALUES (30, 10, 32, 1, 32990000, 32990000);
INSERT INTO `orderdetails` VALUES (31, 11, 1, 3, 79000000, 237000000);
INSERT INTO `orderdetails` VALUES (32, 12, 31, 1, 11490000, 11490000);
INSERT INTO `orderdetails` VALUES (33, 12, 33, 1, 41490000, 41490000);
INSERT INTO `orderdetails` VALUES (34, 13, 34, 1, 11590000, 11590000);
INSERT INTO `orderdetails` VALUES (35, 13, 32, 2, 32990000, 65980000);
INSERT INTO `orderdetails` VALUES (36, 13, 1, 1, 79000000, 79000000);
INSERT INTO `orderdetails` VALUES (37, 14, 1, 1, 79000000, 79000000);
INSERT INTO `orderdetails` VALUES (38, 15, 54, 1, 2190000, 2190000);
INSERT INTO `orderdetails` VALUES (39, 16, 54, 8, 2190000, 17520000);
INSERT INTO `orderdetails` VALUES (40, 17, 3, 5, 121990000, 609950000);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime(0) NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL,
  `TrangThai` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`OrderID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2017-12-21 19:55:37', 1, 32990000, 'Đã giao');
INSERT INTO `orders` VALUES (2, '2017-12-21 19:55:54', 1, 184940000, 'Chưa giao');
INSERT INTO `orders` VALUES (3, '2017-12-21 19:56:21', 1, 152950000, 'Đang giao');
INSERT INTO `orders` VALUES (4, '2017-12-21 19:57:50', 1, 49900000, 'Đang giao');
INSERT INTO `orders` VALUES (5, '2017-12-21 22:15:16', 1, 196430000, 'Đang giao');
INSERT INTO `orders` VALUES (6, '2017-12-24 14:53:03', 3, 27270000, 'Đã giao');
INSERT INTO `orders` VALUES (7, '2017-12-25 15:54:58', 3, 268970000, 'Chưa giao');
INSERT INTO `orders` VALUES (8, '2017-12-26 13:31:29', 3, 237000000, 'Đã giao');
INSERT INTO `orders` VALUES (9, '2017-12-26 13:32:20', 3, 79000000, 'Đã giao');
INSERT INTO `orders` VALUES (10, '2017-12-26 13:32:38', 3, 32990000, 'Chưa giao');
INSERT INTO `orders` VALUES (11, '2017-12-26 13:33:23', 3, 237000000, 'Đã giao');
INSERT INTO `orders` VALUES (12, '2017-12-26 13:34:50', 3, 52980000, 'Chưa giao');
INSERT INTO `orders` VALUES (13, '2017-12-26 13:35:41', 3, 156570000, 'Đang giao');
INSERT INTO `orders` VALUES (14, '2017-12-26 13:36:29', 3, 79000000, 'Đang giao');
INSERT INTO `orders` VALUES (15, '2017-12-27 10:21:56', 14, 2190000, 'Chưa giao');
INSERT INTO `orders` VALUES (16, '2017-12-27 10:34:09', 14, 17520000, 'Đang giao');
INSERT INTO `orders` VALUES (17, '2018-01-08 20:59:49', 3, 609950000, 'Chưa giao');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FullDes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `Price` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `IDNSX` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `SLB` int(11) NOT NULL,
  `LX` int(11) NOT NULL,
  `XX` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SLAnh` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProID`) USING BTREE,
  INDEX `CAT`(`CatID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Nikon D850', 'Bảo hành 12 tháng chính hãng', '<p>- Bộ cảm biến CMOS FX-Format BMP 45.7MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh EXPEED 5<br />- M&agrave;n h&igrave;nh cảm ứng LCD 3.2 \"2.36m-Dot<br />- Ghi h&igrave;nh Video 4K UHD ở tốc độ 30 khung h&igrave;nh / gi&acirc;y<br />- Hệ thống AFF 153 điểm đa điểm CAM 20K<br />- ISO: 64-25600, mở rộng: 32-102400<br />- 7 khung h&igrave;nh / gi&acirc;y cho 51 khung h&igrave;nh với AE / AF<br />- Video khuynh đảo 8K, Chế độ Digitizer<br />- Bộ cảm biến RGB 180k Pixel<br />- SnapBridge Bluetooth v&agrave; Wi-Fi<br />- Video slideshow HD fullfone 120fps<br />- Khe SD sẽ hỗ trợ UHS-II<br />- Cải tiến m&agrave;n h&igrave;nh c&oacute; cả m&agrave;n h&igrave;nh LiveView<br />- Cải tiến chế độ chụp im lặng<br />- Cải thiện tuổi thọ pin</p>', 79000000, 1, 3, 11, 7, 3478, 'Nhật Bản', '6');
INSERT INTO `products` VALUES (3, 'Nikon D5', 'Bảo hành 12 tháng chính hãng', '<p>- Cảm biến CMOS FX-Format 20.8MP<br />- Bộ xử l&yacute; Expeed 5<br />- M&agrave;n h&igrave;nh cảm ứng LCD 3.2\" 2.36m-Dot<br />- Quay video 4K UHD tại 30fps<br />- ISO 102.400 mở rộng 3.280.000<br />- Tốc độ chụp h&igrave;nh li&ecirc;n tiếp 12fps</p>', 121990000, 1, 3, 1, 9, 1256, 'Nhật Bản', '6');
INSERT INTO `products` VALUES (4, 'Canon EOS 1D X Mark II', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến Full Fram CMOS 20.2MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh Dual DIGIC 6+<br />- M&agrave;n h&igrave;nh cảm ứng LCD 3.2\" 1.62m-Dot<br />- Quay video DCI 4K với 60fps, 8.8MP Still Grab<br />- 61-Point High Density Reticular AF II<br />- ISO ti&ecirc;u chuẩn 51.200, mở rộng ISO 409.600<br />- Tốc độ chụp 14fps, 16fps với chế độ Live View<br />- Dual Pixel CMOS AF and Movie Servo AF<br />- T&iacute;ch hợp GPS, CFast v&agrave; khe cắm CF Card</p>', 118500000, 1, 1, 8, 5, 72, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (5, 'Canon EOS 5D Mark IV', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến CMOS Full-Frame 30.4MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh DIGIC 6+<br />- M&agrave;n h&igrave;nh cảm ứng LCD 3.2\" 1.62,-Dot<br />- Quay video 4K tại 30fps, cắt ảnh tĩnh từ video 8.8MP<br />- Số điểm n&eacute;t AF: 61 điểm với điểm lấy n&eacute;t 41 cross-points<br />- ISO: 100-32.000, mở rộng 50-102.000<br />- Dual Pixel Raw, lựa chọn v&ugrave;ng lấy n&eacute;t AF chỉ với 1 n&uacute;t<br />- T&iacute;ch hợp kết nối Wifi, NFC v&agrave; GPS<br />- Tốc độ chụp li&ecirc;n tiếp 7fps, khe cắm thẻ CF, SD</p>', 73990000, 1, 1, 11, 3, 218, 'Nhật Bản', '6');
INSERT INTO `products` VALUES (6, 'Sony Alpha a7S II', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến Full-Frame với 12.2 MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh BIONZ X<br />- Quay phim ở 4K v&agrave; ful HD 1080<br />- S-Log3 Gamma v&agrave; Hiển thị Hỗ trợ chức năng<br />- Độ nghi&ecirc;ng m&agrave;n h&igrave;nh ở 3,0 \"1.228.800-Dot<br />- Tốc độ chụp li&ecirc;n tục l&ecirc;n đến 5 fps v&agrave; ISO 409.600<br />- Lấy n&eacute;t nhanh với 169 điểm<br />- C&oacute; chức năng Wi-Fi v&agrave; NFC</p>', 60000000, 1, 4, 11, 1, 9496, 'Nhật Bản', '4');
INSERT INTO `products` VALUES (7, 'Fujifilm X-T2 Graphite Silver ', 'Bảo hành 24 tháng chính hãng', '<p>- Phi&ecirc;n bản mới: m&agrave;u bạc - Graphite Silver Edition<br />- Cảm biến CMOS III APS-C X-Trans 24.3MP<br />- Bộ cảm biến h&igrave;nh ảnh X Processor Pro<br />- K&iacute;nh ngắm OLED 0.77x 2.36m-Dot<br />- M&agrave;n h&igrave;nh LCD 3\" 1.04m-Dot 3-Way<br />- Quay phim UHD 4K v&agrave; F-Log Gamma<br />- Kết nối Wifi<br />- Hệ thống lấy n&eacute;t tự động 325 điểm<br />- ISO 51200<br />- Tốc độ chụp li&ecirc;n tiếp 8fps<br />- Thiết kế chống chịu thời tiết<br />- Hai khe cắm UHS-II SD</p>', 39990000, 1, 2, 12, 3, 9493, 'Nhật Bản', '2');
INSERT INTO `products` VALUES (8, 'Sony Alpha A7 Mark II', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến CMOS Exmor 24.3MP Full Khung h&igrave;nh<br />- Bộ xử l&yacute; h&igrave;nh ảnh BIONZ X<br />- Khả năng tương th&iacute;ch trực tiếp với Ống k&iacute;nh E-mount<br />- LCD 3.0 \"tiltable TFT với 1,228 triệu điểm ảnh<br />- K&iacute;nh ngắm điện tử OLED 2.4m-Dot<br />- Quay phim: XAVC S 50 Mbps, AVCHD 2.0 28 Mbps, 1.920 x 1.080 pixel<br />- Chụp li&ecirc;n tiếp: 2,5 h&igrave;nh/gi&acirc;y đến 5 h&igrave;nh/gi&acirc;y<br />- T&iacute;ch hợp Wi-Fi v&agrave; c&ocirc;ng nghệ NFC<br />- Đa giao diện v&agrave; Flash gắn trong<br />- Giao diện truy cập trực tiếp</p>', 31990000, 1, 4, 13, 11, 16, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (9, 'Fujifilm X100FPlus', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến 24.3MP APS-C X-Trans CMOS III<br />- Xử l&yacute; h&igrave;nh ảnh: X-Processor Pro<br />- Fujinon 23mm f/2 Lens<br />- K&iacute;nh ngắm lai quang học v&agrave; điện tử<br />- M&agrave;n h&igrave;nh LCD 3.0\" 1.04m-Dot<br />- Quya video Full HD 1080p / 60 fps<br />- 49 điểm lấy n&eacute;t theo pha trong 91-Point AF<br />- Độ nhạy s&aacute;ng mở rộng: ISO 51200<br />- Chụp ảnh li&ecirc;n tục to 8 fps<br />- T&iacute;ch hợp ISO Dial v&agrave; đ&ograve;n bẫy lấy n&eacute;t ph&iacute;a sau</p>', 31990000, 1, 2, 11, 5, 80, 'Nhật Bản', '3');
INSERT INTO `products` VALUES (10, 'Nikon D5300', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến CMOS DX-Format 24.2MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh EXPEED 4<br />- M&agrave;n h&igrave;nh LCD Vari-Angle 3.2\" 1037k<br />- Quay phim Full HD tại 60fps<br />- Cảm biến lấy n&eacute;t AF 39 điểm Multi Cam 4800DX<br />- ISO 12800, mở rộng ISO 25600<br />- Tốc độ chụp li&ecirc;n tục 5fps<br />- T&iacute;ch hợp WIFI v&agrave; kết nối GPS</p>', 11990000, 1, 3, 22, 9, 24, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (11, 'Sony DSC WX100', 'Bảo hành 24 tháng chính hãng', '<p>M&agrave;n h&igrave;nh 2.7inch<br />Độ ph&acirc;n giải 18.2MP<br />Zoom quang 10x<br />Cảm biến 18.2MP<br />Tự động lấy n&eacute;t nhanh với High-speed Auto Focus<br />Zoom h&igrave;nh ảnh r&otilde; n&eacute;t 20x<br />9 chế độ hiệu ứng h&igrave;nh ảnh<br />Quay phim Full HD với ổn định h&igrave;nh ảnh quang học<br />Loại Cảm biến Exmor R CMOS<br />K&iacute;ch cỡ 1/2.3 (7.76mm)<br />Điểm ảnh tổng 18.9 Mega Pixels<br />Điểm ảnh thật 18.2 Mega Pixels</p>', 1495000, 2, 4, 25, 4, 489, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (12, 'Canon IXUS 185', 'Bảo hành 24 tháng chính hãng', '<p>- Ống k&iacute;nh 20 megapixel<br />- Zoom quang học 8x (28 224) / ZoomPlus 16x<br />- Bộ xử l&yacute; h&igrave;nh ảnh h&igrave;nh ảnh DIGIC 4+<br />- Ổn định h&igrave;nh ảnh kỹ thuật số IS<br />- ISO 100 &ndash; ISO800<br />- Quay video 1280 x 720</p>', 2350000, 2, 1, 6, 6, 14, 'Nhật Bản', '4');
INSERT INTO `products` VALUES (13, 'Fujifilm instax mini 9', 'Bảo hành 12 tháng chính hãng', '<p>- In ảnh tức th&igrave;<br />- K&iacute;nh ngắm quang học với Target Spot<br />- T&iacute;ch hợp gương tự sướng tr&ecirc;n ống k&iacute;nh<br />- T&iacute;ch hợp đ&egrave;n flash v&agrave; chế độ Auto Expose Mode<br />- Điều chỉnh độ s&aacute;ng bằng tay<br />- Chế độ Hi-Key<br />- Ống k&iacute;nh Fujinon 60mm F/12.7</p>', 1990000, 2, 2, 12, 3, 228, 'Nhật Bản', '2');
INSERT INTO `products` VALUES (14, 'Canon IXUS 190', 'Bảo hành 24 tháng chính hãng', '<p>- Bộ xử l&yacute; h&igrave;nh ảnh DIGIC 4+<br />- 20 megapixel<br />- Zoom quang học 10x (24 - 240 mm)<br />- ZoomPlus 20x<br />- ISO 100 &ndash; ISO800<br />- Kết nối Wi-Fi &amp; NFC</p>', 3850000, 2, 1, 6, 2, 14, 'Nhật Bản', '2');
INSERT INTO `products` VALUES (15, 'Fujifilm X100F', 'Bảo hành 12 tháng chính hãng', '<p>- Cảm biến 24.3MP APS-C X-Trans CMOS III<br />- Xử l&yacute; h&igrave;nh ảnh: X-Processor Pro<br />- Fujinon 23mm f/2 Lens<br />- K&iacute;nh ngắm lai quang học v&agrave; điện tử<br />- M&agrave;n h&igrave;nh LCD 3.0\" 1.04m-Dot<br />- Quya video Full HD 1080p / 60 fps<br />- 49 điểm lấy n&eacute;t theo pha trong 91-Point AF<br />- Độ nhạy s&aacute;ng mở rộng: ISO 51200<br />- Chụp ảnh li&ecirc;n tục to 8 fps<br />- T&iacute;ch hợp ISO Dial v&agrave; đ&ograve;n bẫy lấy n&eacute;t ph&iacute;a sau<br />- Phi&ecirc;n bản m&agrave;u đen</p>', 29990000, 2, 2, 3, 1, 137, 'Nhật Bản', '3');
INSERT INTO `products` VALUES (16, 'Nikon Coolpix S3700', 'Bảo hành 12 tháng chính hãng', '<p>- Cảm biến CCD 1/2.3\" 20.1MP<br />- Ống k&iacute;nh khẩu độ f/3.7-6.6<br />- Ti&ecirc;u cự 25-200mm (tr&ecirc;n định dạng 35mm)<br />- Zoom quang học 8x (16x Dynamic Fine Zoom)<br />- M&agrave;n h&igrave;nh LCD 2.7\" 230k-Dot<br />- Quay phim HD 720p<br />- C&oacute; đến16 bối cảnh chụp<br />- Kết nối Wi-Fi v&agrave; NFC<br />- Chụp ảnh li&ecirc;n tục 1.1 fps<br />- ISO 80&ndash;1600, ISO 3200 (khả dụng khi sử dụng Chế độ tự động)<br />- C&oacute; 6 t&ugrave;y chọn m&agrave;u: hồng, đỏ, bạc, đen, xanh c&oacute; họa tiết, xanh</p>', 3000000, 2, 3, 7, 15, 1655, 'Nhật Bản', '1');
INSERT INTO `products` VALUES (17, 'Nikon Coolpix L840', 'Bảo hành 12 tháng chính hãng', '<p>- Cảm biến h&igrave;nh ảnh CMOS 16MP<br />- Ti&ecirc;u cự tương đương 22.5-855mm ( định dạng 35mm)<br />- M&agrave;n h&igrave;nh LCD 3\" với 921K Dot<br />- Quay video Full HD 1080p 30fps<br />- T&iacute;ch hợp kết nối Wifi v&agrave; NFC<br />- Chức năng zoom Dynamic Fine 76x<br />- ISO 6400 v&agrave; tốc độ chụp 7.4fps<br />- Chế độ Scene Auto Selector</p>', 5000000, 2, 3, 12, 6, 258, 'Nhật Bản', '2');
INSERT INTO `products` VALUES (18, 'Sony Cyber-Shot DSC-W830 ', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến 20.1MP 1/2.3\" Super HAD CCD<br />- Ống k&iacute;nh Zeiss Vario ti&ecirc;u cự 25-200mm (tương đương tr&ecirc;n định dạng 35mm)<br />- M&agrave;n h&igrave;nh LCD: 2.7\" 230k-Dot<br />- Quay video HD 1280 x 720/30 fps<br />- Bộ xử l&yacute; h&igrave;nh ảnh BIONZ<br />- Hệ thống ổn định h&igrave;nh ảnh quang học<br />- ISO 80-3200<br />- G&oacute;c Chụp 3600<br />- Khe cắm thẻ MS Duo v&agrave; SD<br />- Cổng USB 2.0, Composite HD</p>', 2590000, 2, 4, 1, 1, 570, 'Nhật Bản', '3');
INSERT INTO `products` VALUES (19, 'Sony A6000', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến 24.3MP APS-C Exmor APS HD CMOS<br />- Bộ xử l&yacute; ảnh BIONZ X<br />- K&iacute;nh ngắm OLED EVF Tru-Finder 0.39\" 1,440k-Dot<br />- M&agrave;n h&igrave;nh LCD: 3.0\" 921k-Dot<br />- Quay video Full HD 1080p XAVC S / 24/60 fps<br />- Kết nối Wi-Fi v&agrave; NFC<br />- Fast Hybrid AF &amp; 179 điểm lấy n&eacute;t theo pha<br />- Chụp ảnh li&ecirc;n tục 11 fps v&agrave; ISO 25600</p>', 11990000, 2, 4, 4, 4, 235, 'Nhật Bản', '2');
INSERT INTO `products` VALUES (20, 'Canon PowerShot G7 X II', 'Bảo hành 24 thánh chính hãng', '<p>- Cảm biến 1 inch CMOS 20MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh DIGIC7<br />- Ống k&iacute;nh : 24-100mm f/1.8-2.8 v&agrave; hệ thống chống rung (IS), 9 l&aacute; khẩu<br />- Tốc độ chụp li&ecirc;n tục 8 fps<br />- M&agrave;n h&igrave;nh LCD 3&Prime; 1.04 triệu điểm ảnh (tilt 180&deg; up, 45&deg; down)<br />- Quay video Full HD<br />- Time-lapse movie<br />- Hỗ trợ kết nối Wi-FI, NFC</p>', 14490000, 2, 1, 4, 3, 569, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (21, 'Sony Alpha a7R III', 'Bảo hành 24 tháng chính hãng', '<p>ISO 102400<br />Bộ xử l&yacute; h&igrave;nh ảnh BIONZ X &amp; LSI<br />Hệ thống lấy n&eacute;t 399 điểm<br />Chụp li&ecirc;n tục 10 khung h&igrave;nh/gi&acirc;y<br />Bộ cảm biến CMOS BSI CMOS 42MP Full-Frame Exmor R<br />Video UHD 4K30p với HLG &amp; S-Log3 Gammas<br />3,9m-Dot Tru-Finder OLED EVF<br />M&agrave;n h&igrave;nh cảm ứng LCD 3.0 \"1.44 triệu điểm ảnh<br />Chống rung 5 trục (5-Axis)<br />Pixel Shift Multi Shooting<br />T&iacute;ch hợp Wi-Fi / Bluetooth, khe SD đ&ocirc;i<br />USB 3.0 cổng loại-C &amp; thiết bị đầu cuối đồng bộ h&oacute;a PC</p>', 77990000, 3, 4, 2, 2, 13, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (22, 'Fujifilm X-E3 Body Sliver', 'Bảo hành 12 tháng chính hãng', '<p>- Cảm biến 24.3MP APS-C X-Trans CMOS III<br />- Bộ xử l&yacute; h&igrave;nh ảnh X-Processor Pro<br />- M&agrave;n h&igrave;nh cảm ứng TFT LCD 3\" 1.04 triệu điểm ảnh<br />- Ống ngắm điện tử OLED k&iacute;ch thước 0.77\" 2,36MP<br />- ISO 51200, tốc độ chụp 8fps<br />- Khả năng quay video 4K UHD<br />- Khả năng kết nối wifi<br />- Hệ thống lấy n&eacute;t AF 325 điểm<br />- Body kh&aacute;ng nước, bụi bẩn<br />- Tương th&iacute;ch thẻ nhớ SD, SHHC, SDXC, UHS-II</p>', 21990000, 3, 2, 4, 1, 812, 'Nhật Bản', '1');
INSERT INTO `products` VALUES (23, 'Fujifilm GFX 50S', 'Bảo hành 12 tháng chính hãng', '<p>- M&aacute;y ảnh Medium Format thuộc d&ograve;ng kh&ocirc;ng gương lật<br />- Cảm biến CMOS 51.4MP 43.8 x 32.9mm<br />- Bộ xử l&yacute; h&igrave;nh ảnh X-Processor Pro<br />- K&iacute;nh ngắm điện tử OLED EVF 3.69m-Dot, c&oacute; thể th&aacute;o rời<br />- M&agrave;n h&igrave;nh cảm ứng LCD 3.2\" 2.36m-Dot<br />- 117-Point Contrast-Detection AF System<br />- Độ nhạy s&aacute;ng mở rộng ISO 50-102400,<br />- Chụp ảnh li&ecirc;n tục 3 fps<br />- Quay video Full HD 1080p/30 fps<br />- Thiết kế chống chịu thời tiết khắc nghiệt</p>', 150000000, 3, 2, 1, 4, 5683, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (24, 'Sony A6700', 'Bảo hành 24 thánh chính hãng', '<p>- Cảm biến 24.3MP APS-C Exmor APS HD CMOS<br />- Bộ xử l&yacute; ảnh BIONZ X<br />- K&iacute;nh ngắm OLED EVF Tru-Finder 0.39\" 1,440k-Dot<br />- M&agrave;n h&igrave;nh LCD: 3.0\" 921k-Dot<br />- Quay video Full HD 1080p XAVC S / 24/60 fps<br />- Kết nối Wi-Fi v&agrave; NFC<br />- Fast Hybrid AF &amp; 179 điểm lấy n&eacute;t theo pha<br />- Chụp ảnh li&ecirc;n tục 11 fps v&agrave; ISO 25600</p>', 10990000, 3, 4, 8, 5, 427, 'Nhật Bản', '6');
INSERT INTO `products` VALUES (25, 'Sony Alpha A6300', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến CMOS APS-C 24MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh BIONZ X<br />- Hệ thống lấy n&eacute;t AF 425 điểm theo pha<br />- Chụp li&ecirc;n tiếp 11fps (8fps ở chế độ live-view)<br />- C&oacute; chế độ chụp y&ecirc;n lặng (Silent shooting như A7RII)<br />- Dải nhạy s&aacute;ng ISO 100 - 51200<br />- Quay video 4K l&ecirc;n tới 100Mbps, S-Log3 Gamma<br />- LCD 3.0\" 921.6K</p>', 19990000, 3, 4, 2, 6, 131, 'Nhật Bản', '2');
INSERT INTO `products` VALUES (26, 'Canon EOS M5', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến CMOS APS-C 24.2MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh DIGIC 7<br />- M&agrave;n h&igrave;nh cảm ứng LCD 3.2\" 1.62m-Dot<br />- Quay phim Full HD 1080p tại 60fps<br />- T&iacute;ch hợp kết nối Wifi v&agrave; NFC, Bluetooth Smart<br />- Dual Pixel CMOS AF<br />- Tốc độ chụp li&ecirc;n tiếp 9fps v&agrave; ISO 25600<br />- Hệ thống chống rung 5 trục IS<br />- Ống k&iacute;nh EF-M 18-150mm F/3.5-6.3 IS STM</p>', 20990000, 3, 1, 1, 8, 568, 'Nhật Bản', '4');
INSERT INTO `products` VALUES (27, 'Canon EOS M3', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến CMOS APS-C 24.2MP<br />- Cảm biến h&igrave;nh ảnh DIGIC 6<br />- M&agrave;n h&igrave;nh cảm ứng LCD 3.0\" 1.040k-Dot<br />- Quay phim Full HD 1080p tại 24/24/30fps<br />- T&iacute;ch hợp kết nối NFC v&agrave; Wifi<br />- C&ocirc;ng nghệ lấy n&eacute;t Hybrid CMOS AF với 49 điểm<br />- ISO 100-12800, mở rộng 25600<br />- Ống k&iacute;nh EF-M 15-45mm F/3.5-6.3 IS STM</p>', 9990000, 3, 1, 16, 5, 798, 'Nhật Bản', '4');
INSERT INTO `products` VALUES (28, 'Canon EOS M10', 'Bảo hành 12 tháng chính hãng', '<p>- Cảm biến CMOS APS-C 18MP<br />- Bộ xử l&yacute; h&igrave;nh ảnh DIGIC 6<br />- M&agrave;n h&igrave;nh cảm ứng LCD 3.0\" 1.04m-Dot<br />- Kết nối Wifi, NFC<br />- Hệ thống lấy n&eacute;t Hybrid CMOS AF 49 điểm<br />- Tốc độ chụp li&ecirc;n tiếp 4.6fps v&agrave;<br />- ISO 100-12800, c&oacute; thể mở rộng 25600<br />- Creative Assist v&agrave; chế độ Self Portrait<br />- Ống k&iacute;nh EF-M 15-45mm F/3.5-6.3 IS STM<br />- Sản phẩm c&oacute; hai m&agrave;u: trắng, đen</p>', 7990000, 3, 1, 24, 4, 980, 'Nhật Bản', '4');
INSERT INTO `products` VALUES (29, 'Nikon Coolpix A900', 'Bảo hành 12 tháng chính hãng', '<p>- Cảm biến CMOS BSI 20MP<br />- Ti&ecirc;u cự tương đương 24-840mm theo định dạng 35mm<br />- Zoom quang học 35x, Dynamic Zoom 70x<br />- M&agrave;n h&igrave;nh LCD 3 inch 921K-Dot<br />- Quay video UHD 4K/30fps<br />- Kết nối Bluetooth, Wifi, NFC<br />- ISO 3200, tốc độ chụp li&ecirc;n tục 7fps<br />- Ống k&iacute;nh Nikon F/3.4- 6.9 ED</p>', 10990000, 3, 3, 2, 5, 4569, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (30, 'Canon EOS M6', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến CMOS 24.2 MPs<br />- Bộ xử l&yacute; h&igrave;nh ảnh Canon DIGIC 6<br />- ISO đến 25,600<br />- Chụp li&ecirc;n tiếp tới 7 h&igrave;nh/gi&acirc;y<br />- Trang bị hệ thống lấy n&eacute;t tự động Dual Pixel CMOS AF<br />- AF points: 49 điểm<br />- Tốc độ m&agrave;n trập: 1 / 4,000 to 30 seconds, bulb, flash sync 1/200 sec<br />- T&iacute;ch hợp đ&egrave;n flash trong, Ống ngắm EVF-DC1 c&oacute; thể th&aacute;o rời<br />- Quay phim full HD, HD, VGA<br />- Kết nối Wifi, NFC, Bluetooth<br />- Tương th&iacute;ch hệ thống ống k&iacute;nh EF-M, EF-S, EF của Canon<br />- M&agrave;n h&igrave;nh lật xoay 3.2\" cảm ứng 1.040.000 pixels<br />- Ống kit: EF-M 15-45mm f/3.5-6.3 IS STM<br />- Phi&ecirc;n bản m&agrave;u đen</p>', 14490000, 3, 1, 5, 12, 349, 'Nhật Bản', '3');
INSERT INTO `products` VALUES (31, 'GoPro Hero 6', 'Bảo hành 24 tháng chính hãng', '<p>Cảm biến 12 MP<br />Khả năng chống nước ở độ s&acirc;u l&ecirc;n tới 10 m&eacute;t<br />Quay video 4K ở tốc độ 60 khung h&igrave;nh/gi&acirc;y<br />Quay được video slow motion full HD 1080 240 fps<br />Chip xử l&yacute; mới với tốc độ cao<br />Sử dụng Wi Fi 5GHz<br />Tốc độ truyền tải dữ liệu sẽ nhanh hơn gấp 3 lần<br />Chụp ảnh 12MP với 2 định dạng l&agrave; JPG hoặc RAW<br />C&oacute; chế độ Wide Dynamic Range, chụp ảnh HDR</p>', 11490000, 4, 6, 11, 7, 249, 'Thương hiệu Mỹ xuất xứ Trung Quốc', '3');
INSERT INTO `products` VALUES (32, 'Máy bay DJI Mavic Pro Platinum More Combo', 'Bảo hành 24 tháng chính hãng', '<p>- Battery to power bank adaptor x1<br />- Battery charging HUB x1<br />- Car charger x1<br />- Intelligent flight Battery x2<br />- Folding propellers x2<br />- Quay phim: 4K (30fps)<br />- C&ocirc;ng nghệ Truyền dẫn t&iacute;n hiệu OcuSync<br />- T&iacute;ch hợp ứng dụng DJI GO<br />- Chức năng FlightAutonomy ph&aacute;t hiện trở ngại<br />- Thời gian bay 27 ph&uacute;t<br />- Tốc độ 65 km / giờ ở chế độ thể thao</p>', 32990000, 4, 5, 0, 5, 365, 'Mỹ', '1');
INSERT INTO `products` VALUES (33, 'Máy bay DJI Phantom 4 PRO Plus', 'Bảo hành 24 tháng chính hãng', '<p>- Camera trang bị cảm biến ảnh CMOS 1inch 20MP hỗ trợ quay phim 4K<br />- Tốc độ cất / hạ cạnh: S mode 6m/s / 4m/s; P mode 5m/s / 3m/s<br />- Tốc độ bay: S mode 72km/s; A mode 58km/h; P mode 50km/h<br />- Bay cao so với mặt đất: 6000m<br />- T&iacute;ch hợp cảm biến hồng ngoại gi&uacute;p tr&aacute;nh vật cản trong phạm vi 7m<br />- Hệ thống bay tự động th&ocirc;ng minh Flight Autonomy<br />- Chế độ bay Tayfly tự động bay tới điểm đ&atilde; được x&aacute;c định v&agrave; tr&aacute;nh vật cản tr&ecirc;n đường đi<br />- Chế độ bay Draw bay theo đường vẽ tr&ecirc;n m&agrave;n h&igrave;nh v&agrave; vẫn giữ độ cao<br />- Chế độ nhận diện cử chỉ Gestune Mode gi&uacute;p bạn điều khiển m&aacute;y bay chụp h&igrave;nh th&ocirc;ng qua cử chỉ ng&oacute;n tay<br />- Phi&ecirc;n bản k&egrave;m Remote Lightbridge c&oacute; m&agrave;n h&igrave;nh theo d&otilde;i, chất lượng truyền t&iacute;n hiệu tốt</p>', 41490000, 4, 5, 1, 3, 36, 'Mỹ', '5');
INSERT INTO `products` VALUES (34, 'Máy bay điều khiển DJI Spark Alpine White', 'Bảo hành 24 tháng chính hãng', '<p>- Camera trang bị cảm biến ảnh CMOS 1inch 20MP hỗ trợ quay phim 4K<br />- Tốc độ cất / hạ cạnh: S mode 6m/s / 4m/s; P mode 5m/s / 3m/s<br />- Tốc độ bay: S mode 72km/s; A mode 58km/h; P mode 50km/h<br />- Bay cao so với mặt đất: 6000m<br />- T&iacute;ch hợp cảm biến hồng ngoại gi&uacute;p tr&aacute;nh vật cản trong phạm vi 7m<br />- Hệ thống bay tự động th&ocirc;ng minh Flight Autonomy<br />- Chế độ bay Tayfly tự động bay tới điểm đ&atilde; được x&aacute;c định v&agrave; tr&aacute;nh vật cản tr&ecirc;n đường đi<br />- Chế độ bay Draw bay theo đường vẽ tr&ecirc;n m&agrave;n h&igrave;nh v&agrave; vẫn giữ độ cao<br />- Chế độ nhận diện cử chỉ Gestune Mode gi&uacute;p bạn điều khiển m&aacute;y bay chụp h&igrave;nh th&ocirc;ng qua cử chỉ ng&oacute;n tay<br />- Phi&ecirc;n bản k&egrave;m Remote Lightbridge c&oacute; m&agrave;n h&igrave;nh theo d&otilde;i, chất lượng truyền t&iacute;n hiệu tốt</p>', 11590000, 4, 5, 7, 5, 735, 'Mỹ', '4');
INSERT INTO `products` VALUES (35, 'Camera hành trình Ricoh - WG-M1', 'Bảo hành 12 tháng chính hãng', '<p>- Hỗ trợ quay video 1080p30 &amp; 720p60<br />- Độ ph&acirc;n giải h&igrave;nh ảnh 14MP<br />- Ống k&iacute;nh g&oacute;c rộng<br />- Chống nước ở độ s&acirc;u 10m<br />- Chống sốc ở độ cao &lt;= 2m<br />- Hoạt động được ở thời tiết 14&deg;F<br />- Slow-Motion 120 fps<br />- Thiết kế chống bụi, dễ cầm nắm v&agrave; điều khiển<br />- Đầu ra: Micro HDMI<br />- C&oacute; kết nối Wi-Fi<br />- Bao gồm Flat Adhesive Mount</p>', 5490000, 4, 6, 10, 5, 349, 'Mỹ', '1');
INSERT INTO `products` VALUES (36, 'Action Cam Sony HDR- AS300R', 'Bảo hành 24 tháng chính hãng', '<p>-M&aacute;y quay h&agrave;nh động Full HD<br />-Định dạng ghi h&igrave;nh: XAVC S (HD), MP4<br />-G&oacute;c quay Wide/Medium/Narrow, ống k&iacute;nh Carl Zeiss Tessar F2.8<br />-Ổn định h&igrave;nh ảnh: Balanced Optical SteadyShot with Active mode<br />-Cảm biến: 1/2.5 type (7.20 mm) back-illuminated \"Exmor R\" CMOS Sensor<br />- Bộ xử l&yacute; ảnh BIONZ X<br />-Độ ph&acirc;n giải hiệu dụng quay phim v&agrave; chụp h&igrave;nh 8.2MP<br />-&Acirc;m thanh: stereo 2 k&ecirc;nh<br />-Kết nối với điện thoại th&ocirc;ng minh qua WiFi hoặc NFC<br />-GPS: C&oacute;<br />-T&iacute;nh năng kh&aacute;c: Loop Recording, Motion Shot LE, Burst Shooting, 4K Time-lapse capture, Live Streaming<br />-Th&acirc;n máy chống nước chuẩn IPX4</p>', 9490000, 4, 4, 12, 6, 4790, 'Nhật Bản', '5');
INSERT INTO `products` VALUES (37, 'GoPro Hero 5', 'Bảo hành 24 tháng chính hãng', '<p>- Hỗ trợ quay Video 4K30, 2.7K60, 1080p120<br />- Chụp h&igrave;nh 12MP tại 30fps<br />- Ống k&iacute;nh si&ecirc;u rộng<br />- Chống thấm nước với độ s&acirc;u l&ecirc;n đến 10m<br />- Điều khiển bằng giọng n&oacute;i<br />- M&agrave;n h&igrave;nh cảm ứng<br />- Gi&aacute;m s&aacute;t v&agrave; điều khiển từ xa th&ocirc;ng qua kết nối Wifi<br />- Time Lapse</p>', 8690000, 4, 6, 7, 7, 4789, 'Thương hiệu Mỹ xuất xứ Trung Quốc', '5');
INSERT INTO `products` VALUES (38, 'Action Cam Sony HDR-AS50 Full HD', 'Bảo hành 24 tháng chính hãng', '<p>- M&aacute;y quay h&agrave;nh động Full HD 1920x1080 60p/50p<br />- G&oacute;c quay 170 độ, ống k&iacute;nh Carl Zeiss Tessar<br />- Chống rung Steady shot<br />- Cảm biến 1/2.3 type \"Exmor R\" CMOS<br />- Bộ xử l&yacute; ảnh BIONZ X<br />- Độ ph&acirc;n giải quay phim v&agrave; chụp h&igrave;nh 11.9 megapixel<br />- &Acirc;m thanh stereo 2 k&ecirc;nh<br />- Kết nối: WiFi, Bluetooth<br />- Chụp timelapse (1s/2s/5s/10s/30s/60s), Loop recording<br />- Trọng lượng: khoảng 83 g (bao gồm cả pin)<br />- K&iacute;ch thước: Khoảng 24,2 x 47,0 x 83,0 mm<br />- Pin tương th&iacute;ch NP-BX1<br />- Phụ kiện đi k&egrave;m: Pin, C&aacute;p USB, vỏ bọc chống nước 60m, Kh&oacute;a g&agrave;i, D&acirc;y đeo cổ tay, Bộ ng&agrave;m chuyển đổi v&agrave; Gi&aacute; gắn.</p>', 5490000, 4, 4, 2, 34, 577, 'Nhật Bản', '6');
INSERT INTO `products` VALUES (39, 'Máy quay phim 4K HDR FDR-AX700', 'Bảo hành 24 tháng chính hãng', '<p>- Quay chuy&ecirc;n nghiệp v&agrave; đa dạng</p>\r\n<p>- Phạm vi lấy n&eacute;t tự động rộng</p>\r\n<p>- Phản hồi lấy n&eacute;t tự động nhanh</p>\r\n<p>- Ghi video 4K HDR</p>\r\n<p>-Tự động lấy n&eacute;t theo pha 273 điểm</p>\r\n<p>- Ống k&iacute;nh Zeiss Vario Sonnar T &nbsp;</p>\r\n<p>-Ổn định h&igrave;nh ảnh SteadyShot</p>\r\n<p>-M&agrave;n h&igrave;nh LCD OLED EVF / 3,5 \"OLED EVRED 0,39\"</p>\r\n<p>-Tốc độ ghi 120 fps</p>\r\n<p>-S-Log v&agrave; S-Gamut Profile</p>', 49900000, 5, 6, 2, 2, 720, 'Mỹ', '5');
INSERT INTO `products` VALUES (40, 'Canon XA35', 'Bảo hành 24 tháng chính hãng', '<p>- Cảm biến: 1/2.84\" HD CMOS Pro<br />- 1920x1080 up to 59.94p<br />- Lens zoom quang học: 20x<br />- HD/SD-SDI Output<br />- Wide DR Gamma (600%) Mode<br />- Highlight Priority Mode<br />- OLED cảm ứng 3.5\" OLED &amp; EVF<br />- 2x XLR Audio Inputs<br />- Khe thẻ nhớ: Dual SD/SDHC/SDXC<br />- Kết nối Wi-Fi với FTP</p>', 50990000, 5, 1, 2, 1, 71, 'Nhật Bản', '1');
INSERT INTO `products` VALUES (41, 'Sony FDR- AX100', 'Bảo hành 24 tháng chính hãng', '<p>- Quay phim 4K Ultra HD tại 30fps<br />- Độ ph&acirc;n giải chụp ảnh tĩnh 20MP<br />- Cảm biến CMOS Exmor R 1\"<br />- Ống k&iacute;nh Zeiss Varo Sonnar T<br />- Zoom quang học 12x, mở rộng 24x<br />- C&ocirc;ng nghệ ổn định h&igrave;nh ảnh quang học Optical SteadyShot<br />- Ghi tốc độ cao 120fps<br />- Định dạng quay XAVC S, AVCHD, MP4<br />- Kết nối Wifi, NFC</p>', 44990000, 5, 4, 2, 3, 569, 'Nhật Bản', '4');
INSERT INTO `products` VALUES (42, 'Sony FDR-AXP55E', 'Bảo hành 24 tháng chính hãng', '<p>- Quay phim 4K Ultra HD 24/25p<br />- Độ ph&acirc;n giải ảnh tĩnh 16.6MP<br />- Bộ cảm biến CMOS Exmor R<br />- Ống k&iacute;nh Zeiss Vario Sonnar T ti&ecirc;u cự 26.8mm<br />- Zoom quang học 20x, mở rộng 40x<br />- C&ocirc;ng nghệ ổn định h&igrave;nh ảnh SteadyShot<br />- Ghi tốc độ cao 100fps<br />- T&iacute;ch hợp m&aacute;y chiếu<br />- Hỗ trợ kết nối Wifi, NFC</p>', 26990000, 5, 4, 1, 5, 457, 'Nhật Bản', '4');
INSERT INTO `products` VALUES (43, 'Sony HDR-CX900E', 'Bảo hành 12 tháng chính hãng', '<p>- Cảm biến CMOS Exmor R 1\"<br />- Quay video 1080p<br />- Độ ph&acirc;n giải h&igrave;nh ảnh tĩnh 20MP<br />- Quay định dạng: XAVC S, AVCHD v&agrave; MP4<br />- Ống k&iacute;nh Zeiss Varrio Sonnar T<br />- Ống k&iacute;nh zoom quang học 12x v&agrave; mở rộng 24x<br />- Bộ xử l&yacute; h&igrave;nh ảnh BIONZ X<br />- Chống rung quang học SteadyShot v&agrave; Quay video k&eacute;p<br />- Kết nối Wifi v&agrave; NFC</p>', 36990000, 5, 4, 1, 7, 236, 'Nhật Bản', '3');
INSERT INTO `products` VALUES (44, 'Sony HDR-PJ440E', 'Bảo hành 24 tháng chính hãng', '<p>- Quay video Full HD<br />- Độ ph&acirc;n giải ảnh tĩnh 9.2MP<br />- Cảm biến Exmor R CMOS<br />- Ống k&iacute;nh Zeiss zoom quang học 30x<br />- T&iacute;ch hợp m&aacute;y chiếu<br />- T&iacute;ch hợp Wifi/NFC</p>', 8990000, 5, 4, 8, 8, 126, 'Nhật Bản', '3');
INSERT INTO `products` VALUES (45, 'Sony FDR-AX40E', 'Bảo hành 24 tháng chính hãng', '<p>- Chất lượng h&igrave;nh ảnh 4K<br />- Cảm biến Exmor R CMOS mới cho chất lượng 4K<br />- Ống k&iacute;nh g&oacute;c rộng Zeiss Vario Sonnar T<br />- Chống rung quang học SteadyShot<br />- Lấy n&eacute;t tự động cực nhanh<br />- Chất lượng h&igrave;nh ảnh cao</p>', 22490000, 5, 4, 2, 4, 347, 'Nhật Bản', '4');
INSERT INTO `products` VALUES (46, 'Sony HDR-CX405E', 'Bảo hành 24 tháng chính hãng', '<p>- Quay Video Full HD<br />- Độ ph&acirc;n giải ảnh tĩnh: 9.2 MP<br />- Cảm biến CMOS Exmor R cho chất lượng h&igrave;nh ảnh tuyệt đẹp<br />- Bộ xử l&yacute; h&igrave;nh ảnh Bionz X<br />- Ống k&iacute;nh Zeiss zoom quang học 30x c&oacute; chất lượng ghi h&igrave;nh tuyệt vời<br />- Ổn định h&igrave;nh ảnh Optical SteadyShot hiệu chỉnh rung lắc để lu&ocirc;n ghi được h&igrave;nh ảnh mịn m&agrave;ng v&agrave; ổn định</p>', 5990000, 5, 4, 10, 3, 458, 'Nhật Bản', '3');
INSERT INTO `products` VALUES (48, 'Canon EF 35mm f/1.4L II USM', 'Bảo hành 24 tháng chính hãng', '<p>- Ống k&iacute;nh ng&agrave;m EF Mount d&ograve;ng L-Series/ Full-frame Format<br />- Khẩu độ: F/1.4-F/22<br />- C&ocirc;ng nghệ sản xuất thấu k&iacute;nh Blue Spectrum Refractive<br />- Gồm 2 thấu k&iacute;nh phi cầu v&agrave; 1 thấu k&iacute;nh UD<br />- Lớp tr&aacute;ng phủ Subwavelength v&agrave; Fluorine<br />- Động cơ lấy n&eacute;t Ultrasonic Autofocus<br />- Manual Focus Override Full-Time<br />- Cấu tr&uacute;c chống chịu thời tiết<br />- 9 l&aacute; khẩu tr&ograve;n</p>', 40990000, 6, 1, 1, 4, 986, 'Nhật Bản', '1');
INSERT INTO `products` VALUES (49, 'Canon EF 16-35mm f/2.8L III USM', 'Bảo hành 24 tháng chính hãng', '<p>- Thuộc d&ograve;ng ống k&iacute;nh L Series<br />- Ống k&iacute;nh EF-Mount / định dạng Full-Frame<br />- Khẩu độ: f/2.8 - 22<br />- Ba thấu k&iacute;nh phi cầu v&agrave; 2 thấu k&iacute;nh UD<br />- Lớp tr&aacute;ng phủ Subwavelength &amp; Air Sphere<br />- Động cơ lấy n&eacute;t USM AF<br />- Lấy n&eacute;t IF, Full-Time MF Override<br />- Lớp phủ Fluorine chống b&aacute;m bụi, dễ vệ sinh<br />- Cấu tr&uacute;c chống bụi, độ ẩm trong m&ocirc;i trường khắc nghiệt<br />- 9 l&aacute; khẩu tr&ograve;n<br />- C&acirc;n nặng: 790g<br />- Đường k&iacute;nh Filter: 82mm</p>', 50790000, 6, 1, 2, 6, 21, 'Nhật Bản', '1');
INSERT INTO `products` VALUES (50, 'Canon EF-S 18-55mm f/3.5-5.6 IS STM', 'Bảo hành 12 tháng chính hãng', '<p>- Ng&agrave;m EF-S<br />- Ti&ecirc;u cự tương đương 29-88mm ( định dnagj 35mm)<br />- Khẩu độ: F/3.5-5.6<br />- Bao gồm 1 thấu k&iacute;nh phi cầu<br />- Hệ thống ổn định h&igrave;nh ảnh quang học IS<br />- Stepping Motor v&agrave; Hệ thống lấy n&eacute;t trong<br />- Khoảng c&aacute;ch lấy n&eacute;t gần nhất 25cm<br />- Đường k&iacute;nh Filter 58mm</p>', 3190000, 6, 1, 8, 7, 261, 'Nhật Bản', '3');
INSERT INTO `products` VALUES (51, 'Nikon AF-S NIKKOR 200-500mm f/5.6E ED', 'Bảo hành 24 tháng chính hãng', '<p>Khẩu độ: F5.6<br />Ph&oacute;ng đại: 0,22x<br />Số lượng l&aacute; khẩu: 9<br />Khoảng c&aacute;ch lấy n&eacute;t gần nhất: 2.2m<br />K&iacute;ch thước bộ lọc: &oslash;95mm<br />Hood tương th&iacute;ch: HB-71<br />Trọng lượng: 2300g</p>', 29990000, 6, 3, 3, 8, 163, 'Nhật Bản', '1');
INSERT INTO `products` VALUES (52, 'Nikon AF-S 85mm f/1.8G', 'Bảo hành 24 tháng chính hãng', '<p>- Ng&agrave;m ống k&iacute;nh F Mount/ FX Format<br />- Khẩu độ: F/1.8-F/16<br />- Lớp tr&aacute;ng phủ Super Integrated Coating<br />- Động cơ lấy n&eacute;t si&ecirc;u &ecirc;m Silent Wave Motor<br />- Hệ thống căn n&eacute;t trong IF<br />- M/A Focus Mode<br />- Khoảng c&aacute;ch lấy n&eacute;t tối thiểu: 80cm<br />- Đường k&iacute;nh Filter 67mm<br />- 7 l&aacute; khẩu tr&ograve;n</p>', 10790000, 6, 3, 1, 6, 5167, 'Nhật Bản', '2');
INSERT INTO `products` VALUES (53, 'Nikon AF-S 24-70mm f/2.8E ED VR', 'Bảo hành 24 tháng chính hãng', '<p>- Ống k&iacute;nh ng&agrave;m F / định dạng FX<br />- Khẩu độ: f/2.8 - f/22<br />- Ti&ecirc;u cự: 24 - 70mm<br />- Bao gồm thấu k&iacute;nh: ASP/ED, AS, ED &amp; HRI<br />- Lớp tr&aacute;ng phủ Nano cho bề mặt ống k&iacute;nh<br />- Lớp phủ Fluorine cho thấu k&iacute;nh mặt trước v&agrave; sau<br />- Hệ thống lấy n&eacute;t si&ecirc;u thanh tự động AF<br />- Hệ thống ổn định h&igrave;nh ảnh VR<br />- Bao gồm 20 thấu k&iacute;nh xếp th&agrave;nh 16 nh&oacute;m<br />- C&oacute; 9 l&aacute; khẩu tr&ograve;n<br />- Đường k&iacute;nh Filter 82mm<br />- Trọng lượng: khoảng 1.1kg</p>', 44990000, 6, 3, 1, 2, 5195, 'Nhật Bản', '1');
INSERT INTO `products` VALUES (54, 'Nikon AF-S DX 18-55mm f/3.5-5.6 DX VR', 'Bảo hành 24 tháng chính hãng', '<p>- Ng&agrave;m ống k&iacute;nh F-Mount/ DX Format<br />- Ti&ecirc;u cự tương đương 27-82.5 ( định dạng 35mm)<br />- Khẩu độ: F/3.5-36<br />- Lớp tr&aacute;ng phủ Super Integrated Coating<br />- Động cơ lấy n&eacute;t si&ecirc;u &ecirc;m Silent Wave Motor AF<br />- Hệ thống ổn định h&igrave;nh ảnh Nikon VR II<br />- Thiết kế nhỏ gọn<br />- Khoảng c&aacute;ch lấy n&eacute;t tối thiểu 25cm<br />- Đường k&iacute;nh Filter 52mm<br />- 7 l&aacute; khẩu tr&ograve;n</p>', 2190000, 6, 3, 0, 10, 884, 'Nhật Bản', '1');
INSERT INTO `products` VALUES (55, 'Fujifilm XF 50mm f/2 R WR', 'Bảo hành 24 tháng chính hãng', '<p>- Loại ống k&iacute;nh: Ống k&iacute;nh prime<br />- Cảm biến tương th&iacute;ch: APS-C<br />- Ti&ecirc;u cự: 50mm (tương đương 76mm tr&ecirc;n cảm biến full-frame)<br />- Ng&agrave;m: Fujifilm X<br />- Khẩu độ: F2-F16<br />- Khoảng c&aacute;ch lấy n&eacute;t tối thiểu: 0.39m<br />- Độ ph&oacute;ng đại tối đa 0.15X<br />- Lấy n&eacute;t tự động: C&oacute; - Motor lấy n&eacute;t bước<br />- Trọng lượng: 200gr<br />- Đường k&iacute;nh filter: 46mm<br />- Chống được nước nhẹ, bụi bẩn v&agrave; hoạt động được -10&deg;C.</p>', 9990000, 6, 2, 8, 23, 811, 'Nhật Bản', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `f_ID` int(11) NOT NULL AUTO_INCREMENT,
  `f_Username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` date NULL DEFAULT NULL,
  `f_Permission` int(1) NOT NULL,
  PRIMARY KEY (`f_ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'sang', '202cb962ac59075b964b07152d234b70', 'Tuấn Sang', 'tuansang9715@gmail.com', '1997-11-30', 1);
INSERT INTO `users` VALUES (2, 'sangdeptrai', '4dd52a3e18a134efc7b9f5bb49b1a2fd', 'sangdeptrai', 'tuansang@gmail.com', NULL, 0);
INSERT INTO `users` VALUES (3, 'thanhchodien', 'caf1a3dfb505ffed0d024130f58c5cfa', 'ThànhDT', 'thanhchodien@gmail.com', NULL, 0);
INSERT INTO `users` VALUES (4, 'boycute', 'b59c67bf196a4758191e42f76670ceba', 'boycute', 'nhokshock@yahoo.com', NULL, 0);
INSERT INTO `users` VALUES (5, 'sangmini', '202cb962ac59075b964b07152d234b70', 'sangmini', 'minhsang@ngu.vl', NULL, 0);
INSERT INTO `users` VALUES (6, 'ád', '8898c2fbb18cf8419e8ef3bd141b8aff', 'ád', 'sad', NULL, 0);
INSERT INTO `users` VALUES (7, 'ád', '8898c2fbb18cf8419e8ef3bd141b8aff', 'ád', 'ád', NULL, 0);
INSERT INTO `users` VALUES (8, 'sang', 'f970e2767d0cfe75876ea857f92e319b', 'sang', 'sang', NULL, 0);
INSERT INTO `users` VALUES (9, 'as', 'f970e2767d0cfe75876ea857f92e319b', 'as', 'as', NULL, 0);
INSERT INTO `users` VALUES (10, 'as', 'f970e2767d0cfe75876ea857f92e319b', 'as', 'as', NULL, 0);
INSERT INTO `users` VALUES (11, 'as', 'f970e2767d0cfe75876ea857f92e319b', 'as', 'as', NULL, 0);
INSERT INTO `users` VALUES (12, 'sangminingu', '202cb962ac59075b964b07152d234b70', 'sangminingu', 'sang', NULL, 0);
INSERT INTO `users` VALUES (13, 'thanhdt', '202cb962ac59075b964b07152d234b70', 'Thành', 'thanhchodien@gmail.com', NULL, 0);
INSERT INTO `users` VALUES (14, 'sang97', '202cb962ac59075b964b07152d234b70', 'Trần Tuấn Sang', 'tuansang@gmail.com', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
