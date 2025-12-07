import 'package:flutter/material.dart';
import '../models/api_user.dart';
import '../services/api_user_service.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter_application_default/Projects/ContactList/models/contact.dart';
import 'package:flutter_application_default/Projects/ContactList/services/contact_service.dart';

class MyProvider extends ChangeNotifier {
  final ContactService _contactService = ContactService();
  final Uuid uuid = Uuid();

  List<Contact> get contacts => _contactService.contacts;
  bool get isEmpty => _contactService.isEmpty;
  Contact get lastContact => _contactService.contacts.last;

  void addContact(String name, String surname, String phone) {
    _contactService.addContact(name, surname, phone);
    notifyListeners();
  }

  void removeContact(String id) {
    _contactService.removeContact(id);
    notifyListeners();
  }

  Contact? getContactById(String id) {
    try {
      return _contactService.contacts.firstWhere((contact) => contact.id == id);
    } catch (e) {
      return null;
    }
  }

  void updateContact({
    required String id,
    String? name,
    String? surname,
    String? phone,
  }) {
    final contact = getContactById(id);
    if (contact != null) {
      final newContact = contact.copyWith(
        name: name,
        surname: surname,
        phone: phone,
      );

      _contactService.updateContact(
        id,
        newContact,
      ); // ✅ используем метод сервиса
      notifyListeners();
    }
  }

  Future<void> loadContactsFromApi() async {
    try {
      final List<ApiUser> apiUsers = await ApiUserService.getApiUsers();
      for (final apiUser in apiUsers) {
        final contact = Contact(
          name: apiUser.name.split(' ').first, 
          surname: apiUser.surname, 
          phone: apiUser.phone,
        );
        _contactService.addContact(contact.name, contact.surname, contact.phone);
        notifyListeners();
      }
    } catch (e) {
      throw Exception('Не удалось загрузить контакты: $e');
    }
  }
  
 void addApiUserAsContact(ApiUser apiUser) {
    final contact = Contact(
      name: apiUser.name.split(' ').first,
      surname: apiUser.surname,
      phone: apiUser.phone,
    );
    _contactService.addContact(contact.name, contact.surname, contact.phone);
    notifyListeners();
  }
}
