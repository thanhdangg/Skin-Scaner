part of 'scan_bloc.dart';
abstract class ScanEvent { 
}
class TakePhoto extends ScanEvent {
  TakePhoto();
}

class UploadPhoto extends ScanEvent {
  final String filePath;
  UploadPhoto(this.filePath);
}

class ScanResult extends ScanEvent {
  final String result;
  ScanResult(this.result);
}