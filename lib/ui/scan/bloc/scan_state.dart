part of 'scan_bloc.dart';
class ScanState {
  final ScanStateStatus status;
  final String? result;
  final String? filePath;
  final Map<String, dynamic>? serverResponse;
  final String? message;


  ScanState({
    required this.status,
    this.filePath,
    this.result,
    this.serverResponse,
    this.message,
  });

  factory ScanState.initial() => ScanState(
        status: ScanStateStatus.initial,
        result: '',
        filePath: '',
        serverResponse: null,
        message: '',
      );

  ScanState copyWith({
    ScanStateStatus? status,
    String? filePath,
    String? result,
    Map<String, dynamic>? serverResponse,
    String? message,
  }) {
    return ScanState(
      status: status ?? this.status,
      filePath: filePath?? this.filePath,
      result: result,
      serverResponse: serverResponse?? this.serverResponse,
      message: message?? this.message,
    );
  }
}