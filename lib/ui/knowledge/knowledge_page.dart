import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class KnowledgePage extends StatelessWidget {
  const KnowledgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiến Thức Về Bệnh Da Liễu'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('1. Giới Thiệu Về Các Bệnh Da Liễu'),
            _buildImageSection('assets/images/intro_skin_diseases.png'),
            _buildSectionContent(
              'Các bệnh da liễu mà hệ thống chẩn đoán bao gồm: Melanoma, Melanocytic nevus, Basal cell carcinoma, Actinic keratosis, Benign keratosis, Dermatofibroma, Vascular lesion... Mỗi bệnh lý có các đặc điểm tổn thương riêng biệt, giúp phân biệt với các bệnh khác.',
            ),
            _buildSectionTitle(
                '2. Mối Liên Hệ Giữa Các Bệnh Lý và Đặc Điểm Tổn Thương'),
            _buildImageSection('assets/images/skin_conditions.png'),
            _buildSectionContent(
              'Mỗi bệnh lý sẽ có các đặc điểm tổn thương như mạng lưới sắc tố, vệt sắc tố, nang giống hạt kê, cầu sắc tố... Những đặc điểm này giúp phân biệt các loại bệnh, ví dụ, melanoma có thể có các đặc điểm như pigment network, streaks, trong khi benign keratosis có thể có milia-like cysts.',
            ),
            _buildSectionTitle('3. Các Nhiệm Vụ Của Hệ Thống'),
            _buildTaskSection(
              'Task 1: Lesion Segmentation (Phân Đoạn Tổn Thương)',
              'Xác định vùng tổn thương trên ảnh da, giúp phân tách tổn thương với vùng da khỏe mạnh.',
            ),
            _buildTaskSection(
              'Task 2: Lesion Attribute Detection (Phát Hiện Thuộc Tính Tổn Thương)',
              'Phát hiện các thuộc tính của tổn thương như pigment network, streaks, globules, giúp nhận diện đặc điểm tổn thương.',
            ),
            _buildTaskSection(
              'Task 3: Disease Classification (Phân Loại Bệnh)',
              'Dựa vào đặc điểm tổn thương và thuộc tính, hệ thống sẽ phân loại bệnh da liễu cụ thể (melanoma, basal cell carcinoma, v.v.).',
            ),
            _buildSectionTitle('4. Phòng Ngừa và Điều Trị'),
            _buildSectionContent(
              'Để phòng ngừa các bệnh da liễu, chúng ta cần thực hiện các biện pháp bảo vệ như sử dụng kem chống nắng, duy trì chế độ ăn uống lành mạnh, và kiểm tra da định kỳ. Điều trị bệnh da liễu có thể bao gồm sử dụng thuốc, phẫu thuật hoặc điều trị laser tùy vào từng tình trạng bệnh.',
            ),
            Container(
              height: 2,
              color: Colors.grey[300],  
            ),
            _buildSectionTitle('PBL6: Hệ thống hỗ trợ chuẩn đoán bệnh về da'),
            _buildSectionContent('Sinh viên thực hiện: '),
            _buildSectionContent('1. Đỗ Cao Cường'),
            _buildSectionContent('2. Nguyễn Thanh Đăng'),
            _buildSectionContent('3. Hoàng Công Trọng'),  
             _buildSectionTitle('© SKIN SCANNER - Nov 2024'),

          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildTaskSection(String taskTitle, String taskDescription) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            taskTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            taskDescription,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
