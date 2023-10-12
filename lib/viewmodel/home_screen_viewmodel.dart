import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/contact.dart';
import 'base_viewmodel.dart'; // Import the base ViewModel

class HomeScreenViewModel extends BaseViewModel {
  // Add properties specific to this ViewModel.

  String _data = "Initial Data";
  String get data => _data;

  final List<Contact> contacts = [
    Contact('Anh', '013456789', null),
    Contact('An', '013456789', null),
    Contact('Bố', '013456789', null),
    Contact('Ba', '013456789', null),
    Contact('Bà', '013456789', null),
    Contact('Bạn', '013456789', null),
    Contact('Bè', '013456789', null),
    Contact('Yến', '013456789', null),
    Contact('Kiên', '013456789', null),
    Contact('Kem', '013456789', "Favourite"),
    Contact('K', '013456789', null),
  ];
  List<Contact> filteredContacts = [];

  // Example method to update data in the ViewModel.
  void updateListContact(String input) {
    filteredContacts = contacts
        .where((contact) =>
        contact.name.toLowerCase().contains(input.toLowerCase())).cast<Contact>()
        .toList();
    notifyListeners(); // Notify listeners of changes to update the UI.
  }
}
//   List<Contact> filteredContacts = [];
//
//   // Example method to update data in the ViewModel.
//   void updateListContact(String input) {
//     filteredContacts = contacts
//         .where((contact) =>
//         contact.name.toLowerCase().contains(input.toLowerCase())).cast<Contact>()
//         .toList();
//     Divider(
//       // Đường kẻ ngang
//       endIndent: 1,
//       height: 2.0,
//       color: Colors.black26,
//     );
//     notifyListeners(); // Notify listeners of changes to update the UI.
//   }
// }