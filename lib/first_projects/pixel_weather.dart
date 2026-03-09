import 'package:flutter/material.dart';

class WeatherTime {
  final String temperature;
  final IconData icon;
  final String time;
  WeatherTime({
    required this.temperature,
    required this.icon,
    required this.time,
  });
}

class WeatherDay {
  final String day;
  final String date;
  final String highTemp;
  final String lowTemp;
  final IconData icon;
  final String precipitation;
  WeatherDay({
    required this.day,
    required this.date,
    required this.highTemp,
    required this.lowTemp,
    required this.icon,
    required this.precipitation,
  });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Noto Sans"),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Hourly weather forecast information
  final List<WeatherTime> weatherTime = [
    WeatherTime(temperature: '7', icon: Icons.sunny, time: 'Сейчас'),
    WeatherTime(temperature: '8', icon: Icons.sunny, time: '22:00'),
    WeatherTime(temperature: '7', icon: Icons.sunny, time: '23:00'),
    WeatherTime(temperature: '6', icon: Icons.sunny, time: '00:00'),
    WeatherTime(temperature: '6', icon: Icons.sunny, time: '01:00'),
    WeatherTime(temperature: '3', icon: Icons.sunny, time: '02:00'),
    WeatherTime(temperature: '8', icon: Icons.sunny, time: '03:00'),
    WeatherTime(temperature: '7', icon: Icons.sunny, time: '04:00'),
    WeatherTime(temperature: '5', icon: Icons.sunny, time: '05:00'),
    WeatherTime(temperature: '6', icon: Icons.sunny, time: '06:00'),
  ];

  // Daily weather forecast information
  final List<WeatherDay> weatherDays = [
    WeatherDay(
      day: 'Пн',
      date: '27.10',
      highTemp: '6',
      lowTemp: '3',
      icon: Icons.sunny,
      precipitation: '14',
    ),
    WeatherDay(
      day: 'Вт',
      date: '28.10',
      highTemp: '7',
      lowTemp: '1',
      icon: Icons.sunny,
      precipitation: '15',
    ),
    WeatherDay(
      day: 'Ср',
      date: '29.10',
      highTemp: '9',
      lowTemp: '3',
      icon: Icons.sunny,
      precipitation: '17',
    ),
    WeatherDay(
      day: 'Чт',
      date: '30.10',
      highTemp: '7',
      lowTemp: '2',
      icon: Icons.cloud,
      precipitation: '15',
    ),
    WeatherDay(
      day: 'Пт',
      date: '31.10',
      highTemp: '9',
      lowTemp: '5',
      icon: Icons.cloud,
      precipitation: '13',
    ),
    WeatherDay(
      day: 'Сб',
      date: '1.11',
      highTemp: '5',
      lowTemp: '3',
      icon: Icons.sunny,
      precipitation: '12',
    ),
    WeatherDay(
      day: 'Вс',
      date: '2.11',
      highTemp: '6',
      lowTemp: '3',
      icon: Icons.sunny,
      precipitation: '15',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Владивосток',
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 9, 51, 122),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Сохранить', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  // Build body
  Widget _buildBody() {
    return Stack(
      children: [
        _backgroundImage(),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: AppBar().preferredSize.height),
                _buildContent(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Bg image
  Widget _backgroundImage() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset('assets/images/vladivostok.jpg', fit: BoxFit.cover),
    );
  }

  // Main builder
  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .center,
        children: [
          _mainInfo(),
          SizedBox(height: 16),
          _buildHourlyForecast(),
          SizedBox(height: 16),
          _buildDailyForecast(),
        ],
      ),
    );
  }

  // Main information
  Widget _mainInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/moon.png',
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            SizedBox(width: 12),
            Text('ясно', style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
        Text(
          '7°',
          style: TextStyle(
            fontSize: 120,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Ощущается как 3°',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          'Максимальная 7°. Минимальная: 0°',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }

  // Hourly forecast block
  Widget _buildHourlyForecast() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 24, 23, 23),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/clock.png',
                  width: 20,
                  height: 30,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  'Прогноз погоды по часам',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...weatherTime.map(
                    (oneHour) => _buildHour(
                      oneHour.temperature,
                      oneHour.icon,
                      oneHour.time,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Template for one hour
  Widget _buildHour(String temperature, IconData icon, String time) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            ' $temperature°',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 5),
          Icon(icon, size: 25, color: Colors.amber),
          SizedBox(height: 20),
          Text(time, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  // Daily forecast block
  Widget _buildDailyForecast() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 24, 23, 23),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month, size: 20, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Прогноз погоды на неделю',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: weatherDays.map((oneDay) {
                  return Row(
                    children: [
                      _buildWeatherDay(
                        oneDay.day,
                        oneDay.date,
                        oneDay.highTemp,
                        oneDay.lowTemp,
                        oneDay.icon,
                        oneDay.precipitation,
                      ),
                      SizedBox(width: 10),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Template for one day
  Widget _buildWeatherDay(
    String day,
    String date,
    String highTemp,
    String lowTemp,
    IconData icon,
    String precipitation,
  ) {
    return Container(
      width: 60,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 56, 54, 54),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('$highTemp°', style: TextStyle(color: Colors.white)),
            Text('$lowTemp°', style: TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Icon(icon, color: Colors.amber),
            SizedBox(height: 10),
            Text('$precipitation %', style: TextStyle(color: Colors.white)),
            SizedBox(height: 5),
            Text(day, style: TextStyle(color: Colors.white)),
            Text(date, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
