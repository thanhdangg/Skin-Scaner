import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';
import 'package:skin_scanner/ui/upload/bloc/upload_bloc.dart';
import 'package:skin_scanner/utils/custom_toast.dart';
import 'package:skin_scanner/utils/enum.dart';

@RoutePage()
class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadBloc(
        context: context,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Image'),
        ),
        body: BlocListener<UploadBloc, UploadState>(
          listener: (context, state) {
            if (state.status == ScanStateStatus.chooseImage &&
                state.filePath != null &&
                state.filePath!.isNotEmpty) {
              // Navigate to PhotoPreviewPage when an image is selected
              context.router.push(
                PhotoPreviewRoute(imagePath: state.filePath!),
              );
            } else if (state.status == ScanStateStatus.error) {
              CustomToast.showErrorToast("Error: ${state.message}");
            }
          },
          child: BlocBuilder<UploadBloc, UploadState>(
            builder: (context, state) {
              Future.microtask(() {
                context.read<UploadBloc>().add(ChooseImage());
              });

              return const Center(
                child: Text('Loading gallery...'),
              );
            },
          ),
        ),
      ),
    );
  }
}
