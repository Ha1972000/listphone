import 'package:flutter/material.dart';
import 'package:listphone/model/Contact.dart';

import '../viewmodel/home_screen_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class Contactt {
  final String name;
  final String phoneNumber;

  Contactt(this.name, this.phoneNumber);
}
HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
final List<Contact> contacts = <Contact>[];
void setInitationVariable() {
  homeScreenViewModel.filteredContacts = homeScreenViewModel.contacts;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactList(),
    );
  }
}

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Contactt> contacts = <Contactt>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh Bạ'),

      ),

      body:Container(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: IconButton(
                onPressed: () {
                  _addContact(context);
                },
                icon: Icon(Icons.add,color: Colors.red),

              ),
            ), ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].phoneNumber),
                );
              },
            ),

          ],
        ),
      )


    );
  }

  Future<void> _addContact(BuildContext context) async {
    final Contactt newContact = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddContact()),
    );

    if (newContact != null) {
      setState(() {
        contacts.add(newContact);
      });
    }
  }
}

class AddContact extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Liên Hệ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Tên'),
            ),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Số Điện Thoại'),
            ),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final String phoneNumber = phoneNumberController.text;
                final Contactt newContact = Contactt(name, phoneNumber);
                Navigator.pop(context, newContact);
              },
              child: Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }
}
