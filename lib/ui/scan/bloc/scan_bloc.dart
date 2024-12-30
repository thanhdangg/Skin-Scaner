import 'dart:async';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';
import 'package:skin_scanner/utils/enum.dart';
import 'package:skin_scanner/utils/photo_uploader.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final BuildContext context;
  final PhotoUploader photoUploader;

  ScanBloc({required this.context, required this.photoUploader}) : super(ScanState.initial()) {
    on<TakePhoto>(_takePhoto);
    on<UploadPhoto>(_uploadPhoto);
  }

  Future<void> _takePhoto(TakePhoto event, Emitter<ScanState> emit) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      emit(state.copyWith(
        status: ScanStateStatus.photoTaken,
        filePath: pickedFile.path,
      ));
    }
  }

  Future<void> _uploadPhoto(UploadPhoto event, Emitter<ScanState> emit) async {
    emit(state.copyWith(status: ScanStateStatus.uploading));

    try {
      final uploadResponse = await photoUploader.uploadImage(event.filePath);
      debugPrint('===Upload response: $uploadResponse');
      emit(state.copyWith(status: ScanStateStatus.uploaded));

      final serverResponse = await photoUploader.sendToServer(uploadResponse);
      debugPrint('===Server response: $serverResponse');
      final parsedResponse = jsonDecode(serverResponse);

      emit(state.copyWith(status: ScanStateStatus.success, serverResponse: parsedResponse));

      context.router.push(ResultRoute(serverResponse: parsedResponse));
    } catch (error) {
      debugPrint('===Error Scan: $error');
      emit(state.copyWith(status: ScanStateStatus.error, message: error.toString()));
    }
  }

}
