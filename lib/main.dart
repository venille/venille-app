import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venille/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/data/repositories/index.dart';
import 'package:venille/core/themes/theme_provider.dart';
import 'package:venille/data/repositories/common_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetStorage localStorage = GetStorage();

  final ThemeProvider themeProvider = Get.put(ThemeProvider());
  final RootRepository rootRepository = Get.put(RootRepository());
  final CommonRepository commonRepository = Get.put(CommonRepository());

  @override
  void initState() {
    rootRepository.initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'venille',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: const [
        Locale('en'),
      ],
      themeMode: ThemeMode.dark,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.rootRoute,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
