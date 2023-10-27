// import 'package:flutter/material.dart';
//
// import '../view/damthoai_screen.dart';
// import '../view/favourite_screen.dart';
// import '../view/ganday_screen.dart';
// import '../view/nhapso_screen.dart';
// class BottomNavigationBar extends StatelessWidget {
//   BottomNavigationBar homeScreenViewModel = BottomNavigationBar();
//   int _currentIndex = 0;
//   @override
//   void initState() {
//     setInitationVariable();
//     super.initState();
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   void setInitationVariable() {
//     homeScreenViewModel.filteredContacts = homeScreenViewModel.contacts;
//
//   }
// BottomNavigationBar buildBottomNavigationBar( BuildContext context) {
//   return BottomNavigationBar(
//     items: <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ContactList()),
//             );
//           },
//           child: Icon(Icons.star),
//         ),
//         label: 'Mục ưa thích',
//       ),
//       BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyHomePage()),
//             );
//           },
//           child: Icon(Icons.timelapse),
//         ),
//         label: 'Gần đây',
//       ),
//       BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyCustomKeyboard()),
//             );
//           },
//           child: Icon(Icons.list_alt),
//         ),
//         label: 'Danh bạ',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.confirmation_number),
//         label: 'Nhập số',
//       ),
//       BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ThuThoai()),
//             );
//           },
//           child: Icon(Icons.phone_rounded),
//         ),
//         label: 'Đàm thoại',
//       ),
//     ],
//     showSelectedLabels: true,
//     showUnselectedLabels: true,
//     type: BottomNavigationBarType.fixed,
//     currentIndex: _currentIndex,
//     onTap: (index) {
//       setState(() {
//         _currentIndex = index;
//       });
//     },
//   );
// }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
//
//
//
// // Usage in your build method
//
