import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:listphone/view/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  debugPaintPointersEnabled = false;
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('vi', 'VI'), Locale('en', 'US')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('vi', 'VI'),
        child: App()
    ),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeScreen(),
    );
  }
}