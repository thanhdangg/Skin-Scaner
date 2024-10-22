import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:skin_scanner/configs/locator.dart';

class ScanRepository {
  final http.Client httpClient;
  ScanRepository() : httpClient = getIt<http.Client>();

  Future<String> uploadImage(String filePath) async {
    const cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/djwsawehq/image/upload';
    const uploadPreset = 'PBL6_dang_cuong_trong';
    try{
      FormData formData = FormData.fromMap({
        'upload_preset': uploadPreset,
        'file': await MultipartFile.fromFile(filePath),
      });
      // Send POST request to Cloudinary
      Response response = await dio.post(cloudinaryUrl, data: formData);
      if (response.statusCode == 200){
        return response.data['url'].toString();
      }
      else {
        throw Exception('Failed to upload image');
      }
    }
    catch(e){
      throw Exception('Failed to upload image');
    }
  }

  Future<String> postImageToServer(String url) async{
    const serverUrl = 'https://lab-moving-grizzly.ngrok-free.app/predict/';
    try{
      Response serverResponse = await dio.post(
        serverUrl,
        data: {
          'url': url,
        },
      );
      if (serverResponse.statusCode == 200){
        return serverResponse.data.toString();
      }
      else {
        throw Exception('Failed to post image to server');
      }
    }
    catch(e){
      throw Exception('Failed to post image to server');
    }
  }
}