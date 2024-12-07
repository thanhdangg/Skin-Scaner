import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/ui/scan/bloc/scan_bloc.dart';
import 'package:skin_scanner/utils/custom_toast.dart';
import 'package:skin_scanner/utils/enum.dart';
import 'package:skin_scanner/utils/photo_uploader.dart';

@RoutePage()
class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanBloc(
        context: context,
        photoUploader: PhotoUploader(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Skin Scanner'),
        ),
        body: BlocListener<ScanBloc, ScanState>(
          listener: (context, state) {
            if (state.status == ScanStateStatus.uploaded) {
              CustomToast.showSuccessToast("Image uploaded successfully.");
            } else if (state.status == ScanStateStatus.error) {
              CustomToast.showErrorToast("Error: ${state.message}");
            }
          },
          child: BlocBuilder<ScanBloc, ScanState>(
            builder: (context, state) {
              debugPrint('=== Scan State: ${state.status}');
              if (state.status == ScanStateStatus.uploading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ScanBloc>().add(TakePhoto());
                    },
                    child: const Text('Open Camera'),
                  ),
                  if (state.filePath != null && state.filePath!.isNotEmpty)
                    Column(
                      children: [
                        Image.file(File(state.filePath!)),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<ScanBloc>()
                                .add(UploadPhoto(state.filePath!));
                          },
                          child: const Text('Upload Photo'),
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
