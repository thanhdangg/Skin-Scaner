part of 'scan_bloc.dart';
class ScanState {
  final ScanStateStatus status;
  final String? result;
  final String? photoBase64;
  final String? filePath;

  ScanState({
    required this.status,
    this.filePath,
    this.photoBase64,
    this.result,
  });

  factory ScanState.initial() => ScanState(
        status: ScanStateStatus.initial,
        result: '',
        filePath: '',
        photoBase64: '',
      );

  ScanState copyWith({
    ScanStateStatus? status,
    String? filePath,
    String? photoBase64,
    String? result,
  }) {
    return ScanState(
      status: status ?? this.status,
      filePath: filePath?? this.filePath,
      photoBase64: photoBase64?? this.photoBase64,
      result: result,
    );
  }
}