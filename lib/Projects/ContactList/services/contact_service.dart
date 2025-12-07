import '../models/contact.dart';

class ContactService {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => List.unmodifiable(_contacts);
  bool get isEmpty => _contacts.isEmpty;

  void addContact(String name, String surname, String phone) {
    final contact = Contact(name: name, surname: surname, phone: phone);
    _contacts.add(contact);
  }

  void removeContact(String id) {
    _contacts.removeWhere((contact) => contact.id == id);
  }
  
  void updateContact(String id, Contact newContact) {
    final index = _contacts.indexWhere((contact) => contact.id == id);
    if (index != -1) {
      _contacts[index] = newContact;
    }
  }
}
