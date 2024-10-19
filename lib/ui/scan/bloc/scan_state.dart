part of 'scan_bloc.dart';
class ScanState {
  final ScanStateStatus status;
  final String? result;
  final String? photoBase64;
  final String? filePath;
  final Map<String, dynamic>? serverResponse;


  ScanState({
    required this.status,
    this.filePath,
    this.photoBase64,
    this.result,
    this.serverResponse,
  });

  factory ScanState.initial() => ScanState(
        status: ScanStateStatus.initial,
        result: '',
        filePath: '',
        photoBase64: '',
        serverResponse: null,
      );

  ScanState copyWith({
    ScanStateStatus? status,
    String? filePath,
    String? photoBase64,
    String? result,
    Map<String, dynamic>? serverResponse,
  }) {
    return ScanState(
      status: status ?? this.status,
      filePath: filePath?? this.filePath,
      photoBase64: photoBase64?? this.photoBase64,
      result: result,
      serverResponse: serverResponse?? this.serverResponse,
    );
  }
}