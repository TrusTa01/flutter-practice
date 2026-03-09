import 'package:flutter/material.dart';
import 'package:flutter_application_default/contact_list/pages/create_page.dart';
import 'package:flutter_application_default/contact_list/pages/edit_page.dart';
import 'package:flutter_application_default/contact_list/pages/list_page.dart';
import 'package:flutter_application_default/contact_list/pages/view_page.dart';
import 'package:flutter_application_default/contact_list/provider/provider.dart';
import 'package:flutter_application_default/contact_list/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contact app',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: AppRoutesName.listPage,
        routes: {
          AppRoutesName.listPage: (context) => ListPage(),
          AppRoutesName.createPage: (context) => CreatePage(),
          AppRoutesName.editPage: (context) => EditPage(),
          AppRoutesName.viewPage: (context) => ViewPage(),
        },
      ),
    );
  }
}
