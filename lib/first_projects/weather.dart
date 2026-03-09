import 'package:flutter/material.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: AssetImage('assets/images/snezha.jpg'),
    height: 400,

    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        'Текст (от лат. textus — ткань; сплетение, сочетание) — зафиксированная на каком-либо материальном носителе человеческая мысль; в общем плане связная и полная последовательность символов.',
        style: TextStyle(color: Colors.black),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Icon(Icons.wb_sunny, color: Colors.yellow)],
      ),
      SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('15C Clear', style: TextStyle(color: Colors.deepPurple)),
            ],
          ),
          Row(
            children: [
              Text(
                'Primorskiy kray, Vladivostok',
                style: TextStyle(color: const Color.fromARGB(255, 59, 59, 61)),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text('${index + 20}C', style: TextStyle(fontSize: 15)),
        avatar: Icon(Icons.wb_cloudy, color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Colors.grey.shade100),
        ),
        backgroundColor: Colors.grey,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    children: [
      Icon(Icons.star, size: 15, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15, color: Colors.black),
      Icon(Icons.star, size: 15, color: Colors.black),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('Info with openweathermap.org', style: TextStyle(fontSize: 15)),
      stars,
    ],
  );
}
