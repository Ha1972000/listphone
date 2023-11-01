import 'package:flutter/material.dart';
import 'package:listphone/view/edit_screen.dart';
import 'package:listphone/view/favourite_screen.dart';
import 'package:listphone/view/homescreen.dart';
import 'package:listphone/view/keyboard_screen.dart';
import 'package:listphone/viewmodel/home_screen_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:listphone/view/edit_screen.dart';
import '../model/Contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCustomKeyboard(),
    );
  }
}

class MyCustomKeyboard extends StatefulWidget {
  @override
  _MyCustomKeyboardState createState() => _MyCustomKeyboardState();
}

class _MyCustomKeyboardState extends State<MyCustomKeyboard> {
  String inputValue = ''; // Giá trị để lưu nội dung nhập từ bàn phím tùy chỉnh
  void onKeyPressed(String key) {
    setState(() {
      inputValue += key; // Cập nhật giá trị TextField khi một phím được nhấn
    });
  }

  void onBackspacePressed() {
    setState(() {
      if (inputValue.isNotEmpty) {
        inputValue = inputValue.substring(
            0, inputValue.length - 1); // Loại bỏ ký tự cuối cùng
      }
    });
  }

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  TextEditingController _phoneNumberController = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();

    // Listen to changes in the TextField to show/hide the clear button
    _phoneNumberController.addListener(() {
      setState(() {
        _showClearButton = _phoneNumberController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _clearPhoneNumber() {
    setState(() {
      _phoneNumberController.clear();
      _showClearButton = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70, right: 50, left: 50),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                controller: TextEditingController(text: inputValue),
                readOnly:
                    true, // Đảm bảo người dùng không thể chỉnh sửa trực tiếp
              ),
            ),
            CustomKeyboard(
                onKeyPressed: onKeyPressed,
                onBackspacePressed: onBackspacePressed),
          ],
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
                                builder: (context) => ContactList()));
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
                                builder: (context) => HomeScreen()));
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
                                builder: (context) => HomeScreen()));
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
                                builder: (context) => MyCustomKeyboard()));
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
}

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;
  final Function() onBackspacePressed;
  final TextEditingController _phoneNumberController = TextEditingController();

  CustomKeyboard(
      {required this.onKeyPressed, required this.onBackspacePressed});

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('1', onKeyPressed),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('2', onKeyPressed),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('3', onKeyPressed),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('4', onKeyPressed),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('5', onKeyPressed),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('6', onKeyPressed),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('7', onKeyPressed),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('8', onKeyPressed),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('9', onKeyPressed),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('*', onKeyPressed),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('0', onKeyPressed),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomKeyButton('#', onKeyPressed),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                      // border: Border.all(),
                    ),
                    child: SizedBox(
                      width: 20,
                      height: 30,
                      child: IconButton(
                        color: Colors.black,
                        icon: const Icon(
                          Icons.call,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _requestPhoneCallPermission;

                        },

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(50),
                      // border: Border.all(),
                    ),
                    child: SizedBox(
                      width: 20,
                      height: 30,
                      child: IconButton(
                        color: Colors.black,
                        icon: const Icon(
                          Icons.clear,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {
                        },
                      ),
                    ),
                  ),
                ),
              ],

            )),
      ],
    );
  }
}

class CustomKeyButton extends StatelessWidget {
  final String label;
  final Function(String) onPressed;

  CustomKeyButton(this.label, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(
            label); // Call the callback function with the label when tapped.
      },
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
