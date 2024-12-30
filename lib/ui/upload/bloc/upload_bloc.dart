import 'dart:async';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';
import 'package:skin_scanner/utils/enum.dart';
import 'package:skin_scanner/utils/photo_uploader.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final BuildContext context;

  UploadBloc({required this.context}) : super(UploadState.initial()) {
    on<ChooseImage>(_chooseImage);
    on<UploadImage>(_uploadPhoto);
  }

  Future<void> _uploadPhoto(
      UploadImage event, Emitter<UploadState> emit) async {
    emit(state.copyWith(status: ScanStateStatus.uploading));
    final photoUploader = PhotoUploader();

    try {
      final uploadResponse = await photoUploader.uploadImage(event.filePath);
      debugPrint('===Upload response: $uploadResponse');
      emit(state.copyWith(status: ScanStateStatus.uploaded));

      final serverResponse = await photoUploader.sendToServer(uploadResponse);
      debugPrint('===Server response: $serverResponse');
      final parsedResponse = jsonDecode(serverResponse);

      emit(state.copyWith(
          status: ScanStateStatus.success, serverResponse: parsedResponse));

      context.router.push(ResultRoute(serverResponse: parsedResponse));
    } catch (error) {
      debugPrint('===Error: $error');
      emit(state.copyWith(
          status: ScanStateStatus.error, message: error.toString()));
    }
  }

  Future<void> _chooseImage(
      ChooseImage event, Emitter<UploadState> emit) async {
    try {
      final picker = ImagePicker();
      final file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        emit(
          state.copyWith(
            status: ScanStateStatus.chooseImage,
            filePath: file.path,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ScanStateStatus.error,
            message: 'No image selected.',  
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ScanStateStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
