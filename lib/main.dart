import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_scanner/configs/app_route.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';
import 'package:skin_scanner/configs/locator.dart';
import 'package:skin_scanner/data/repositories/chat_repository.dart';
import 'package:skin_scanner/data/repositories/history_repository.dart';
import 'package:skin_scanner/data/repositories/login_repository.dart';
import 'package:skin_scanner/data/repositories/scan_repository.dart';
import 'package:skin_scanner/ui/chat/bloc/chat_bloc.dart';
import 'package:skin_scanner/ui/history/bloc/history_bloc.dart';
import 'package:skin_scanner/ui/home/bloc/home_bloc.dart';
import 'package:skin_scanner/ui/login/bloc/login_bloc.dart';
import 'package:skin_scanner/ui/photo_preview/bloc/photo_preview_bloc.dart';
import 'package:skin_scanner/ui/register/bloc/register_bloc.dart';
import 'package:skin_scanner/ui/upload/bloc/upload_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureSystemUI();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRoute>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ScanRepository(),
        ),
        RepositoryProvider(
          create: (context) => ChatRepository(),
        ),
        RepositoryProvider(
          create: (context) => LoginRepository(),
        ),
        RepositoryProvider(
          create: (context) => HistoryRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(context: context),
          ),
          BlocProvider<ChatBloc>(
            create: (context) => ChatBloc(context: context),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(context: context),
          ),
          BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(context: context),
          ),
          BlocProvider<PhotoPreviewBloc>(
            create: (context) => PhotoPreviewBloc(context: context),
          ),
          BlocProvider<UploadBloc>(
            create: (context) => UploadBloc(context: context),
          ),
          BlocProvider<HistoryBloc>(
            create: (context) => HistoryBloc(
              historyRepository: context.read<HistoryRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: "My App",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}

Future<void> configureSystemUI() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
  ));
}

Future<bool> checkLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}
