part of 'photo_preview_bloc.dart';  
abstract class PhotoPreviewEvent {}

class UploadPhoto extends PhotoPreviewEvent {
  final String filePath;
  UploadPhoto(this.filePath); 
}