import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:skin_scanner/configs/app_route.dart';
import 'package:skin_scanner/configs/locator.dart';
import 'package:skin_scanner/data/repositories/chat_repository.dart';
import 'package:skin_scanner/data/repositories/scan_repository.dart';
import 'package:skin_scanner/ui/chat/bloc/chat_bloc.dart';
import 'package:skin_scanner/ui/home/bloc/home_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // transparent status bar
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black));
  setupLocator();
  try {
    await dotenv.load(fileName: "/.env");
  } catch (e) {
    debugPrint("===error loading env file: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(context: context),
          ),
          BlocProvider<ChatBloc>(
            create: (context) => ChatBloc(context: context),
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
