// import 'package:flutter/foundation.dart';
// import '../model/contact.dart';
// import 'base_viewmodel.dart'; // Import the base ViewModel
//
// class HomeScreenViewModel extends BaseViewModel {
//   // Add properties specific to this ViewModel.
//
//   String _data = "Initial Data";
//   String get data => _data;
//
//   final List<Contact> contacts = [
//     Contact('An', '013456789', "Favourite"),
//     Contact('At', '013456789', null),
//     Contact('Ak', '013456789', null),
//     Contact('Bd', '013456789', null),
//     Contact('B3', '013456789', null),
//     Contact('B1', '013456789', null),
//     Contact('Bd', '013456789', null),
//     Contact('Bm', '013456789', null),
//     Contact('Ym', '013456789', null),
//     Contact('Km', '013456789', null),
//     Contact('K1', '013456789', "Favourite"),
//     Contact('Km', '013456789', null),
//   ];
//   List<Contact> filteredContacts = [];
//
//   // Example method to update data in the ViewModel.
//   void updateListContact(String input) {
//     filteredContacts = contacts
//         .where((contact) =>
//         contact.name.toLowerCase().contains(input.toLowerCase())).cast<Contact>()
//         .toList();
//     notifyListeners(); // Notify listeners of changes to update the UI.
//   }
// }