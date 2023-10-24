import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:listphone/model/Contact.dart';
import 'package:listphone/view/second.dart';
import 'package:listphone/viewmodel/data/provider.dart';
import 'package:listphone/viewmodel/home_screen_viewmodel.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listphone/viewmodel/data/provider.dart';
import 'package:provider/provider.dart';

class showBottomSheet extends StatefulWidget {
  const showBottomSheet({super.key, required String title});

  @override
  State<showBottomSheet> createState() => createState();
}

final TextEditingController _textEditingController = TextEditingController();
String _savedData = "";

// @override
// void initState() {
//   super.initState();
//   _initializeMessage();
// }
//
// void _initializeMessage() {
//   // Thay đổi trạng thái ở đây
//   setState(() {
//     _savedData = 'Hello, World!';
//   });
// }

HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

class ShowBottomSheet extends State<showBottomSheet> {
  @override
  _showBottomSheet(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    String inputData = homeScreenViewModel.data;
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
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true, // Đặt isScrollControlled thành true
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)), // Độ cong đường viền
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
                      ElevatedButton(
                        onPressed: () {
                          _showSaveDialog(context);
                        },
                        child: Text('Đã lưu: $_savedData'),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(
                        Icons.account_circle_sharp,
                        size: 100,
                        color: Colors.black,
                      ),
                      label: const Text(''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Text("Thêm ảnh",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
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
                          color: Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Họ",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: _textEditingController,
                            onChanged: (value) {
                              setState(() {
                                _savedData = value;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Công ty",
                              border: InputBorder.none,
                            ),
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
                      color: Colors.black12,
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
                      color: Colors.black12,
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
                      color: Colors.black12,
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

  void _showSaveDialog(BuildContext context) {
    if (_textEditingController.text.isNotEmpty) {
      setState(() {
        _savedData = _textEditingController.text;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Thông báo'),
            content: Text('Đã lưu: $_savedData'),
            actions: <Widget>[
              TextButton(
                child: Text('Đóng'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
