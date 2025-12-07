// import 'package:flutter/material.dart';
// import 'test_data.dart';
// import 'screen1.dart';
// import 'screen2.dart';

// class RootScreen extends StatelessWidget {
//   const RootScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('Передать императивно данные на другой экран'),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return const Screen1();
//                     },
//                     settings: const RouteSettings(
//                       arguments: 'Переданные данные из RootScreen',
//                     )
//                   ),
//                 );
//               },
//               child: Text('Передать строку'),
              
//             ),
//             SizedBox(height: 12,),
//     ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return const Screen2();
//                     },
//                     settings: RouteSettings(
//                       arguments: TestData(data: 'Тестовые данные'),
//                     ),
//                   ),
//                 );
//               },
//               child: Text('Передать объект'),
              
//             ),
//             SizedBox(height: 32,),
//           ],
//         ),
//       ),
//     );
//   }
// }


// void main() {
//   runApp(MaterialApp(
//     home: const RootScreen(),
//   ));
// }