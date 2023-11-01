// import 'package:flutter/material.dart';
// import 'package:listphone/view/edit_screen.dart';
// import 'package:listphone/view/favourite_screen.dart';
// import 'package:listphone/view/homescreen.dart';
// import 'package:listphone/view/keyboard_screen.dart';
// import 'package:listphone/viewmodel/home_screen_viewmodel.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:listphone/view/edit_screen.dart';
// import '../model/Contact.dart';
// import '../viewmodel/customKeyBroad.dart';
// // class CustomKeyboard extends StatefulWidget {
// //
//
//     class CustomKeyboard extends StatefulWidget {
//       final Function(String) onKeyPressed;
//       final Function() onBackspacePressed;
//       final TextEditingController _phoneNumberController = TextEditingController();
//       CustomKeyboard(
//           {required this.onKeyPressed, required this.onBackspacePressed});
//
//       Future<void> _requestPhoneCallPermission() async {
//         print("DUONGNA _requestPhoneCallPermission");
//         var status = await Permission.phone.request();
//         if (status.isGranted) {
//           // Quyền đã được cấp, bạn có thể thực hiện cuộc gọi ở đây.
//           await launch('tel:+0984512402');
//         } else if (status.isDenied) {
//           Map<Permission, PermissionStatus> statuses =
//           await [Permission.phone].request();
//         } else if (status.isPermanentlyDenied) {
//           Map<Permission, PermissionStatus> statuses =
//           await [Permission.phone].request();
//         }
//       }
//
//       @override
//     _CustomKeyboardState createState() => _CustomKeyboardState();
//     }
//
//     class _CustomKeyboardState extends State<CustomKeyboard> {
//
//       String inputValue = ''; // Giá trị để lưu nội dung nhập từ bàn phím tùy chỉnh
//       void onKeyPressed(String key) {
//         setState(() {
//           inputValue += key; // Cập nhật giá trị TextField khi một phím được nhấn
//         });
//       }
//
//       void onBackspacePressed() {
//         setState(() {
//           if (inputValue.isNotEmpty) {
//             inputValue = inputValue.substring(
//                 0, inputValue.length - 1); // Loại bỏ ký tự cuối cùng
//           }
//         });
//       }
//
//       int _currentIndex = 0;
//
//       void _onItemTapped(int index) {
//         setState(() {
//           _currentIndex = index;
//         });
//       }
//       TextEditingController _phoneNumberController = TextEditingController();
//       bool _showClearButton = false;
//
//       @override
//       void initState() {
//         super.initState();
//
//         // Listen to changes in the TextField to show/hide the clear button
//         _phoneNumberController.addListener(() {
//           setState(() {
//             _showClearButton = _phoneNumberController.text.isNotEmpty;
//           });
//         });
//       }
//
//       @override
//       void dispose() {
//         _phoneNumberController.dispose();
//         super.dispose();
//       }
//
//       void _clearPhoneNumber() {
//         setState(() {
//           _phoneNumberController.clear();
//           _showClearButton = false;
//         });
//       }
//
//
//     @override
//     Widget build(BuildContext context) {
//
//       return Padding(
//         padding: const EdgeInsets.only(top: 5),
//         child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(bottom: 3),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('1', onKeyPressed),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('2', onKeyPressed),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('3', onKeyPressed),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 3),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('4', onKeyPressed),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('5', onKeyPressed),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('6', onKeyPressed),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 3),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('7', onKeyPressed),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('8', onKeyPressed),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('9', onKeyPressed),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 3),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('*', onKeyPressed),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('0', onKeyPressed),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: CustomKeyButton('#', onKeyPressed),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextField(
//                         controller: _phoneNumberController,
//                         decoration: InputDecoration(
//                           hintText: 'Nhập số điện thoại...',
//                         ),
//                       ),
//                     ),
//                     _showClearButton
//                         ? IconButton(
//                       icon: Icon(Icons.clear),
//                       onPressed: _clearPhoneNumber,
//                     )
//                         : SizedBox(), // Use SizedBox to maintain layout
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ]));
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
