import 'dart:io';

import 'package:flutter/material.dart';
import 'package:listphone/model/Contact.dart';
import 'package:listphone/view/second.dart';
import 'package:listphone/view/bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key, required String title});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  final List<Contact> contacts = [
    Contact('An', '013456789', "Favourite"),
    Contact('At', '013456789', "Favourite"),
    Contact('Ak', '013456789', "Favourite"),
    Contact('Bd', '013456789', "Favourite"),
    Contact('B3', '013456789', "Favourite"),
    Contact('B1', '013456789', "Favourite"),
    Contact('Bd', '013456789', "Favourite"),
    Contact('Bm', '013456789', "Favourite"),
    Contact('Ym', '013456789', "Favourite"),
    Contact('Km', '013456789', "Favourite"),
    Contact('K1', '013456789', "Favourite"),
    Contact('Km', '013456789', "Favourite"),
  ];

  List<Contact> filteredContacts = [];

  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    contacts.sort((a, b) => a.name.compareTo(b.name));

    // double topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 320, top: 35, bottom: 10),
            child: IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                _showBottomSheet(context);
                Text('Top Padding: ', style: TextStyle(color: Colors.black));
              },
              iconSize: 35,
              color: Colors.blueAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 250, top: 10, bottom: 10),
            child: Text("Liên hệ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (query) {
                filterContacts(query);
              },
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18, // Đặt kích thước phông chữ
                height:
                    0.5, // Đặt chiều cao dòng (điều này ảnh hưởng đến khoảng cách giữa các dòng)
              ),
              decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                // UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
                // border:
                //     OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Tìm kiếm',

                prefixIcon: Icon(Icons.search, size: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Divider(
              // Đường kẻ ngang
              endIndent: 1,
              height: 1.0,
              color: Colors.black26,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  // Điều này tạo ra một hình tròn
                  child: Image.asset(
                    "assets/ha.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      Text("Hà Cute",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w500)),
                      Text("Thẻ của tôi",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              // Đường kẻ ngang
              endIndent: 1,
              height: 2.0,
              color: Colors.black26,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                // Contact currentContact = contacts[index];
                final item = filteredContacts[index];

                Contact? previousContact =
                    index > 0 ? contacts[index - 1] : null;

                // Check if the current contact's name starts with a different letter
                bool isDifferentLetter = previousContact != null &&
                    item.name[0] != previousContact.name[0];

                return Column(children: <Widget>[
                  if (isDifferentLetter)
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      child: Divider(
                        // Đường kẻ ngang
                        height: 1.0,
                        color: Colors.black26,
                      ),
                    ),
                  ListTile(
                    title: Text(
                      item.name[0],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black26),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Divider(
                      // Đường kẻ ngang
                      endIndent: 1,
                      height: 1.0,
                      color: Colors.black26,
                    ),
                  ),
                  ListTile(
                    title: Text('Bố'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Second()),
                      );
                    },
                  ),
                  //   ListTile(
                  //
                  //
                  //     title: Text(item.name, style: TextStyle(
                  // fontSize: 18, fontWeight: FontWeight.w500),
                  // ),
                  //
                  //   ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                      left: 15,
                    ),
                    child: Divider(
                      // Đường kẻ ngang
                      endIndent: 1,
                      height: 1.0,
                      color: Colors.black26,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      item.group,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, top: 20),
                    child: Divider(
                      // Đường kẻ ngang
                      endIndent: 1,
                      height: 1.0,
                      color: Colors.black26,
                    ),
                  ),
                  // final item = filteredContacts[index];
                  // return Column(children: <Widget>[
                  //   ListTile(
                  //     title: Padding(
                  //       padding: const EdgeInsets.all(0.0),
                  //       child: Text(item.name,
                  //           style: TextStyle(
                  //               color: Colors.black26,
                  //               fontWeight: FontWeight.w700)),
                  //     ),
                  //     subtitle: Text(item.adress,
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w700)),
                  //   ),
                ]);
              },
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: 300,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black26, // Màu sắc của đường underline
              width: 1.0, // Độ dày của đường underline
            ),
          ), // Độ dày của đường underline
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.star,
                          size: 25,
                          color: Colors.black38,
                        ),
                      ),
                      Text("Mục ưa thích",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.timelapse,
                          size: 25,
                          color: Colors.black38,
                        ),
                      ),
                      Text("Gần đây",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.blue,
                        ),
                      ),
                      Text("Danh bạ",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.confirmation_number,
                          size: 25,
                          color: Colors.black38,
                        ),
                      ),
                      Text("Bàn phím",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.phone_rounded,
                          size: 25,
                          color: Colors.black38,
                        ),
                      ),
                      Text("Thư thoại",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class MyImageAccessScreen extends StatefulWidget {
//   @override
//   _MyImageAccessScreenState createState() => _MyImageAccessScreenState();
// }
//
// class _MyImageAccessScreenState extends State<MyImageAccessScreen> {
//
//   PermissionStatus _status = PermissionStatus.undetermined;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkPermissionStatus();
//   }
//
//   Future<void> _checkPermissionStatus() async {
//     final status = await Permission.photos.status;
//     setState(() {
//       _status = status;
//     });
//   }
//
//   Future<void> _requestPermission() async {
//     final status = await Permission.photos.request();
//     setState(() {
//       _status = status;
//     });
//   }
//
//   Future<void> _pickImage() async {
//     if (_status.isGranted) {
//       final picker = ImagePicker();
//       final image = await picker.getImage(source: ImageSource.gallery);
//
//       if (image != null) {
//         // Do something with the selected image
//         print('Image path: ${image.path}');
//       }
//     } else {
//       // Handle the case when permission is not granted
//       print('Permission not granted');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quyền truy cập ảnh'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Trạng thái quyền: $_status',
//               style: TextStyle(fontSize: 16),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_status.isUndetermined) {
//                   _requestPermission();
//                 } else {
//                   _pickImage();
//                 }
//               },
//               child: Text('Chọn ảnh'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _showBottomSheet extends StatelessWidget {
//
//   Future<void> _pickImage() async {
//   final picker = ImagePicker();
//   final image = await picker.getImage(source: ImageSource.gallery);
//
//   if (image != null) {
//     // Do something with the selected image
//     print('Image path: ${image.path}');
//   }
// }
class showBottomSheet extends StatefulWidget {
  const showBottomSheet({super.key, required String title});

  @override
  State<showBottomSheet> createState() => createState();
}

class _showBottomSheet extends State<showBottomSheet> {
  @override
  _showBottomSheet(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    Future<void> _pickImage() async {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          var _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Đặt isScrollControlled thành true
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black26,

            borderRadius: BorderRadius.circular(50.0), // Độ cong đường viền
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Hủy',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Liên hệ mới',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Xong',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.add_a_photo_outlined),
                      label: const Text(''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Họ",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: "Tên"),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: "Công ty"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                          Text("Thêm số điện thoại",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                          Text("Thêm email",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text("Nhạc chuông",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                          Text("             Mặc định",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
