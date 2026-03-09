import 'package:flutter/material.dart';
import 'package:flutter_application_default/contact_list/provider/provider.dart';
import 'package:flutter_application_default/contact_list/routes/routes.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  CreatePageState createState() => CreatePageState();
}

class CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Создание контакта'), centerTitle: true),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: .all(50),
          children: [
            _buildNameField(),
            const SizedBox(height: 16),
            _buildSurnameField(),
            const SizedBox(height: 16),
            _buildPhoneField(),
            const SizedBox(height: 20),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: _buildInputDecoration('Your name', Icons.person),
      validator: _validateName,
    );
  }

  Widget _buildSurnameField() {
    return TextFormField(
      controller: _surnameController,
      decoration: _buildInputDecoration('Your surname', Icons.person_2),
      validator: _validateSurname,
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: _phoneController,
      decoration: _buildInputDecoration('Your phone', Icons.phone),
      validator: (value) => _validatePhone(value)
          ? null
          : 'Phone number must be entered as X(XXX)XXX-XX-XX',
      keyboardType: TextInputType.phone,
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 41, 173, 255),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Color.fromARGB(255, 255, 4, 4), width: 2),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () => _submitForm(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('Submit Form', style: TextStyle(color: Colors.white)),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<MyProvider>(context, listen: false);
      provider.addContact(
        _nameController.text,
        _surnameController.text,
        _phoneController.text,
      );
      debugPrint(
        'Данные: ${_nameController.text}, ${_surnameController.text}, ${_phoneController.text}',
      );
      _showMessage(
        context: context,
        message: 'Контакт ${_nameController.text} создан',
      );

      final newContact = provider.lastContact;
      Navigator.pushReplacementNamed(
        context,
        AppRoutesName.viewPage,
        arguments: newContact.id,
      );
    } else {
      _showMessage(
        context: context,
        message: 'Form is not valid! Please review and correct',
      );
    }
  }
}

String? _validateName(String? value) {
  final nameExp = RegExp(r'^[A-Za-z ]+$');
  if (value == null || value.isEmpty) {
    return 'Name is required';
  } else if (!nameExp.hasMatch(value)) {
    return 'Please enter alphabetical characters';
  }
  return null;
}

String? _validateSurname(String? value) {
  final nameExp = RegExp(r'^[A-Za-z ]+$');
  if (value == null || value.isEmpty) {
    return 'Surname is required';
  } else if (!nameExp.hasMatch(value)) {
    return 'Please enter alphabetical characters';
  }
  return null;
}

bool _validatePhone(String? input) {
  if (input == null || input.isEmpty) return false;
  final phoneExp = RegExp(r'^\d{11}$');
  return phoneExp.hasMatch(input);
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
