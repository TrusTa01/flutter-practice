import 'package:flutter/material.dart';
import 'package:flutter_application_default/nested_navigation/screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Более безопасная навигация - попытка вернуться назад, если это возможно
      final navigator = _navigatorKeys[index].currentState;
      if (navigator != null && navigator.canPop()) {
        navigator.pop();
      } else {
        // Если нельзя вернуться назад, сбрасываем к первому экрану
        navigator?.popUntil((route) => route.isFirst);
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildNavigator(0, const HomeScreen()),
          _buildNavigator(1, const SearchScreen()),
          _buildNavigator(2, const ProfileScreen()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavigator(int index, Widget initialScreen) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateInitialRoutes: (NavigatorState navigator, String initialRoute) {
        return [MaterialPageRoute(builder: (context) => initialScreen)];
      },
      onGenerateRoute: (RouteSettings settings) {
        // Здесь можно добавить дополнительную логику маршрутизации
        // для каждого отдельного навигатора
        return MaterialPageRoute(builder: (context) => initialScreen);
      },
    );
  }
}
