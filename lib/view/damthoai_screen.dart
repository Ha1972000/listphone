import 'package:flutter/material.dart';
import 'package:listphone/view/favourite_screen.dart';
import 'package:listphone/view/homescreen.dart';
import 'package:listphone/view/nhapso_screen.dart';

class ThuThoai extends StatefulWidget {
  const ThuThoai({super.key});

  @override
  State<ThuThoai> createState() => _ThuThoaiState();
}
class _ThuThoaiState extends State<ThuThoai> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 270),
              child: Text(
                "Thư thoại",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 270),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black26)),
                  child: TextButton(
                    onPressed: () {
                      // Define the action to be taken when the button is pressed
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white, // Text color
                      backgroundColor: Colors.white, // Button background color
                      padding:
                          EdgeInsets.all(16.0), // Padding around the button
                    ),
                    child: Text("Gọi thư thoại",
                        style: TextStyle(fontSize: 18, color: Colors.black26)),
                  ),
                ),
              ),
            ),
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
                                builder: (context) => AddContact()));
                      },
                      child: Icon(Icons.timelapse)),
                  label: 'Gần đây',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => homeScreen()));
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
                                builder: (context) =>
                                    homeScreen()));
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
