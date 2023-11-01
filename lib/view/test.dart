// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController _phoneNumberController = TextEditingController();
//   bool _showClearButton = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _phoneNumberController.addListener(_updateClearButton);
//   }
//
//   void _updateClearButton() {
//     setState(() {
//       _showClearButton = _phoneNumberController.text.isNotEmpty;
//     });
//   }
//
//   void _onCallButtonPressed() {
//     // Xử lý sự kiện khi nút "Gọi" được nhấn
//     print("Số điện thoại: ${_phoneNumberController.text}");
//   }
//
//   void _onClearButtonPressed() {
//     _phoneNumberController.clear();
//     _updateClearButton();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Number Input'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: _phoneNumberController,
//               decoration: InputDecoration(
//                 hintText: 'Nhập số điện thoại...',
//               ),
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: _showClearButton
//                       ? IconButton(
//                     icon: Icon(Icons.clear),
//                     onPressed: _onClearButtonPressed,
//                   )
//                       : Container(),
//                 ),
//                 ElevatedButton(
//                   onPressed: _onCallButtonPressed,
//                   child: Text('Gọi'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
