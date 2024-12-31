import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skin_scanner/ui/photo_preview/photo_preview_page.dart';

@RoutePage()
class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  double _currentZoomLevel = 1.0;
  double _maxZoomLevel = 1.0;
  double _minZoomLevel = 1.0;
  double _zoomLevel = 1.0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      _cameraController = CameraController(
        _cameras.first,
        ResolutionPreset.high,
      );

      await _cameraController?.initialize();

      // Lấy giới hạn zoom
      _maxZoomLevel = await _cameraController!.getMaxZoomLevel();
      _minZoomLevel = await _cameraController!.getMinZoomLevel();

      setState(() {
        _isCameraInitialized = true;
      });
    }
  }
  void _handleZoom(ScaleUpdateDetails details) {
    if (_cameraController != null) {
      setState(() {
        // Cập nhật mức zoom theo độ thay đổi scale
        _zoomLevel = (_zoomLevel * details.scale)
            .clamp(1.0, _maxZoomLevel); // Giới hạn trong khoảng 1.0 đến maxZoomLevel
        _cameraController?.setZoomLevel(_zoomLevel);
      });
    }
  }

  Future<void> _takePhoto() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        final XFile photo = await _cameraController!.takePicture();
        if (!mounted) return;

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PhotoPreviewPage(imagePath: photo.path),
          ),
        );
      } catch (e) {
        debugPrint('Error capturing photo: $e');
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Scanner'),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onScaleUpdate: _handleZoom, // Xử lý zoom khi có sự kiện scale
            child: _isCameraInitialized
                ? CameraPreview(_cameraController!)
                : const Center(child: CircularProgressIndicator()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: GestureDetector(
                onTap: _takePhoto,
                child: SvgPicture.asset(
                  'assets/images/ic_take_photo.svg',
                  fit: BoxFit.contain,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
