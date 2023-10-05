import 'package:flutter/material.dart';
import 'package:listphone/model/ItemModel.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key, required String title});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  final List<ItemModel> contacts = [
    ItemModel("A", "Anh"),
    ItemModel("B", "Bố Hải"),
    ItemModel("", "Bà"),
    ItemModel("C", "Cu Hùng"),
    ItemModel("M", "Mẹ"),
    ItemModel("", "My"),
    ItemModel("L", "Linh"),
    ItemModel("L", "Linh"),
    ItemModel("V", "Vân"),
  ];
  List<ItemModel> filteredContacts = [];

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 280, top: 10, bottom: 10),
            child: IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                Text("Liên hệ", style: TextStyle(color: Colors.black));
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
          TextField(
            onChanged: (query) {
              filterContacts(query);
            },
            style: TextStyle(
              fontSize: 15, // Đặt kích thước phông chữ
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
              hintText: 'Nhập từ khóa tìm kiếm',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Divider(
              // Đường kẻ ngang
              height: 1.0,
              color: Colors.grey,
            ),
          ),
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
          Container(
            height: 1,
            // width: 200,
            color: Colors.black12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                print("object");
                final item = filteredContacts[index];
                return Column(children: <Widget>[
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.name,
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w700)),
                    ),
                    subtitle: Text(item.adress,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                  Divider(
                    // Đường kẻ ngang
                    height: 1.0,
                    color: Colors.black26,
                  ),
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
