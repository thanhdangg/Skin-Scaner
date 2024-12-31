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
            } else if (state.status == PhotoUploaderStatus.uploaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Upload cloud success')),
              );
            } else if (state.status == PhotoUploaderStatus.server_progress) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Wait for server response')),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.file(
                    File(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
                if (state.status == PhotoUploaderStatus.uploading || state.status == PhotoUploaderStatus.server_progress)
                  const LinearProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.upload),
                    label: const Text('Upload Photo'),
                    onPressed: state.status == PhotoUploaderStatus.uploading
                        ? null
                        : () {
                            context
                                .read<PhotoPreviewBloc>()
                                .add(UploadPhoto(imagePath));
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
