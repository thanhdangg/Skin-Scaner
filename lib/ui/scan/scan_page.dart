import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/ui/scan/bloc/scan_bloc.dart';
import 'package:skin_scanner/utils/enum.dart';

@RoutePage()
class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late ScanBloc _scanBloc;

  @override
  void initState() {
    super.initState();
    _scanBloc = ScanBloc(context: context);
  }

  @override
  void dispose() {
    _scanBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _scanBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Skin Scanner'),
        ),
        body: BlocBuilder<ScanBloc, ScanState>(
          builder: (context, state) {
            debugPrint('===State: ${state.status}');
            if (state.status == ScanStateStatus.uploading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == ScanStateStatus.uploaded) {
              return const Center(
                child: Text('Image uploaded successfully!'),
              );
            } else if (state.status == ScanStateStatus.error) {
              return const Center(
                child: Text('Failed to upload image'),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: state.filePath != null && state.filePath!.isNotEmpty
                        ? Image.file(File(state.filePath!))
                        : Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: const Center(
                              child: Text(
                                'No Image',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _scanBloc.add(TakePhoto());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Make Scan'),
                  ),
                ),
                if (state.filePath != null && state.filePath!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _scanBloc.add(UploadPhoto(state.filePath!));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text('Upload Photo'),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}