import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venille/core/middlewares/core.dart';
import 'package:venille/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/data/repositories/index.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/core/themes/theme_provider.dart';
import 'package:venille/core/utilities/translations.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:venille/data/repositories/common_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();

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

  final updateService = AppUpdateService();

  updateService.initialize();

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
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    rootRepository.initialize();

    _localization.init(mapLocales: [
      const MapLocale('en', AppLocale.EN),
      const MapLocale('ha', AppLocale.HA),
      const MapLocale('es', AppLocale.ES),
      const MapLocale('zh', AppLocale.ZH),
      const MapLocale('fr', AppLocale.FR),
    ], initLanguageCode: 'en');
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // translations: AppTranslations(),
      // locale: localStorage.read(LocalStorageSecrets.languageLocale) != null
      //     ? Locale(localStorage.read(LocalStorageSecrets.languageLocale))
      //     : const Locale('en'),
      // fallbackLocale: const Locale('en'),
      // supportedLocales: const [
      //   Locale('en'),
      //   Locale('fr'),
      //   Locale('zh'),
      //   Locale('es'),
      // ],
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      title: 'venille',
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.rootRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
