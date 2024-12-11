part of 'photo_preview_bloc.dart';  

class PhotoPreviewState {
  final PhotoUploaderStatus status; 
  final String? filePath;
  final String? message;
  final Map<String, dynamic>? serverResponse;

  PhotoPreviewState({
    required this.status,
    this.filePath,
    this.message,
    this.serverResponse,
  });

  factory PhotoPreviewState.initial() => PhotoPreviewState(
    status: PhotoUploaderStatus.initial,
    filePath: null,
    message: null,
    serverResponse: null,
  );  
  PhotoPreviewState copyWith
  ({
    PhotoUploaderStatus? status,
    String? filePath,
    String? message,
    Map<String, dynamic>? serverResponse,
  }) {
    return PhotoPreviewState(
      status: status ?? this.status,
      filePath: filePath ?? this.filePath,
      message: message ?? this.message,
      serverResponse: serverResponse,
    );
  }
}