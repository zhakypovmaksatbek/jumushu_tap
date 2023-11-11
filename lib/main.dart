import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meenet/feature/product/navigation/navigator_custom.dart';
import 'package:meenet/feature/product/navigation/navigator_manager.dart';
import 'package:meenet/feature/theme/project_theme.dart';
import 'package:meenet/feature/view/home/home_page.dart';
import 'package:meenet/firebase_options.dart';
import 'package:meenet/generated/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
          Locale('ky'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale(
          'ru',
        ),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ProjectTheme().projectTheme,
      darkTheme: ThemeData.dark(useMaterial3: true),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: LocaleKeys.project_name.tr(),
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
      home: const HomePage(),
    );
  }
}
