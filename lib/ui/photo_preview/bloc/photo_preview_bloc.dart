import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';
import 'package:skin_scanner/utils/enum.dart';
import 'package:skin_scanner/utils/photo_uploader.dart';

part 'photo_preview_event.dart';
part 'photo_preview_state.dart';

class PhotoPreviewBloc extends Bloc<PhotoPreviewEvent, PhotoPreviewState> {
  final BuildContext context;
  PhotoPreviewBloc({required this.context}) : super(PhotoPreviewState.initial()) {
    on<UploadPhoto>(_uploadPhoto);
  }

Future<void> _uploadPhoto(UploadPhoto event, Emitter<PhotoPreviewState> emit) async {
  final photoUploader = PhotoUploader();
  emit(state.copyWith(status: PhotoUploaderStatus.uploading));

  try {
    final uploadResponse = await photoUploader.uploadImage(event.filePath);
    debugPrint('===Upload response: $uploadResponse');

    emit(state.copyWith(status: PhotoUploaderStatus.uploaded));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Upload cloud success')),
    );

    emit(state.copyWith(status: PhotoUploaderStatus.server_progress));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Wait for server response')),
    );

    final serverResponse = await photoUploader.sendToServer(uploadResponse);
    debugPrint('===Server response: $serverResponse');

    final parsedResponse = jsonDecode(serverResponse);

    emit(state.copyWith(status: PhotoUploaderStatus.success, serverResponse: parsedResponse));
    context.router.push(ResultRoute(serverResponse: parsedResponse));
  } catch (error) {
    debugPrint('===Error preview: $error');
    emit(state.copyWith(status: PhotoUploaderStatus.error, message: error.toString()));
  }
}

}