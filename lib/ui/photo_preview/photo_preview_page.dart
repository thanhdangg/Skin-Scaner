import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/ui/photo_preview/bloc/photo_preview_bloc.dart';
import 'package:skin_scanner/utils/enum.dart';

@RoutePage()
class PhotoPreviewPage extends StatelessWidget {
  final String imagePath;

  const PhotoPreviewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Preview')),
      body: BlocProvider(
        create: (context) => PhotoPreviewBloc(
          context: context,
        ),
        child: BlocConsumer<PhotoPreviewBloc, PhotoPreviewState>(
          listener: (context, state) {
            if (state.status == PhotoUploaderStatus.error) {
              // Hiển thị lỗi
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message ?? 'Upload failed')),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hiển thị ảnh chụp
                Expanded(
                  child: Image.file(
                    File(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
                // Hiển thị trạng thái
                if (state.status == PhotoUploaderStatus.uploading)
                  const LinearProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.upload),
                    label: const Text('Upload Photo'),
                    onPressed: state.status == PhotoUploaderStatus.uploading
                        ? null
                        : () {
                            // Gửi sự kiện upload ảnh
                            context.read<PhotoPreviewBloc>().add(UploadPhoto(imagePath));
                          },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
