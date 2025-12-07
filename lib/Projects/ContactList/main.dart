import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_default/Projects/ContactList/pages/create_page.dart';
import 'package:flutter_application_default/Projects/ContactList/pages/list_page.dart';
import 'package:flutter_application_default/Projects/ContactList/pages/view_page.dart';
import 'package:flutter_application_default/Projects/ContactList/pages/edit_page.dart';
import 'package:flutter_application_default/Projects/ContactList/routes/routes.dart';
import 'package:flutter_application_default/Projects/ContactList/provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contact app',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: AppRoutesName.ListPage,
        routes: {
          AppRoutesName.ListPage: (context) => ListPage(),
          AppRoutesName.CreatePage: (context) => CreatePage(),
          AppRoutesName.EditPage: (context) => EditPage(),
          AppRoutesName.ViewPage: (context) => ViewPage(),
        },
      ),
    );
  }
}
