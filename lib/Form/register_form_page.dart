// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_default/Form/model/user.dart';
import 'user_info_page.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  // ⁡⁢⁣⁢Скрытый текст для паролей⁡
  bool _hidePass = true;
  // ⁡⁢⁣⁢Глобальный ключ⁡
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final List<String> _countries = ['Russia', 'Germany', 'France', 'Italy'];
  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _countryFocus = FocusNode();
  final _storyFocus = FocusNode();
  final _passFocus = FocusNode();
  final _confirmPassFocus = FocusNode();

  User newUser = User();

  // ⁡⁢⁣⁢Вывод данных⁡
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();

    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    _countryFocus.dispose();
    _storyFocus.dispose();
    _passFocus.dispose();
    _confirmPassFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register Form'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name *',
                hintText: 'What do people call you?',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                  onLongPress: () => _phoneController.clear(),
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
                // ⁡⁢⁣⁡⁢⁣⁢Когда поле не сфокусировано ⁡⁡
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                // ⁡⁢⁣⁡⁢⁣⁡⁢⁣⁢Когда поле сфокусировано⁡
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              // ⁡⁢⁣⁢Валидация⁡
              validator: _validateName,
              onSaved: (value) => newUser.name = value!,
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _emailFocus);
              },
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                hintText: 'Where can we reach you?',
                helperText: 'Phone format: X(XXX)XXX-XX-XX',
                prefixIcon: Icon(Icons.call),
                suffixIcon: GestureDetector(
                  onLongPress: () => _nameController.clear(),
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => {_nameController.clear},
                  ),
                ),
                //⁡⁢⁣⁢ Когда поле не сфокусировано ⁡
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                // ⁡⁢⁣⁡⁢⁣⁡⁢⁣⁢Когда поле сфокусировано ⁡
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              // ⁡⁢⁣⁢Выбор клавиатуры
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d() -]')),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  final text = newValue.text;
                  if (text.length > 15) return oldValue;
                  return newValue;
                }),
              ],
              validator: (value) => _validatePhoneNumber(value)
                  ? null
                  : 'Phone number must be entered as X(XXX)XXX-XX-XX',
                  onSaved: (value) => newUser.phone = value!,
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _emailFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _emailFocus, _countryFocus);
              },
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter an email address',
                // ⁡⁢⁣⁢Поле обрезается до иконки и отображается всегда⁡
                icon: Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
              onSaved: (value) => newUser.email = value!,
            ),
            SizedBox(height: 10),

            DropdownButtonFormField(
              focusNode: _countryFocus,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.map),
                labelText: 'Country?',
              ),
              items: _countries.map((country) {
                return DropdownMenuItem(value: country, child: Text(country));
              }).toList(),
              onChanged: (country) {
                print(country);
                setState(() {
                  _selectedCountry = country;
                  newUser.country = country!;
                });
                _fieldFocusChange(context, _countryFocus, _storyFocus);
              },
              initialValue: _selectedCountry,
              validator: (val) {
                return val == null ? 'Please select a country' : null;
              },
            ),

            SizedBox(height: 30),
            TextFormField(
              focusNode: _storyFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _storyFocus, _passFocus);
              },
              controller: _storyController,
              decoration: InputDecoration(
                labelText: 'Life Story *',
                hintText: 'Tell us about your self',
                helperText: 'Keep it short, this is just a demo',
                border: OutlineInputBorder(),
              ),
              // ⁡⁢⁣⁢Кол-во строк⁡
              maxLines: 3,
              // ⁡⁢⁣⁢Не больше 100 символов⁡
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
              onSaved: (value) => newUser.story = value!,
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _passFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _passFocus, _confirmPassFocus);
              },
              controller: _passController,
              // ⁡⁢⁣⁢Скрытый текст для паролей⁡
              obscureText: _hidePass,
              maxLength: 20,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Enter the password',
                suffixIcon: IconButton(
                  onPressed: () {
                    // ⁡⁢⁣⁢Скрыт ли пароль⁡
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon: Icon(
                    _hidePass ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                icon: Icon(Icons.security),
              ),
              validator: _validatePassword,
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _confirmPassFocus,
              onFieldSubmitted: (_) {
                _confirmPassFocus.unfocus();
              },
              controller: _confirmPassController,
              // ⁡⁢⁣⁢Скрытый текст для паролей⁡⁡
              obscureText: _hidePass,
              maxLength: 20,
              decoration: InputDecoration(
                labelText: 'Confirm Password *',
                hintText: 'Confirm the password',
                icon: Icon(Icons.border_color),
              ),
              validator: _validateConfirmPassword,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text('Submit Form', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // ⁡⁢⁡⁢⁣Вывод данных 
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _showDialog(name: _nameController.text );
      print('Form is valid');
      print('Name: ${_nameController.text}');
      print('Phone: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      print('Country: $_selectedCountry');
      print('Story: ${_storyController.text}');
    } else {
      _showMessage(message: 'Form is not valid! Please review and correct');
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

  bool _validatePhoneNumber(String? input) {
    if (input == null || input.isEmpty) return false;
    final phoneExp = RegExp(r'^\d\(\d\d\d\)\d\d\d-\d\d-\d\d$');
    return phoneExp.hasMatch(input);
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }

    final emailExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value.length > 20) {
      return 'Password must be maximum 20 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != _passController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _showMessage({String? message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          message ?? 'No message',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ), // ← если message null, покажет 'No message'
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showDialog({String? name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Registration successful',
            style: TextStyle(color: Colors.green),
          ),
          content: Text(
            '$name is now a verified register form',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(
                      userInfo: newUser,
                    ),
                    ),
                   );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // цвет текста
                backgroundColor: Colors.grey[100], // цвет фона
                padding: EdgeInsets.all(16), // отступы
                shape: RoundedRectangleBorder(
                  // форма
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Verified', style: TextStyle(color: Colors.green, fontSize: 18),),
            ),
          ],
        );
      },
    );
  }
}