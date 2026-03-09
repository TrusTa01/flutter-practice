import 'package:flutter/material.dart';
import 'package:flutter_application_default/http/auto/Brewery/services/service.dart';
import 'models/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Networking', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Brewery>> futureBreweries;

  @override
  void initState() {
    super.initState();
    futureBreweries = BreweryService.getBreweries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Networking'), centerTitle: true),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return FutureBuilder<List<Brewery>>(
      future: futureBreweries,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _card(snapshot.data![index]);
            },
          );
        }
        return Center(child: Text('Нет данных'));
      },
    );
  }

  Widget _card(Brewery brewery) {
    return Card(
      child: ListTile(
        title: Text(''),
        subtitle: Text('${brewery.city}, ${brewery.country}'),
      ),
    );
  }
}