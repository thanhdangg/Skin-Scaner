import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_scanner/configs/locator.dart';
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
        photoBase64: base64Encode(await pickedFile.readAsBytes()),
      ));
    }
  }

  Future<void> _uploadPhoto(UploadPhoto event, Emitter<ScanState> emit) async {
    // emit(state.copyWith(status: ScanStateStatus.uploading));
    // final url = dotenv.env['CLOUDINARY_URL']!;
    // final uri = Uri.parse(url);

    // debugPrint('===uri: $uri');

    // final uploadPreset = dotenv.env['CLOUDINARY_UPLOAD_PRESET']!;
    // debugPrint('===uploadPreset: $uploadPreset');

    // final request = http.MultipartRequest('POST', Uri.parse(uri.toString()));
    // request.fields['upload_preset'] = uploadPreset;
    // request.files.add(await http.MultipartFile.fromPath('file', event.filePath));

    // final response = await request.send();
    // if (response.statusCode == 200) {
    //   debugPrint('===response: ${response.statusCode}');
    //   emit(state.copyWith(status: ScanStateStatus.uploaded));
    // } else {
    //   emit(state.copyWith(status: ScanStateStatus.error));
    // }
    emit(state.copyWith(status: ScanStateStatus.uploading));

    // Cloudinary API endpoint
    const cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/djwsawehq/image/upload';

    // Your upload preset
    const uploadPreset = 'PBL6_dang_cuong_trong';

    try {
      // Create Dio instance


      // Create form data with file and upload preset
      FormData formData = FormData.fromMap({
        'upload_preset': uploadPreset,
        'file': await MultipartFile.fromFile(event.filePath),
      });

      // Send POST request to Cloudinary
      Response response = await dio.post(cloudinaryUrl, data: formData);
    

      // Handle response
      if (response.statusCode == 200) {
        debugPrint('===response: ${response.data}');
        
        // Post response data to your server
        const serverUrl = 'https://thanhdang/url_image';
        Response serverResponse = await dio.post(serverUrl, data: response.data);

        if (serverResponse.statusCode == 200) {
          debugPrint('===server response: ${serverResponse.data}');
          emit(state.copyWith(status: ScanStateStatus.uploaded));
        } else {
          debugPrint('===server upload failed: ${serverResponse.statusCode}');
          emit(state.copyWith(status: ScanStateStatus.error));
        }
        
      } else {
        debugPrint('===upload failed: ${response.statusCode}');
        emit(state.copyWith(status: ScanStateStatus.error));
      }
    } catch (e) {
      debugPrint('===error: $e');
      emit(state.copyWith(status: ScanStateStatus.error));
    }
  }

  Future<void> _scanResult(ScanResult event, Emitter<ScanState> emit) async {}
}
