part of 'upload_bloc.dart';
class UploadState {
  final ScanStateStatus status;
  final String? result;
  final String? filePath;
  final Map<String, dynamic>? serverResponse;
  final String? message;

  UploadState({
    required this.status,
    this.filePath,
    this.result,
    this.serverResponse,
    this.message,
  });

  factory UploadState.initial() => UploadState(
        status: ScanStateStatus.initial,
        result: '',
        filePath: '',
        serverResponse: null,
        message: '',
      );

  UploadState copyWith({
    ScanStateStatus? status,
    String? filePath,
    String? result,
    Map<String, dynamic>? serverResponse,
    String? message,
  }) {
    return UploadState(
      status: status ?? this.status,
      filePath: filePath?? this.filePath,
      result: result,
      serverResponse: serverResponse?? this.serverResponse,
      message: message?? this.message,
    );
  }
}