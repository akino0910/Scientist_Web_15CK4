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

 Date: 14/12/2017 17:31:41
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
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime(0) NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL,
  PRIMARY KEY (`OrderID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `IDNSX` int(11) NULL DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `SLB` int(11) NOT NULL,
  `LX` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ProID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Nikon D850', 'Bảo hành 12 tháng chính hãng', '- Bộ cảm biến CMOS FX-Format BMP 45.7MP\r\n- Bộ xử lý hình ảnh EXPEED 5\r\n- Màn hình cảm ứng LCD 3.2 \"2.36m-Dot\r\n- Ghi hình Video 4K UHD ở tốc độ 30 khung hình / giây\r\n- Hệ thống AFF 153 điểm đa điểm CAM 20K\r\n- ISO: 64-25600, mở rộng: 32-102400\r\n- 7 khung hình / giây cho 51 khung hình với AE / AF\r\n- Video khuynh đảo 8K, Chế độ Digitizer\r\n- Bộ cảm biến RGB 180k Pixel\r\n- SnapBridge Bluetooth và Wi-Fi\r\n- Video slideshow HD fullfone 120fps\r\n- Khe SD sẽ hỗ trợ UHS-II\r\n- Cải tiến màn hình có cả màn hình LiveView\r\n- Cải tiến chế độ chụp im lặng\r\n- Cải thiện tuổi thọ pin', 79000000, 1, 3, 16, 2, 3412);
INSERT INTO `products` VALUES (2, 'Canon EOS 6D Mark II', 'Bảo hành 24 tháng chính hãng', 'Bộ cảm biến CMOS Full frame 26.2MP\r\nBộ xử lý hình ảnh DIGIC 7\r\nHệ thống AF toàn phần 45 điểm\r\nFull HD Video ở tốc độ 60 khung hình / giây; IS điện tử\r\nMàn hình cảm ứng LCD 3.0 inch \"\r\nDual Pixel CMOS AF và Movie Servo AF\r\nTiêu chuẩn ISO 40000, được mở rộng theo tiêu chuẩn ISO 102400\r\nChụp 6.5 khung hình / giây; Thời gian trôi đi & phim HDR\r\nGPS tích hợp, Bluetooth, và Wi-Fi với NFC\r\nChống bụi và nước; Khe cắm thẻ nhớ SD', 44990000, 1, 1, 24, 3, 3456);
INSERT INTO `products` VALUES (3, 'Nikon D5', 'Bảo hành 12 tháng chính hãng', '- Cảm biến CMOS FX-Format 20.8MP\r\n- Bộ xử lý Expeed 5\r\n- Màn hình cảm ứng LCD 3.2\" 2.36m-Dot\r\n- Quay video 4K UHD tại 30fps\r\n- ISO 102.400 mở rộng 3.280.000\r\n- Tốc độ chụp hình liên tiếp 12fps', 121990000, 1, 3, 6, 4, 1232);
INSERT INTO `products` VALUES (4, 'Canon EOS 1D X Mark II', 'Bảo hành 24 tháng chính hãng', '- Cảm biến Full Fram CMOS 20.2MP\r\n- Bộ xử lý hình ảnh Dual DIGIC 6+\r\n- Màn hình cảm ứng LCD 3.2\" 1.62m-Dot\r\n- Quay video DCI 4K với 60fps, 8.8MP Still Grab\r\n- 61-Point High Density Reticular AF II\r\n- ISO tiêu chuẩn 51.200, mở rộng ISO 409.600\r\n- Tốc độ chụp 14fps, 16fps với chế độ Live View\r\n- Dual Pixel CMOS AF and Movie Servo AF\r\n- Tích hợp GPS, CFast và khe cắm CF Card', 118500000, 1, 1, 8, 5, 54);
INSERT INTO `products` VALUES (5, 'Canon EOS 5D Mark IV', 'Bảo hành 24 tháng chính hãng', '- Cảm biến CMOS Full-Frame 30.4MP\r\n- Bộ xử lý hình ảnh DIGIC 6+\r\n- Màn hình cảm ứng LCD 3.2\" 1.62,-Dot\r\n- Quay video 4K tại 30fps, cắt ảnh tĩnh từ video 8.8MP\r\n- Số điểm nét AF: 61 điểm với điểm lấy nét 41 cross-points\r\n- ISO: 100-32.000, mở rộng 50-102.000\r\n- Dual Pixel Raw, lựa chọn vùng lấy nét AF chỉ với 1 nút\r\n- Tích hợp kết nối Wifi, NFC và GPS\r\n- Tốc độ chụp liên tiếp 7fps, khe cắm thẻ CF, SD', 73990000, 1, 1, 11, 3, 213);
INSERT INTO `products` VALUES (6, 'Sony Alpha a7S II', 'Bảo hành 24 tháng chính hãng', '- Cảm biến Full-Frame với 12.2 MP\r\n- Bộ xử lý hình ảnh BIONZ X\r\n- Quay phim ở 4K và ful HD 1080\r\n- S-Log3 Gamma và Hiển thị Hỗ trợ chức năng\r\n- Độ nghiêng màn hình ở 3,0 \"1.228.800-Dot\r\n- Tốc độ chụp liên tục lên đến 5 fps và ISO 409.600\r\n- Lấy nét nhanh với 169 điểm\r\n- Có chức năng Wi-Fi và NFC', 60000000, 1, 4, 11, 1, 234);
INSERT INTO `products` VALUES (7, 'Fujifilm X-T2 Graphite Silver ', 'Bảo hành 24 tháng chính hãng', '- Phiên bản mới: màu bạc - Graphite Silver Edition\r\n- Cảm biến CMOS III APS-C X-Trans 24.3MP\r\n- Bộ cảm biến hình ảnh X Processor Pro\r\n- Kính ngắm OLED 0.77x 2.36m-Dot\r\n- Màn hình LCD 3\" 1.04m-Dot 3-Way\r\n- Quay phim UHD 4K và F-Log Gamma\r\n- Kết nối Wifi\r\n- Hệ thống lấy nét tự động 325 điểm\r\n- ISO 51200\r\n- Tốc độ chụp liên tiếp 8fps\r\n- Thiết kế chống chịu thời tiết\r\n- Hai khe cắm UHS-II SD', 39990000, 1, 2, 12, 3, 456);
INSERT INTO `products` VALUES (8, 'Sony Alpha A7 Mark II', 'Bảo hành 24 tháng chính hãng', '- Cảm biến CMOS Exmor 24.3MP Full Khung hình\r\n- Bộ xử lý hình ảnh BIONZ X\r\n- Khả năng tương thích trực tiếp với Ống kính E-mount\r\n- LCD 3.0 \"tiltable TFT với 1,228 triệu điểm ảnh\r\n- Kính ngắm điện tử OLED 2.4m-Dot\r\n- Quay phim: XAVC S 50 Mbps, AVCHD 2.0 28 Mbps, 1.920 x 1.080 pixel\r\n- Chụp liên tiếp: 2,5 hình/giây đến 5 hình/giây\r\n- Tích hợp Wi-Fi và công nghệ NFC\r\n- Đa giao diện và Flash gắn trong\r\n- Giao diện truy cập trực tiếp', 31990000, 1, 4, 13, 11, 12);
INSERT INTO `products` VALUES (9, 'Fujifilm X100F', 'Bảo hành 24 tháng chính hãng', '- Cảm biến 24.3MP APS-C X-Trans CMOS III\r\n- Xử lý hình ảnh: X-Processor Pro\r\n- Fujinon 23mm f/2 Lens\r\n- Kính ngắm lai quang học và điện tử\r\n- Màn hình LCD 3.0\" 1.04m-Dot\r\n- Quya video Full HD 1080p / 60 fps\r\n- 49 điểm lấy nét theo pha trong 91-Point AF\r\n- Độ nhạy sáng mở rộng: ISO 51200\r\n- Chụp ảnh liên tục to 8 fps\r\n- Tích hợp ISO Dial và đòn bẫy lấy nét phía sau', 29990000, 1, 2, 11, 5, 78);
INSERT INTO `products` VALUES (10, 'Nikon D5300', 'Bảo hành 24 tháng chính hãng', '- Cảm biến CMOS DX-Format 24.2MP\r\n- Bộ xử lý hình ảnh EXPEED 4\r\n- Màn hình LCD Vari-Angle 3.2\" 1037k\r\n- Quay phim Full HD tại 60fps\r\n- Cảm biến lấy nét AF 39 điểm Multi Cam 4800DX\r\n- ISO 12800, mở rộng ISO 25600\r\n- Tốc độ chụp liên tục 5fps\r\n- Tích hợp WIFI và kết nối GPS', 11990000, 1, 3, 22, 9, 23);
INSERT INTO `products` VALUES (11, 'Sony DSC WX100', 'Bảo hành 24 tháng chính hãng', 'Màn hình 2.7inch\r\nĐộ phân giải 18.2MP\r\nZoom quang 10x\r\nCảm biến 18.2MP\r\nTự động lấy nét nhanh với High-speed Auto Focus\r\nZoom hình ảnh rõ nét 20x\r\n9 chế độ hiệu ứng hình ảnh\r\nQuay phim Full HD với ổn định hình ảnh quang học\r\nLoại Cảm biến Exmor R CMOS\r\nKích cỡ 1/2.3 (7.76mm)\r\nĐiểm ảnh tổng 18.9 Mega Pixels\r\nĐiểm ảnh thật 18.2 Mega Pixels', 1495000, 2, 4, 25, 4, 456);
INSERT INTO `products` VALUES (12, 'Canon IXUS 185', 'Bảo hành 24 tháng chính hãng', '- Ống kính 20 megapixel\r\n- Zoom quang học 8x (28 224) / ZoomPlus 16x\r\n- Bộ xử lý hình ảnh hình ảnh DIGIC 4+\r\n- Ổn định hình ảnh kỹ thuật số IS\r\n- ISO 100 – ISO800\r\n- Quay video 1280 x 720', 2350000, 2, 1, 6, 6, 12);
INSERT INTO `products` VALUES (13, 'Fujifilm instax mini 9', 'Bảo hành 12 tháng chính hãng', '- In ảnh tức thì\r\n- Kính ngắm quang học với Target Spot\r\n- Tích hợp gương tự sướng trên ống kính\r\n- Tích hợp đèn flash và chế độ Auto Expose Mode\r\n- Điều chỉnh độ sáng bằng tay\r\n- Chế độ Hi-Key\r\n- Ống kính Fujinon 60mm F/12.7', 1990000, 2, 2, 12, 3, 221);
INSERT INTO `products` VALUES (14, 'Canon IXUS 190', 'Bảo hành 24 tháng chính hãng', '- Bộ xử lý hình ảnh DIGIC 4+\r\n- 20 megapixel\r\n- Zoom quang học 10x (24 - 240 mm)\r\n- ZoomPlus 20x\r\n- ISO 100 – ISO800\r\n- Kết nối Wi-Fi & NFC', 3850000, 2, 1, 6, 2, 12);
INSERT INTO `products` VALUES (15, 'Fujifilm X100F', 'Bảo hành 12 tháng chính hãng', '- Cảm biến 24.3MP APS-C X-Trans CMOS III\r\n- Xử lý hình ảnh: X-Processor Pro\r\n- Fujinon 23mm f/2 Lens\r\n- Kính ngắm lai quang học và điện tử\r\n- Màn hình LCD 3.0\" 1.04m-Dot\r\n- Quya video Full HD 1080p / 60 fps\r\n- 49 điểm lấy nét theo pha trong 91-Point AF\r\n- Độ nhạy sáng mở rộng: ISO 51200\r\n- Chụp ảnh liên tục to 8 fps\r\n- Tích hợp ISO Dial và đòn bẫy lấy nét phía sau\r\n- Phiên bản màu đen', 29990000, 2, 2, 3, 1, 134);
INSERT INTO `products` VALUES (16, 'Nikon Coolpix S3700', 'Bảo hành 12 tháng chính hãng', '- Cảm biến CCD 1/2.3\" 20.1MP\r\n- Ống kính khẩu độ f/3.7-6.6\r\n- Tiêu cự 25-200mm (trên định dạng 35mm)\r\n- Zoom quang học 8x (16x Dynamic Fine Zoom)\r\n- Màn hình LCD 2.7\" 230k-Dot\r\n- Quay phim HD 720p\r\n- Có đến16 bối cảnh chụp\r\n- Kết nối Wi-Fi và NFC\r\n- Chụp ảnh liên tục 1.1 fps\r\n- ISO 80–1600, ISO 3200 (khả dụng khi sử dụng Chế độ tự động)\r\n- Có 6 tùy chọn màu: hồng, đỏ, bạc, đen, xanh có họa tiết, xanh', 3000000, 2, 3, 7, 15, 1634);
INSERT INTO `products` VALUES (17, 'Nikon Coolpix L840', 'Bảo hành 12 tháng chính hãng', '- Cảm biến hình ảnh CMOS 16MP\r\n- Tiêu cự tương đương 22.5-855mm ( định dạng 35mm)\r\n- Màn hình LCD 3\" với 921K Dot\r\n- Quay video Full HD 1080p 30fps\r\n- Tích hợp kết nối Wifi và NFC\r\n- Chức năng zoom Dynamic Fine 76x\r\n- ISO 6400 và tốc độ chụp 7.4fps\r\n- Chế độ Scene Auto Selector', 5000000, 2, 3, 12, 6, 256);
INSERT INTO `products` VALUES (18, 'Sony Cyber-Shot DSC-W830 ', 'Bảo hành 24 tháng chính hãng', '- Cảm biến 20.1MP 1/2.3\" Super HAD CCD\r\n- Ống kính Zeiss Vario tiêu cự 25-200mm (tương đương trên định dạng 35mm)\r\n- Màn hình LCD: 2.7\" 230k-Dot\r\n- Quay video HD 1280 x 720/30 fps\r\n- Bộ xử lý hình ảnh BIONZ\r\n- Hệ thống ổn định hình ảnh quang học\r\n- ISO 80-3200\r\n- Góc Chụp 3600\r\n- Khe cắm thẻ MS Duo và SD\r\n- Cổng USB 2.0, Composite HD', 2590000, 2, 4, 1, 1, 567);
INSERT INTO `products` VALUES (19, 'Sony A6000', 'Bảo hành 24 tháng chính hãng', '- Cảm biến 24.3MP APS-C Exmor APS HD CMOS\r\n- Bộ xử lý ảnh BIONZ X\r\n- Kính ngắm OLED EVF Tru-Finder 0.39\" 1,440k-Dot\r\n- Màn hình LCD: 3.0\" 921k-Dot\r\n- Quay video Full HD 1080p XAVC S / 24/60 fps\r\n- Kết nối Wi-Fi và NFC\r\n- Fast Hybrid AF & 179 điểm lấy nét theo pha\r\n- Chụp ảnh liên tục 11 fps và ISO 25600', 11990000, 2, 4, 4, 4, 234);
INSERT INTO `products` VALUES (20, 'Canon PowerShot G7 X II', 'Bảo hành 24 thánh chính hãng', '- Cảm biến 1 inch CMOS 20MP\r\n- Bộ xử lý hình ảnh DIGIC7\r\n- Ống kính : 24-100mm f/1.8-2.8 và hệ thống chống rung (IS), 9 lá khẩu\r\n- Tốc độ chụp liên tục 8 fps\r\n- Màn hình LCD 3″ 1.04 triệu điểm ảnh (tilt 180° up, 45° down)\r\n- Quay video Full HD\r\n- Time-lapse movie\r\n- Hỗ trợ kết nối Wi-FI, NFC', 14490000, 2, 1, 4, 3, 567);
INSERT INTO `products` VALUES (21, 'Sony Alpha a7R III', 'Bảo hành 24 tháng chính hãng', 'ISO 102400\r\nBộ xử lý hình ảnh BIONZ X & LSI\r\nHệ thống lấy nét 399 điểm\r\nChụp  liên tục 10 khung hình/giây\r\nBộ cảm biến CMOS BSI CMOS 42MP Full-Frame Exmor R\r\nVideo UHD 4K30p với HLG & S-Log3 Gammas\r\n3,9m-Dot Tru-Finder OLED EVF\r\nMàn hình cảm ứng LCD 3.0 \"1.44 triệu điểm ảnh\r\nChống rung 5 trục (5-Axis)\r\nPixel Shift Multi Shooting\r\nTích hợp Wi-Fi / Bluetooth, khe SD đôi\r\nUSB 3.0 cổng loại-C & thiết bị đầu cuối đồng bộ hóa PC', 77990000, 3, 4, 2, 2, 342);
INSERT INTO `products` VALUES (22, 'Fujifilm X-E3 Body Sliver', 'Bảo hành 12 tháng chính hãng', '- Cảm biến 24.3MP APS-C X-Trans CMOS III\r\n- Bộ xử lý hình ảnh X-Processor Pro\r\n- Màn hình cảm ứng TFT LCD 3\" 1.04 triệu điểm ảnh\r\n- Ống ngắm điện tử OLED kích thước 0.77\" 2,36MP\r\n- ISO 51200, tốc độ chụp 8fps\r\n- Khả năng quay video 4K UHD\r\n- Khả năng kết nối wifi\r\n- Hệ thống lấy nét AF 325 điểm\r\n- Body kháng nước, bụi bẩn\r\n- Tương thích thẻ nhớ SD, SHHC, SDXC, UHS-II', 21990000, 3, 2, 4, 1, 789);
INSERT INTO `products` VALUES (23, 'Fujifilm GFX 50S', 'Bảo hành 12 tháng chính hãng', '- Máy ảnh Medium Format thuộc dòng không gương lật\r\n- Cảm biến CMOS 51.4MP 43.8 x 32.9mm\r\n- Bộ xử lý hình ảnh X-Processor Pro\r\n- Kính ngắm điện tử OLED EVF 3.69m-Dot, có thể tháo rời\r\n- Màn hình cảm ứng LCD 3.2\" 2.36m-Dot\r\n- 117-Point Contrast-Detection AF System\r\n- Độ nhạy sáng mở rộng ISO 50-102400,\r\n- Chụp ảnh liên tục 3 fps\r\n- Quay video Full HD 1080p/30 fps\r\n- Thiết kế chống chịu thời tiết khắc nghiệt', 150000000, 3, 2, 1, 4, 5674);
INSERT INTO `products` VALUES (24, 'Sony A6700', 'Bảo hành 24 thánh chính hãng', '- Cảm biến 24.3MP APS-C Exmor APS HD CMOS\r\n- Bộ xử lý ảnh BIONZ X\r\n- Kính ngắm OLED EVF Tru-Finder 0.39\" 1,440k-Dot\r\n- Màn hình LCD: 3.0\" 921k-Dot\r\n- Quay video Full HD 1080p XAVC S / 24/60 fps\r\n- Kết nối Wi-Fi và NFC\r\n- Fast Hybrid AF & 179 điểm lấy nét theo pha\r\n- Chụp ảnh liên tục 11 fps và ISO 25600', 10990000, 3, 4, 8, 5, 423);
INSERT INTO `products` VALUES (25, 'Sony Alpha A6300', 'Bảo hành 24 tháng chính hãng', '- Cảm biến CMOS APS-C 24MP\r\n- Bộ xử lý hình ảnh BIONZ X\r\n- Hệ thống lấy nét AF 425 điểm theo pha\r\n- Chụp liên tiếp 11fps (8fps ở chế độ live-view)\r\n- Có chế độ chụp yên lặng (Silent shooting như A7RII)\r\n- Dải nhạy sáng ISO 100 - 51200\r\n- Quay video 4K lên tới 100Mbps, S-Log3 Gamma\r\n- LCD 3.0\" 921.6K', 19990000, 3, 4, 2, 6, 123);
INSERT INTO `products` VALUES (26, 'Canon EOS M5', 'Bảo hành 24 tháng chính hãng', '- Cảm biến CMOS APS-C 24.2MP\r\n- Bộ xử lý hình ảnh DIGIC 7\r\n- Màn hình cảm ứng LCD 3.2\" 1.62m-Dot\r\n- Quay phim Full HD 1080p tại 60fps\r\n- Tích hợp kết nối Wifi và NFC, Bluetooth Smart\r\n- Dual Pixel CMOS AF\r\n- Tốc độ chụp liên tiếp 9fps và ISO 25600\r\n- Hệ thống chống rung 5 trục IS\r\n- Ống kính EF-M 18-150mm F/3.5-6.3 IS STM', 20990000, 3, 1, 1, 8, 567);
INSERT INTO `products` VALUES (27, 'Canon EOS M3', 'Bảo hành 24 tháng chính hãng', '- Cảm biến CMOS APS-C 24.2MP\r\n- Cảm biến hình ảnh DIGIC 6\r\n- Màn hình cảm ứng LCD 3.0\" 1.040k-Dot\r\n- Quay phim Full HD 1080p tại 24/24/30fps\r\n- Tích hợp kết nối NFC và Wifi\r\n- Công nghệ lấy nét Hybrid CMOS AF với 49 điểm\r\n- ISO 100-12800, mở rộng 25600\r\n- Ống kính EF-M 15-45mm F/3.5-6.3 IS STM', 9990000, 3, 1, 16, 5, 798);
INSERT INTO `products` VALUES (28, 'Canon EOS M10', 'Bảo hành 12 tháng chính hãng', '- Cảm biến CMOS APS-C 18MP\r\n- Bộ xử lý hình ảnh DIGIC 6\r\n- Màn hình cảm ứng LCD 3.0\" 1.04m-Dot\r\n- Kết nối Wifi, NFC\r\n- Hệ thống lấy nét Hybrid CMOS AF 49 điểm\r\n- Tốc độ chụp liên tiếp 4.6fps và\r\n- ISO 100-12800, có thể mở rộng 25600\r\n- Creative Assist và chế độ Self Portrait\r\n- Ống kính EF-M 15-45mm F/3.5-6.3 IS STM\r\n- Sản phẩm có hai màu: trắng, đen', 7990000, 3, 1, 24, 4, 980);
INSERT INTO `products` VALUES (29, 'Nikon Coolpix A900', 'Bảo hành 12 tháng chính hãng', '- Cảm biến CMOS BSI 20MP\r\n- Tiêu cự tương đương 24-840mm theo định dạng 35mm\r\n- Zoom quang học 35x, Dynamic Zoom 70x\r\n- Màn hình LCD 3 inch 921K-Dot\r\n- Quay video UHD 4K/30fps\r\n- Kết nối Bluetooth, Wifi, NFC\r\n- ISO 3200, tốc độ chụp liên tục 7fps\r\n- Ống kính Nikon F/3.4- 6.9 ED', 10990000, 3, 3, 2, 5, 4568);
INSERT INTO `products` VALUES (30, 'Canon EOS M6', 'Bảo hành 24 tháng chính hãng', '- Cảm biến CMOS 24.2 MPs\r\n- Bộ xử lý hình ảnh Canon DIGIC 6\r\n- ISO đến 25,600\r\n- Chụp liên tiếp tới 7 hình/giây\r\n- Trang bị hệ thống lấy nét tự động Dual Pixel CMOS AF\r\n- AF points: 49 điểm\r\n- Tốc độ màn trập: 1 / 4,000 to 30 seconds, bulb, flash sync 1/200 sec\r\n- Tích hợp đèn flash trong, Ống ngắm EVF-DC1 có thể tháo rời\r\n- Quay phim full HD, HD, VGA\r\n- Kết nối Wifi, NFC, Bluetooth\r\n- Tương thích hệ thống ống kính EF-M, EF-S, EF của Canon\r\n- Màn hình lật xoay 3.2\" cảm ứng 1.040.000 pixels\r\n- Ống kit: EF-M 15-45mm f/3.5-6.3 IS STM\r\n- Phiên bản màu đen', 14490000, 3, 1, 5, 12, 346);
INSERT INTO `products` VALUES (31, 'GoPro Hero 6', 'Bảo hành 24 tháng chính hãng', 'Cảm biến 12 MP\r\nKhả năng chống nước ở độ sâu lên tới 10 mét\r\nQuay video 4K ở tốc độ 60 khung hình/giây\r\nQuay được video slow motion full HD 1080 240 fps\r\nChip xử lý mới với tốc độ cao\r\nSử dụng Wi Fi 5GHz\r\nTốc độ truyền tải dữ liệu sẽ nhanh hơn gấp 3 lần\r\nChụp ảnh 12MP với 2 định dạng là JPG hoặc RAW\r\nCó chế độ Wide Dynamic Range, chụp ảnh HDR', 11490000, 4, 6, 12, 6, 235);
INSERT INTO `products` VALUES (32, 'Máy bay DJI Mavic Pro Platinum More Combo', 'Bảo hành 24 tháng chính hãng', '- Battery to power bank adaptor x1\r\n- Battery charging HUB x1\r\n- Car charger x1\r\n- Intelligent flight Battery x2\r\n- Folding propellers x2\r\n- Quay phim: 4K (30fps)\r\n- Công nghệ Truyền dẫn tín hiệu OcuSync\r\n- Tích hợp ứng dụng DJI GO\r\n- Chức năng FlightAutonomy phát hiện trở ngại\r\n- Thời gian bay 27 phút\r\n- Tốc độ 65 km / giờ ở chế độ thể thao', 32990000, 4, 5, 2, 3, 2);
INSERT INTO `products` VALUES (33, 'Máy bay DJI Phantom 4 PRO Plus', 'Bảo hành 24 tháng chính hãng', '- Camera trang bị cảm biến ảnh CMOS 1inch 20MP hỗ trợ quay phim 4K\r\n- Tốc độ cất / hạ cạnh: S mode 6m/s / 4m/s; P mode 5m/s / 3m/s\r\n- Tốc độ bay: S mode 72km/s; A mode 58km/h; P mode 50km/h\r\n- Bay cao so với mặt đất: 6000m\r\n- Tích hợp cảm biến hồng ngoại giúp tránh vật cản trong phạm vi 7m\r\n- Hệ thống bay tự động thông minh Flight Autonomy\r\n- Chế độ bay Tayfly tự động bay tới điểm đã được xác định và tránh vật cản trên đường đi\r\n- Chế độ bay Draw bay theo đường vẽ trên màn hình và vẫn giữ độ cao\r\n- Chế độ nhận diện cử chỉ Gestune Mode giúp bạn điều khiển máy bay chụp hình thông qua cử chỉ ngón tay\r\n- Phiên bản kèm Remote Lightbridge có màn hình theo dõi, chất lượng truyền tín hiệu tốt', 41490000, 4, 5, 2, 2, 34);
INSERT INTO `products` VALUES (34, 'Máy bay điều khiển DJI Spark Alpine White', 'Bảo hành 24 tháng chính hãng', 'Máy bay điều khiển DJI Spark Alpine White', 11590000, 4, 5, 8, 4, 723);
INSERT INTO `products` VALUES (35, 'Camera hành trình Ricoh - WG-M1', 'Bảo hành 12 tháng chính hãng', '- Hỗ trợ quay video 1080p30 & 720p60\r\n- Độ phân giải hình ảnh 14MP\r\n- Ống kính góc rộng\r\n- Chống nước ở độ sâu 10m\r\n- Chống sốc ở độ cao <= 2m\r\n- Hoạt động được ở thời tiết 14°F\r\n- Slow-Motion 120 fps\r\n- Thiết kế chống bụi, dễ cầm nắm và điều khiển\r\n- Đầu ra: Micro HDMI\r\n- Có kết nối Wi-Fi\r\n- Bao gồm Flat Adhesive Mount', 5490000, 4, 6, 10, 5, 346);
INSERT INTO `products` VALUES (36, 'Action Cam Sony HDR- AS300R', 'Bảo hành 24 tháng chính hãng', '-Máy quay hành động Full HD\r\n-Định dạng ghi hình: XAVC S (HD), MP4\r\n-Góc quay Wide/Medium/Narrow, ống kính Carl Zeiss Tessar F2.8\r\n-Ổn định hình ảnh: Balanced Optical SteadyShot with Active mode\r\n-Cảm biến: 1/2.5 type (7.20 mm) back-illuminated \"Exmor R\" CMOS Sensor\r\n- Bộ xử lý ảnh BIONZ X\r\n-Độ phân giải hiệu dụng quay phim và chụp hình 8.2MP\r\n-Âm thanh: stereo 2 kênh\r\n-Kết nối với điện thoại thông minh qua WiFi hoặc NFC\r\n-GPS: Có\r\n-Tính năng khác: Loop Recording, Motion Shot LE, Burst Shooting, 4K Time-lapse capture, Live Streaming\r\n-Thân máy chống nước chuẩn IPX4', 9490000, 4, 4, 12, 6, 32);
INSERT INTO `products` VALUES (37, 'GoPro Hero 5', 'Bảo hành 24 tháng chính hãng', '- Hỗ trợ quay Video 4K30, 2.7K60, 1080p120\r\n- Chụp hình 12MP tại 30fps\r\n- Ống kính siêu rộng\r\n- Chống thấm nước với độ sâu lên đến 10m\r\n- Điều khiển bằng giọng nói\r\n- Màn hình cảm ứng\r\n- Giám sát và điều khiển từ xa thông qua kết nối Wifi\r\n- Time Lapse', 8690000, 4, 6, 7, 7, 346);
INSERT INTO `products` VALUES (38, 'Action Cam Sony HDR-AS50 Full HD', 'Bảo hành 24 tháng chính hãng', '- Máy quay hành động Full HD 1920x1080 60p/50p\r\n- Góc quay 170 độ, ống kính Carl Zeiss Tessar\r\n- Chống rung Steady shot\r\n- Cảm biến 1/2.3 type \"Exmor R\" CMOS\r\n- Bộ xử lý ảnh BIONZ X\r\n- Độ phân giải quay phim và chụp hình 11.9 megapixel\r\n- Âm thanh stereo 2 kênh\r\n- Kết nối: WiFi, Bluetooth\r\n- Chụp timelapse (1s/2s/5s/10s/30s/60s), Loop recording\r\n- Trọng lượng: khoảng 83 g (bao gồm cả pin)\r\n- Kích thước: Khoảng 24,2 x 47,0 x 83,0 mm\r\n- Pin tương thích NP-BX1\r\n- Phụ kiện đi kèm: Pin, Cáp USB, vỏ bọc chống nước 60m, Khóa gài, Dây đeo cổ tay, Bộ ngàm chuyển đổi và Giá gắn.', 5490000, 4, 4, 2, 34, 574);
INSERT INTO `products` VALUES (39, 'Máy quay phim 4K HDR FDR-AX700', 'Bảo hành 24 tháng chính hãng', '- Quay chuyên nghiệp và đa dạng\r\n- Phạm vi lấy nét tự động rộng\r\n- Phản hồi lấy nét tự động nhanh\r\n- Ghi video 4K HDR\r\n-Tự động lấy nét theo pha 273 điểm\r\n- Ống kính Zeiss Vario Sonnar T  \r\n-Ổn định hình ảnh SteadyShot\r\n-Màn hình LCD OLED EVF / 3,5 \"OLED EVRED 0,39\"\r\n-Tốc độ ghi 120 fps\r\n-S-Log và S-Gamut Profile', 49900000, 5, 6, 2, 2, 679);
INSERT INTO `products` VALUES (40, 'Canon XA35', 'Bảo hành 24 tháng chính hãng', '- Cảm biến: 1/2.84\" HD CMOS Pro\r\n- 1920x1080 up to 59.94p\r\n- Lens zoom quang học: 20x\r\n- HD/SD-SDI Output\r\n- Wide DR Gamma (600%) Mode\r\n- Highlight Priority Mode\r\n- OLED cảm ứng 3.5\" OLED & EVF\r\n- 2x XLR Audio Inputs\r\n- Khe thẻ nhớ: Dual SD/SDHC/SDXC\r\n- Kết nối Wi-Fi với FTP', 50990000, 5, 1, 2, 1, 70);
INSERT INTO `products` VALUES (41, 'Sony FDR- AX100', 'Bảo hành 24 tháng chính hãng', '- Quay phim 4K Ultra HD tại 30fps\r\n- Độ phân giải chụp ảnh tĩnh 20MP\r\n- Cảm biến CMOS Exmor R 1\"\r\n- Ống kính Zeiss Varo Sonnar T\r\n- Zoom quang học 12x, mở rộng 24x\r\n- Công nghệ ổn định hình ảnh quang học Optical SteadyShot\r\n- Ghi tốc độ cao 120fps\r\n- Định dạng quay XAVC S, AVCHD, MP4\r\n- Kết nối Wifi, NFC', 44990000, 5, 4, 2, 3, 568);
INSERT INTO `products` VALUES (42, 'Sony FDR-AXP55E', 'Bảo hành 24 tháng chính hãng', '- Quay phim 4K Ultra HD 24/25p\r\n- Độ phân giải ảnh tĩnh 16.6MP\r\n- Bộ cảm biến CMOS Exmor R\r\n- Ống kính Zeiss Vario Sonnar T tiêu cự 26.8mm\r\n- Zoom quang học 20x, mở rộng 40x\r\n- Công nghệ ổn định hình ảnh SteadyShot\r\n- Ghi tốc độ cao 100fps\r\n- Tích hợp máy chiếu\r\n- Hỗ trợ kết nối Wifi, NFC', 26990000, 5, 4, 1, 5, 457);
INSERT INTO `products` VALUES (43, 'Sony HDR-CX900E', 'Bảo hành 12 tháng chính hãng', '- Cảm biến CMOS Exmor R 1\"\r\n- Quay video 1080p\r\n- Độ phân giải hình ảnh tĩnh 20MP\r\n- Quay định dạng: XAVC S, AVCHD và MP4\r\n- Ống kính Zeiss Varrio Sonnar T\r\n- Ống kính zoom quang học 12x và mở rộng 24x\r\n- Bộ xử lý hình ảnh BIONZ X\r\n- Chống rung quang học SteadyShot và Quay video kép\r\n- Kết nối Wifi và NFC', 36990000, 5, 4, 1, 7, 235);
INSERT INTO `products` VALUES (44, 'Sony HDR-PJ440E', 'Bảo hành 24 tháng chính hãng', '- Quay video Full HD\r\n- Độ phân giải ảnh tĩnh 9.2MP\r\n- Cảm biến Exmor R CMOS\r\n- Ống kính Zeiss zoom quang học 30x\r\n- Tích hợp máy chiếu\r\n- Tích hợp Wifi/NFC', 8990000, 5, 4, 8, 8, 124);
INSERT INTO `products` VALUES (45, 'Sony FDR-AX40E', 'Bảo hành 24 tháng chính hãng', '- Chất lượng hình ảnh 4K\r\n- Cảm biến Exmor R CMOS mới cho chất lượng 4K\r\n- Ống kính góc rộng Zeiss Vario Sonnar T\r\n- Chống rung quang học SteadyShot\r\n- Lấy nét tự động cực nhanh\r\n- Chất lượng hình ảnh cao', 22490000, 5, 4, 2, 4, 346);
INSERT INTO `products` VALUES (46, 'Sony HDR-CX405E', 'Bảo hành 24 tháng chính hãng', '- Quay Video Full HD\r\n- Độ phân giải ảnh tĩnh: 9.2 MP\r\n- Cảm biến CMOS Exmor R cho chất lượng hình ảnh tuyệt đẹp\r\n- Bộ xử lý hình ảnh Bionz X\r\n- Ống kính Zeiss zoom quang học 30x có chất lượng ghi hình tuyệt vời\r\n- Ổn định hình ảnh Optical SteadyShot hiệu chỉnh rung lắc để luôn ghi được hình ảnh mịn màng và ổn định', 5990000, 5, 4, 10, 3, 457);
INSERT INTO `products` VALUES (47, 'Canon EF 85mm F1.4L IS USM', 'Bảo hành 24 tháng chính hãng', 'Số lá khẩu: 9 lá\r\nMotor lấy nét: USM\r\nĐộ phóng đại: 0.12 lần\r\nĐường kính Filter: 77 mm\r\nKích thước: φ88.6 × 105.4 mm\r\nKhối lượng: khoảng 950 g\r\nChống rung: khoảng 4 steps\r\nKhoảng cách lấy nét gần nhất: 85cm\r\nLớp tráng phủ: ASC, fluorine coating\r\nCấu trúc: 14 thấu kính chia làm 10 nhóm', 35990000, 6, 1, 4, 2, 58);
INSERT INTO `products` VALUES (48, 'Canon EF 35mm f/1.4L II USM', 'Bảo hành 24 tháng chính hãng', '- Ống kính ngàm EF Mount dòng L-Series/ Full-frame Format\r\n- Khẩu độ: F/1.4-F/22\r\n- Công nghệ sản xuất thấu kính Blue Spectrum Refractive\r\n- Gồm 2 thấu kính phi cầu và 1 thấu kính UD\r\n- Lớp tráng phủ Subwavelength và Fluorine\r\n- Động cơ lấy nét Ultrasonic Autofocus\r\n- Manual Focus Override Full-Time\r\n- Cấu trúc chống chịu thời tiết\r\n- 9 lá khẩu tròn', 40990000, 6, 1, 1, 4, 967);
INSERT INTO `products` VALUES (49, 'Canon EF 16-35mm f/2.8L III USM', 'Bảo hành 24 tháng chính hãng', '- Thuộc dòng ống kính L Series\r\n- Ống kính EF-Mount / định dạng Full-Frame\r\n- Khẩu độ: f/2.8 - 22\r\n- Ba thấu kính phi cầu và 2 thấu kính UD\r\n- Lớp tráng phủ Subwavelength & Air Sphere\r\n- Động cơ lấy nét USM AF\r\n- Lấy nét IF, Full-Time MF Override\r\n- Lớp phủ Fluorine chống bám bụi, dễ vệ sinh\r\n- Cấu trúc chống bụi, độ ẩm trong môi trường khắc nghiệt\r\n- 9 lá khẩu tròn\r\n- Cân nặng: 790g\r\n- Đường kính Filter: 82mm', 50790000, 6, 1, 2, 6, 57);
INSERT INTO `products` VALUES (50, 'Canon EF-S 18-55mm f/3.5-5.6 IS STM', 'Bảo hành 12 tháng chính hãng', '- Ngàm EF-S\r\n- Tiêu cự tương đương 29-88mm ( định dnagj 35mm)\r\n- Khẩu độ: F/3.5-5.6\r\n- Bao gồm 1 thấu kính phi cầu\r\n- Hệ thống ổn định hình ảnh quang học IS\r\n- Stepping Motor và Hệ thống lấy nét trong\r\n- Khoảng cách lấy nét gần nhất 25cm\r\n- Đường kính Filter 58mm', 3190000, 6, 1, 8, 7, 236);
INSERT INTO `products` VALUES (51, 'Nikon AF-S NIKKOR 200-500mm f/5.6E ED', 'Bảo hành 24 tháng chính hãng', 'Khẩu độ: F5.6\r\nPhóng đại: 0,22x\r\nSố lượng lá khẩu: 9\r\nKhoảng cách lấy nét gần nhất: 2.2m\r\nKích thước bộ lọc: ø95mm\r\nHood tương thích: HB-71\r\nTrọng lượng: 2300g', 29990000, 6, 3, 3, 8, 124);
INSERT INTO `products` VALUES (52, 'Nikon AF-S 85mm f/1.8G', 'Bảo hành 24 tháng chính hãng', '- Ngàm ống kính F Mount/ FX Format\r\n- Khẩu độ: F/1.8-F/16\r\n- Lớp tráng phủ Super Integrated Coating\r\n- Động cơ lấy nét siêu êm Silent Wave Motor\r\n- Hệ thống căn nét trong IF\r\n- M/A Focus Mode\r\n- Khoảng cách lấy nét tối thiểu: 80cm\r\n- Đường kính Filter 67mm\r\n- 7 lá khẩu tròn', 10790000, 6, 3, 1, 6, 236);
INSERT INTO `products` VALUES (53, 'Nikon AF-S 24-70mm f/2.8E ED VR', 'Bảo hành 24 tháng chính hãng', '- Ống kính ngàm F / định dạng FX\r\n- Khẩu độ: f/2.8 - f/22\r\n- Tiêu cự: 24 - 70mm\r\n- Bao gồm thấu kính: ASP/ED, AS, ED & HRI\r\n- Lớp tráng phủ Nano cho bề mặt ống kính\r\n- Lớp phủ Fluorine cho thấu kính mặt trước và sau\r\n- Hệ thống lấy nét siêu thanh tự động AF\r\n- Hệ thống ổn định hình ảnh VR\r\n- Bao gồm 20 thấu kính xếp thành 16 nhóm\r\n- Có 9 lá khẩu tròn\r\n- Đường kính Filter 82mm\r\n- Trọng lượng: khoảng 1.1kg', 44990000, 6, 3, 1, 2, 357);
INSERT INTO `products` VALUES (54, 'Nikon AF-S DX 18-55mm f/3.5-5.6 DX VR', 'Bảo hành 24 tháng chính hãng', '- Ngàm ống kính F-Mount/ DX Format\r\n- Tiêu cự tương đương 27-82.5 ( định dạng 35mm)\r\n- Khẩu độ: F/3.5-36\r\n- Lớp tráng phủ Super Integrated Coating\r\n- Động cơ lấy nét siêu êm Silent Wave Motor AF\r\n- Hệ thống ổn định hình ảnh Nikon VR II\r\n- Thiết kế nhỏ gọn\r\n- Khoảng cách lấy nét tối thiểu 25cm\r\n- Đường kính Filter 52mm\r\n- 7 lá khẩu tròn', 2190000, 6, 3, 9, 1, 864);
INSERT INTO `products` VALUES (55, 'Fujifilm XF 50mm f/2 R WR', 'Bảo hành 24 tháng chính hãng', '- Loại ống kính: Ống kính prime\r\n- Cảm biến tương thích: APS-C\r\n- Tiêu cự: 50mm (tương đương 76mm trên cảm biến full-frame)\r\n- Ngàm: Fujifilm X\r\n- Khẩu độ: F2-F16\r\n- Khoảng cách lấy nét tối thiểu: 0.39m\r\n- Độ phóng đại tối đa 0.15X\r\n- Lấy nét tự động: Có - Motor lấy nét bước\r\n- Trọng lượng: 200gr\r\n- Đường kính filter: 46mm\r\n- Chống được nước nhẹ, bụi bẩn và hoạt động được -10°C.', 9990000, 6, 2, 8, 23, 795);
INSERT INTO `products` VALUES (56, 'Fujifilm XF 27mm F2.8', 'Bảo hành 24 tháng chính hãng', '- Khẩu Độ : Tối đa f/2.8 , tối thiểu f/16\r\n- Độ dài tiêu cự 27mm\r\n- Đường kính Filter: Ø39 mm\r\n- Trọng lượng: 78g', 7490000, 6, 2, 5, 5, 53);

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
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL,
  PRIMARY KEY (`f_ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
