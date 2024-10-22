part of 'upload_bloc.dart';
abstract class UploadEvent {}

class ChooseImage extends UploadEvent{}

class UploadImage extends UploadEvent {
  final String filePath;
  UploadImage(this.filePath);
}


