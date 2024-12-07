import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/ui/upload/bloc/upload_bloc.dart';
import 'package:skin_scanner/utils/custom_toast.dart';
import 'package:skin_scanner/utils/enum.dart';
import 'package:skin_scanner/utils/photo_uploader.dart';

@RoutePage()
class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadBloc(
        context: context,
        photoUploader: PhotoUploader(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Image'),
        ),
        body: BlocListener<UploadBloc, UploadState>(
          listener: (context, state) {
            debugPrint('===Upload State: ${state.status}');
            if (state.status == ScanStateStatus.uploaded) {
              CustomToast.showSuccessToast("Image uploaded successfully.");
            } else if (state.status == ScanStateStatus.error) {
              CustomToast.showErrorToast("Error: ${state.message}");
            }
          },
          child: BlocBuilder<UploadBloc, UploadState>(
            builder: (context, state) {
              debugPrint('===State: ${state.status}');
              if (state.status == ScanStateStatus.uploading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<UploadBloc>().add(ChooseImage());
                    },
                    child: const Text('Choose Image'),
                  ),
                  if (state.filePath != null && state.filePath!.isNotEmpty)
                    Column(
                      children: [
                        Image.file(File(state.filePath!)),
                        ElevatedButton(
                          onPressed: () {
                            context.read<UploadBloc>().add(UploadImage(state.filePath!));
                          },
                          child: const Text('Upload Image'),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}