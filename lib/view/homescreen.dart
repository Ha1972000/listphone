import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:listphone/model/Contact.dart';
import 'package:listphone/view/damthoai_screen.dart';
import 'package:listphone/view/favourite_screen.dart';
import 'package:listphone/view/ganday_screen.dart';
import 'package:listphone/view/nhapso_screen.dart';
import 'package:listphone/view/second.dart';
import 'package:listphone/viewmodel/bottomSheet.dart';
import 'package:listphone/viewmodel/data/provider.dart';
import 'package:listphone/viewmodel/home_screen_viewmodel.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listphone/viewmodel/textfiled.dart';
import 'package:provider/provider.dart';
import 'package:listphone/viewmodel/bottomSheet.dart';
import 'package:listphone/view/damthoai_screen.dart';
import 'package:listphone/view/nhapso_screen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  int _currentIndex = 0;
  var tabColors = Colors.blue;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      // final String text = _controller.text.toLowerCase();
      // _controller.value = _controller.value.copyWith(
      //   text: text,
      //   selection:
      //       TextSelection(baseOffset: text.length, extentOffset: text.length),
      //   composing: TextRange.empty,
      // );
    });

    setInitationVariable();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final TextEditingController _textEditingController = TextEditingController();
  String _savedData = "";

  void _initializeMessage() {
    // Thay đổi trạng thái ở đây
    setState(() {
      _savedData = 'Hello, World!';
    });
  }

  void setInitationVariable() {
    String inputData = homeScreenViewModel.data;
    homeScreenViewModel.filteredContacts = homeScreenViewModel.contacts;
  }

  //banphim
  final FocusNode _focusNode = FocusNode();

  void showKeyboard() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneNumberController =
        TextEditingController();

    final dataProvider = Provider.of<DataProvider>(context);
    final dataList = dataProvider.dataList;
    final controllers = [
      ContactList(),
    ];
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          // child: controllers[_currentIndex]
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 320, top: 35, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ShowBottomSheet(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Màu nền của nút
                ),
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.setLocale(Locale('en', 'US'));
                // context.resetLocale();
                setState(() {});
              },
              onDoubleTap: () {
                context.setLocale(Locale('vi', 'VI'));
                // context.resetLocale();
                setState(() {});
              },
              child: Padding(
                padding: EdgeInsets.only(right: 250, top: 10, bottom: 10),
                child: Text("contact",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700))
                    .tr(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    homeScreenViewModel.updateListContact(query);
                  });
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
                    itemCount: homeScreenViewModel.filteredContacts.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(right: 330),
                            child: StickyHeader(
                              header: getItemIcon(index),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Second(
                                                  data: homeScreenViewModel
                                                          .filteredContacts[
                                                      index])));
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          homeScreenViewModel
                                              .filteredContacts[index].name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          // Text(dataList[index].name),
                        ],
                      );
                    }))
          ]),
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactList()));
                    },
                    child: Icon(
                      Icons.star,
                    ),
                  ),
                  label: 'Mục ưa thích',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                      onTap: () {
                        // keyboardType: TextInputType.phone;// Đặt kiểu bàn phím thành số điện thoại
                        // controller: _phoneNumberController,

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddContact()));
                      },
                      child: Icon(Icons.timelapse)),
                  label: 'Gần đây',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homeScreen()));
                      },
                      child: Icon(Icons.list_alt)),
                  label: 'Danh bạ',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyCustomKeyboard()));
                      },
                      child: Icon(Icons.confirmation_number)),
                  label: 'Bàn phím',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThuThoai()));
                      },
                      child: Icon(Icons.phone_rounded)),
                  label: 'Đàm thoại',
                ),
              ],
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ));
  }

  Widget getItemIcon(index) {
    //TODO:Change UI of this
    return (index == 0 ||
            homeScreenViewModel.filteredContacts[index].name[0] !=
                homeScreenViewModel.filteredContacts[index - 1].name[0])
        ? Container(
            height: 50.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Second(
                            data:
                                homeScreenViewModel.filteredContacts[index])));
              },
              child: Text(
                homeScreenViewModel.filteredContacts[index].name[0],
                style: const TextStyle(color: Colors.black26),
              ),
            ),
          )
        : Container(
            height: 0.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: InkWell(onTap: () {
              // Contact contact = Contact(name: '',group: "",phoneNum: "",birthDay: "",date: "");
              // var data;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Second(data: data),
              //   ),
              //
              // );
              Text(
                'Header #$index',
                style: const TextStyle(color: Colors.black26),
              );
            }),
          );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
