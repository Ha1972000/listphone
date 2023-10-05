import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:listphone/view/homescreen.dart';



void main() {
  debugPaintPointersEnabled = false;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const homeScreen(title: "title"),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    );
  }
}
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