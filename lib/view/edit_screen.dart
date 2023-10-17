import 'package:flutter/material.dart';
import '../model/Contact.dart';
import 'package:listphone/viewmodel/home_screen_viewmodel.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key, required this.data});
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  final Contact data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.white70,
        color: Colors.black12,
        child: Column(children: [
        Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Liên hệ",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
            Text('Sửa',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
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
          child:   Text(' ${data.name}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700)),
        ),
      ]),
      Expanded(child: SingleChildScrollView(
          child: Container(
              child: Column(
                  children: [
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
                                const EdgeInsets.only(right: 250, top: 5),
                                child:  Text(' ${data.name}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
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
                                const EdgeInsets.only(right: 250, top: 5),
                                child: Text("ngày sinh",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 230, top: 2),
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
                                const EdgeInsets.only(right: 250, top: 5),
                                child: Text("lễ kỉ niệm",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 230, top: 2),
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
                                    padding: const EdgeInsets.only(right: 270),
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
                          )),)
                  ]))
      ))])),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
