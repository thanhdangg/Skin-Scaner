import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SKIN SCANNER', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/images/LOGO.svg', // Replace with your actual SVG asset
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle Start Scanner tap
                context.router.push(const ScanRoute());
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/ic_camera.svg', 
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start scanner',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Recognize skin cancer. The scanner allows you to take a photo of the skin lesion and analyze it.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              children: [
                _buildIconTile(
                  context,
                  icon: 'assets/images/ic_history.svg', 
                  label: 'History',
                  onTap: () {
                    // Handle History tap
                  },
                ),
                _buildIconTile(
                  context,
                  icon: 'assets/images/ic_upload.svg',
                  label: 'Upload',
                  onTap: () {
                    // Handle Upload tap
                  },
                ),
                _buildIconTile(
                  context,
                  icon: 'assets/images/ic_chat.svg', 
                  label: 'Chatbot',
                  onTap: () {
                    // Handle Chatbot tap
                  },
                ),
                _buildIconTile(
                  context,
                  icon: 'assets/images/ic_knowledge.svg', 
                  label: 'Knowledge',
                  onTap: () {
                    // Handle Knowledge tap
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconTile(BuildContext context,
      {required String icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade300, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, height: 40, width: 40, color: Colors.green.shade300),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}