import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_scanner/data/repositories/scan_repository.dart';
import 'package:skin_scanner/utils/enum.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final BuildContext context;

  ScanBloc({required this.context}) : super(ScanState.initial()) {
    on<TakePhoto>(_takePhoto);
    on<UploadPhoto>(_uploadPhoto);
    on<ScanResult>(_scanResult);
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

    final scanRepository = ScanRepository();

    try {
      final uploadResponse = await scanRepository.uploadImage(event.filePath);
      debugPrint('===upload response: $uploadResponse');
      emit(
        state.copyWith(
          status: ScanStateStatus.uploaded,
        ),
      );
      
      final serverResponse = await scanRepository.postImageToServer(uploadResponse);
      debugPrint('===server Response: $serverResponse');
      emit(
        state.copyWith(
          status: ScanStateStatus.success,
          serverResponse: json.decode(serverResponse),
        ),
      );

    } catch (error) {
      debugPrint('===error: $error');
      emit(
        state.copyWith(
            status: ScanStateStatus.error, message: error.toString()),
      );
    }
  }

  Future<void> _scanResult(ScanResult event, Emitter<ScanState> emit) async {}
}
