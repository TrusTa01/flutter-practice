import 'dart:isolate';

Future<void> main() async {
  final receivePort = ReceivePort();

  final numnersList = List.generate(20, (i) => i + 1);
  final isolatesCount = 4;

  final resultResultList = <int>[];
  var completedIsolates = 0;

  for (var i = 0; i < isolatesCount; i++) {
    final stepSize = numnersList.length ~/ isolatesCount;
    final sublist = numnersList.sublist(i * stepSize, (i + 1) * stepSize);

    Isolate.spawn(mathIsolate, [sublist, receivePort.sendPort, i]);
  }
  await for (final data in receivePort) {
    resultResultList.addAll((data as List<int>));
    completedIsolates += 1;
    if (completedIsolates == 4) {
      print('Все посчитано:\n$resultResultList');
      receivePort.close();
    }
    break;
  }
}

void mathIsolate(List<Object> args) async {
  final nubmersList = args[0] as List<int>;
  final sendPort = args[1] as SendPort;
  final index = args[2] as int;

  final resultList = <int>[];

  await Future.delayed(Duration(seconds: 5));

  for (final number in nubmersList) {
    final result = number * number;
    resultList.add(result);
    print(' [Изолят номер: [$index] посчитал $result');
  }

  sendPort.send(resultList);
  print('Изолят номер: [$index] закончил работу');
}
