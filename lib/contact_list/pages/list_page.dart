// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_application_default/contact_list/models/contact.dart';
import 'package:flutter_application_default/contact_list/provider/provider.dart';
import 'package:flutter_application_default/contact_list/routes/routes.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.cloud_download),
            onPressed: () => _loadContactsFromApi(context),
            tooltip: 'Загрузить контакты из API',
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutesName.createPage),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _loadContactsFromApi(BuildContext context) async {
    final provider = Provider.of<MyProvider>(context, listen: false);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Загрузка контактов'),
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text('Загружаем контакты из API...'),
          ],
        ),
      ),
    );
    try {
      await provider.loadContactsFromApi();
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Контакты успешно загружены из API!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при загрузке: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildBody() {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        return provider.isEmpty
            ? _emptyListWithApiButton(context)
            : _contactsBuilder(provider, context);
      },
    );
  }

  Widget _emptyListWithApiButton(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Нет контактов',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Добавьте контакт вручную или загрузите из API',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () => _loadContactsFromApi(context),
            icon: Icon(Icons.cloud_download),
            label: Text('Загрузить из API'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutesName.createPage),
            child: Text('Добавить вручную'),
          ),
        ],
      ),
    );
  }

  Widget _buildSwipeBackground() {
    return Container(
      decoration: BoxDecoration(borderRadius: .circular(20), color: Colors.red),
      alignment: .centerRight,
      margin: .symmetric(vertical: 12),
      padding: .only(right: 20),
      child: Icon(Icons.delete, color: Colors.white, size: 30),
    );
  }

  Widget _buildContactCard(Contact contact, BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 248, 219, 255),
      child: ListTile(
        key: Key(contact.id),
        title: Text(
          '${contact.name} ${contact.surname}',
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 21, 255),
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          contact.phone,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 0, 0),
            fontSize: 18,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            '${contact.name[0]}${contact.surname[0]}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: const Color.fromARGB(255, 255, 0, 0),
        ),
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutesName.viewPage,
          arguments: contact.id,
        ),
      ),
    );
  }

  Future<bool?> _showDeleteDialog(BuildContext context, Contact contact) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Удалить контакт?',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        content: Text('Вы уверены что хотите удалить ${contact.name}?'),
        actionsAlignment: .spaceEvenly,
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: .all(Color.fromARGB(255, 248, 219, 255)),
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Да'),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: .all(Color.fromARGB(255, 248, 219, 255)),
            ),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Нет'),
          ),
        ],
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String contactName) {
    Future.delayed(Duration.zero, () {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 350,
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Center(
              child: Text(
                'Контакт $contactName удален',
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
    });
  }

  Widget _buildDismissibleContact(
    Contact contact,
    MyProvider provider,
    BuildContext context,
  ) {
    return Dismissible(
      key: Key(contact.id),
      direction: .endToStart,
      confirmDismiss: (direction) async {
        final bool? result = await _showDeleteDialog(context, contact);

        if (result == true) {
          final contactName = contact.name;
          provider.removeContact(contact.id);
          _showSuccessSnackBar(context, contactName);
        }

        return result ?? false;
      },
      onDismissed: (direction) {},
      background: _buildSwipeBackground(),
      child: _buildContactCard(contact, context),
    );
  }

  Widget _contactsBuilder(MyProvider provider, BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: provider.contacts.length,
        itemBuilder: (context, index) {
          final contact = provider.contacts[index];
          return _buildDismissibleContact(contact, provider, context);
        },
      ),
    );
  }
}
