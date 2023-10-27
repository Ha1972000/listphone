// import 'dart:io';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:listphone/view/damthoai_screen.dart';
// import 'package:listphone/view/favourite_screen.dart';
// import 'package:listphone/view/ganday_screen.dart';
// import 'package:listphone/view/nhapso_screen.dart';
// import 'package:listphone/view/second.dart';
// import 'package:listphone/viewmodel/bottomSheet.dart';
// import 'package:listphone/viewmodel/home_screen_viewmodel.dart';
// import 'package:sticky_headers/sticky_headers.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:listphone/viewmodel/getItemcout.dart';
// import '../model/Contact.dart';
// import '../viewmodel/getItemcout.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _homeScreenState();
// }
// class _homeScreenState extends State<HomeScreen> {
//   HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
//   int _currentIndex = 0;
//   var tabColors = Colors.blue;
//   final List<Contact> contacts = <Contact>[];
//
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
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Column(children: [
//             Padding(
//               padding: EdgeInsets.only(left: 320, top: 35, bottom: 10),
//               child: IconButton(
//
//                 icon: new Icon(Icons.add),
//                 onPressed: () {
//                   ShowBottomSheet();
//                   Text('Top Padding: ', style: TextStyle(color: Colors.black));
//                 },
//                 iconSize: 35,
//                 color: Colors.blueAccent, onPressed: () {                //   Text("alo?");
//               },
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 context.setLocale(Locale('en', 'US'));
//                 // context.resetLocale();
//                 setState(() {});
//               },
//               onDoubleTap: () {
//                 context.setLocale(Locale('vi', 'VI'));
//                 // context.resetLocale();
//                 setState(() {});
//               },
//               child: Padding(
//                 padding: EdgeInsets.only(right: 250, top: 10, bottom: 10),
//                 child: Text("contact",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 30,
//                         fontWeight: FontWeight.w700))
//                     .tr(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextField(
//                 onChanged: (query) {
//                   setState(() {
//                     homeScreenViewModel.updateListContact(query);
//                   });
//                 },
//                 style: TextStyle(
//                   fontFamily: 'Arial',
//                   fontSize: 18, // Đặt kích thước phông chữ
//                   height:
//                   0.5, // Đặt chiều cao dòng (điều này ảnh hưởng đến khoảng cách giữa các dòng)
//                 ),
//                 decoration: InputDecoration(
//                   fillColor: Colors.black12,
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(10.0), // Border radius
//                   ),
//                   // UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                   // border:
//                   //     OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                   labelText: 'Tìm kiếm',
//
//                   prefixIcon: Icon(Icons.search, size: 20),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Divider(
//                 // Đường kẻ ngang
//                 endIndent: 1,
//                 height: 1.0,
//                 color: Colors.black26,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(50),
//                     // Điều này tạo ra một hình tròn
//                     child: Image.asset(
//                       "assets/ha.jpg",
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: const [
//                         Text("Hà Cute",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 23,
//                                 fontWeight: FontWeight.w500)),
//                         Text("Thẻ của tôi",
//                             style: TextStyle(
//                               color: Colors.black38,
//                               fontSize: 16,
//                             )),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               child: Divider(
//                 // Đường kẻ ngang
//                 endIndent: 1,
//                 height: 2.0,
//                 color: Colors.black26,
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: homeScreenViewModel.filteredContacts.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Divider(),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 330),
//                           child: StickyHeader(
//                             header: getItemIcon(context , index),
//                             content: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => Second(
//                                               data: homeScreenViewModel
//                                                   .filteredContacts[index])));
//                                 },
//                                 child: Text(
//                                   homeScreenViewModel
//                                       .filteredContacts[index].name,
//                                   style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         // ListTile(
//                         //   title: Text(contacts[index].name),
//                         //   subtitle: Text(contacts[index].phoneNumber),
//                         // ),
//                       ],
//                     );
//                   }),
//             )
//           ]),
//         ),
//         bottomNavigationBar: Container(
//           height: 60,
//           child: BottomNavigationBar(
//               items: <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ContactList()));
//                     },
//                     child: Icon(
//                       Icons.star,
//                     ),
//                   ),
//                   label: 'Mục ưa thích',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MyHomePage()));
//                       },
//                       child: Icon(Icons.timelapse)),
//                   label: 'Gần đây',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MyCustomKeyboard()));
//                       },
//                       child: Icon(Icons.list_alt)),
//                   label: 'Danh bạ',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.confirmation_number),
//                   label: 'Nhập số',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ThuThoai()));
//                       },
//                       child: Icon(Icons.phone_rounded)),
//                   label: 'Đàm thoại',
//                 ),
//               ],
//               showSelectedLabels: true,
//               showUnselectedLabels: true,
//               type: BottomNavigationBarType.fixed,
//               currentIndex: _currentIndex,
//               onTap: (index) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               }),
//         ));
//   }
//
//
// }
//
// @override
// Widget build(BuildContext context) {
//   // TODO: implement build
//   throw UnimplementedError();
// }
//





// import 'dart:io';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:listphone/view/damthoai_screen.dart';
// import 'package:listphone/view/favourite_screen.dart';
// import 'package:listphone/view/ganday_screen.dart';
// import 'package:listphone/view/nhapso_screen.dart';
// import 'package:listphone/view/second.dart';
// import 'package:listphone/viewmodel/home_screen_viewmodel.dart';
// import 'package:sticky_headers/sticky_headers.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../model/Contact.dart';
//
//
// class Contactt {
//   final String name;
//   final String phoneNumber;
//
//   Contactt(this.name, this.phoneNumber);
// }
// HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
// final List<Contact> contacts = <Contact>[];
// void setInitationVariable() {
//   homeScreenViewModel.filteredContacts = homeScreenViewModel.contacts;
// }
//
//
// class ContactList extends StatefulWidget {
//   @override
//   _ContactListState createState() => _ContactListState();
// }
//
// class _ContactListState extends State<ContactList> {
//   final List<Contactt> contacts = <Contactt>[];
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Danh Bạ'),
//       ),
//       body: Expanded(
//
//         child: ListView.builder(
//             itemCount: homeScreenViewModel.filteredContacts.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Divider(),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 330),
//                     child: StickyHeader(
//                       header: getItemIcon(index),
//                       content: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Second(
//                                         data: homeScreenViewModel
//                                             .filteredContacts[index])));
//                           },
//                           child: Text(
//                             homeScreenViewModel
//                                 .filteredContacts[index].name,
//                             style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // ListTile(
//                   //   title: Text(contacts[index].name),
//                   //   subtitle: Text(contacts[index].phoneNumber),
//                   // ),
//                 ],
//               );
//             }),
//       ),
//
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _addContact(context);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   Future<void> _addContact(BuildContext context) async {
//     final Contactt newContact = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddContact()),
//     );
//
//     if (newContact != null) {
//       setState(() {
//         contacts.add(newContact);
//       });
//     }
//   }
// }
// Widget getItemIcon(index ,context) {
//   //TODO:Change UI of this
//   return (index == 0 ||
//       homeScreenViewModel.filteredContacts[index].name[0] !=
//           homeScreenViewModel.filteredContacts[index - 1].name[0])
//       ? Container(
//     height: 50.0,
//     padding: EdgeInsets.symmetric(horizontal: 16.0),
//     alignment: Alignment.centerLeft,
//     child: InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Second(
//                     data:
//                     homeScreenViewModel.filteredContacts[index])));
//       },
//       child: Text(
//         homeScreenViewModel.filteredContacts[index].name[0],
//         style: const TextStyle(color: Colors.black26),
//       ),
//     ),
//   )
//       : Container(
//     height: 0.0,
//     padding: EdgeInsets.symmetric(horizontal: 16.0),
//     alignment: Alignment.centerLeft,
//     child: InkWell(onTap: () {
//       // Contact contact = Contact(name: '',group: "",phoneNum: "",birthDay: "",date: "");
//       // var data;
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => Second(data: data),
//       //   ),
//       //
//       // );
//       Text(
//         'Header #$index',
//         style: const TextStyle(color: Colors.black26),
//       );
//     }),
//   );
// }
//
//
// class AddContact extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Thêm Liên Hệ'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Tên'),
//             ),
//             TextField(
//               controller: phoneNumberController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(labelText: 'Số Điện Thoại'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final String name = nameController.text;
//                 final String phoneNumber = phoneNumberController.text;
//                 final Contactt newContact = Contactt(name, phoneNumber);
//                 Navigator.pop(context, newContact);
//               },
//               child: Text('Lưu'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

