import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:listphone/view/home_screen.dart';

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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const homeScreen(title: "title"),
    );
  }
}

/*class _Home extends StatelessWidget {
  const _Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}*/
//
// class _Item extends StatelessWidget {
//   const _Item({
//     Key? key,
//     required this.text,
//     required this.builder,
//   }) : super(key: key);
//
//   final String text;
//   final WidgetBuilder builder;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.blue,
//       child: InkWell(
//         onTap: () =>
//             Navigator.push(context, MaterialPageRoute(builder: builder)),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           child: Text(
//             text,
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }