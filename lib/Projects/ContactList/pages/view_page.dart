import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_default/Projects/ContactList/routes/routes.dart';
import 'package:flutter_application_default/Projects/ContactList/provider/provider.dart';

class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        final contactId = ModalRoute.of(context)?.settings.arguments as String;
        final contact = provider.getContactById(contactId);
        if (contact == null) {
          return Center(child: Text('Контакт не найден'));
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Просмотр контакта'),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutesName.EditPage,
                  arguments: contact.id,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Удалить контакт?',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      content: Text(
                        'Вы уверены что хотите удалить ${contact.name}?',
                      ),
                      actionsAlignment: .spaceEvenly,
                      actions: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: .all(
                              Color.fromARGB(255, 248, 219, 255),
                            ),
                          ),
                          onPressed: () {
                            provider.removeContact(contact.id);
                            _showMessage(
                              context: context,
                              message: 'Контакт успешно удален',
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Да'),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: .all(
                              Color.fromARGB(255, 248, 219, 255),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Нет'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: .all(24),
            child: Column(
              children: [
                Card(
                  margin: .all(20),
                  color: const Color.fromARGB(255, 248, 219, 255),
                  child: Padding(
                    padding: .all(16),
                    child: Column(
                      children: [
                        _buildInfoRow(context, 'Имя', '${contact.name}'),
                        const Divider(),
                        _buildInfoRow(context, 'Фамилия', '${contact.surname}'),
                        const Divider(),
                        _buildInfoRow(context, 'Телефон', '${contact.phone}'),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: .all(10),
      child: Row(
        children: [
          Text('$label:', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(child: Text(value, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}

void _showMessage({required BuildContext context, String? message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: .floating,
      width: 350,
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: .circular(20)),
      content: Center(
        child: Text(
          message ?? 'No message',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      duration: Duration(seconds: 2),
    ),
  );
}
