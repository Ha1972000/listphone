import 'dart:io';

import 'package:flutter/material.dart';
import 'package:listphone/view/edit_screen.dart';
import 'package:listphone/viewmodel/home_screen_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import '../model/Contact.dart';

class ListScreen extends StatelessWidget {
  final Contact data;

  ListScreen({Key? key, required this.data});

  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  void setInitationVariable() {
    homeScreenViewModel.filteredContacts = homeScreenViewModel.contacts;
  }

  Future<void> _requestPhoneCallPermission() async {
    print("DUONGNA _requestPhoneCallPermission");
    var status = await Permission.phone.request();
    if (status.isGranted) {
      // Quyền đã được cấp, bạn có thể thực hiện cuộc gọi ở đây.
      await launch('tel:+0984512402');
    } else if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.phone].request();
    } else if (status.isPermanentlyDenied) {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.phone].request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // color: Colors.white70,
        color: Colors.black12,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Liên hệ",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditScreen(
                                  data: data,
                                )),
                      );
                    },
                    child: Text('Sửa',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            Column(children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  // Điều này tạo ra một hình tròn
                  child: Image.asset(
                    "assets/ha.jpg",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(' ${data.name}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700)),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      width: 80,
                      height: 50,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            width: 80,
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: SizedBox(
                                    width: 20,
                                    height: 30,
                                    child: IconButton(
                                        color: Colors.black,
                                        icon: const Icon(
                                          Icons.messenger,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          _showBottomSheet(
                                              context, data); // Pass 'data'
                                        }),
                                  ),
                                ),
                                Text("nhắn tin",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      width: 80,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                              width: 20,
                              height: 30,
                              child: IconButton(
                                color: Colors.black,
                                icon: const Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                ),
                                onPressed: _requestPhoneCallPermission,
                              ),
                            ),
                          ),
                          Text("Gọi",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      width: 80,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.video_camera_front,
                              color: Colors.blue,
                            ),
                            Text("video",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      width: 80,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.blue,
                            ),
                            Text("gửi thư",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                        height: 60,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 60,
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: InkWell(
                                onTap: () {
                                  _requestPhoneCallPermission(); // Gọi hàm này khi container được nhấn
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 270),
                                      child: Text("điện thoại",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 260),
                                      child: Text(
                                        ' ${data.phoneNum}',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 60,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 270, top: 5),
                                child: Text("ngày sinh",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 260, top: 2),
                                child: Text("6 tháng 10",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.blue,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 60,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 270, top: 5),
                                child: Text("lễ kỉ niệm",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 260, top: 2),
                                child: Text("6 tháng 10",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.blue,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          height: 80,
                          width: 380,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 290),
                                    child: Text("ghi chú",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: '',
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors
                                                .transparent), // Đặt màu trong suốt
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: InkWell(
                              onTap: () {
                                _showBottomSheet(context, data); //
                              },
                              child: Container(
                                height: 40,
                                width: 380,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Gửi Tin Nhắn",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: InkWell(
                              onTap: () {
                                _showShareBottomSheet(context, data);
                              },
                              child: Container(
                                height: 40,
                                width: 380,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Chia sẻ liên hệ",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: Container(
                              height: 40,
                              width: 380,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Thêm vào mục ưa thích",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 40,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Thêm vào liên hệ khẩn cấp",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: 40,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Chia sẻ vị trí của tôi",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Chặn người gọi này",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

void _showBottomSheet(BuildContext context, Contact data) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return TextMessageBottomSheet(data: data); // Pass the 'data' object.
    },
  );
}

void _showShareBottomSheet(BuildContext context, Contact data) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return ShareBottomSheet(
          data: data); // Pass the 'data' object to the bottom sheet.
    },
  );
}

class ShareBottomSheet extends StatelessWidget {
  final Contact data;

  ShareBottomSheet({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260, // Set the height according to your needs.
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Column(
          children: [
            Row(
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 2),
                      child: Text(' ${data.name}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 2),
                      child: Text("Thẻ liên hệ"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200, top: 2, bottom: 5),
                  child: IconButton(
                      icon: Icon(Icons.dangerous),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 5),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset("assets/airdrop.png",
                            width: 35, height: 35),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context); // Tắt BottomSheet
                              shareToFacebook();
                            },
                            child: Text('Airdrop')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset("assets/tinnhan.png",
                            width: 35, height: 35),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context); // Tắt BottomSheet
                              shareToFacebook();
                            },
                            child: Text('Tin nhắn')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset("assets/zalo.png", width: 35, height: 35),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context); // Tắt BottomSheet
                              shareToZalo();
                            },
                            child: Text('Zalo')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset("assets/messenger.png",
                            width: 35, height: 35),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context); // Tắt BottomSheet
                              shareToEmail();
                            },
                            child: Text('Messenger')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset("assets/google.png", width: 35, height: 35),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context); // Tắt BottomSheet
                              shareToGoogle();
                            },
                            child: Text('Google')),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Lưu vào tệp",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child:
                        Image.asset("assets/file.png", width: 30, height: 30),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void shareToZalo() {}

void shareToEmail() {}

void shareToGoogle() {}

void shareToFacebook() {}

class TextMessageBottomSheet extends StatelessWidget {
  final Contact data;

  TextMessageBottomSheet({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

    void setInitationVariable() {
      homeScreenViewModel.filteredContacts = homeScreenViewModel.contacts;
    }

    final double height;
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)), // Độ cong đường viền
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    'Tin nhắn mới',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Hủy',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Divider(
                    // Đường kẻ ngang
                    endIndent: 1,
                    height: 2.0,
                    color: Colors.black26,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        ' Người nhận : ${data.name}',
                        // 'Người nhận :$text',
                      ),
                    ),
                  ),
                  Divider(
                    // Đường kẻ ngang
                    endIndent: 1,
                    height: 2.0,
                    color: Colors.black26,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 380),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.camera_alt_outlined),
                            onPressed: () {
                              // Add your camera button logic here.
                            },
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Tin nhắn văn bản',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
