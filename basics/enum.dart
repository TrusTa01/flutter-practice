enum Pet {
  dog('Собака'),
  cat('Кошка'),
  bird('Птичка');

  final String localization;
  const Pet(this.localization);

  void printPetName() {
    print(this.localization);
  }
}

void main() {
  final vasyaPet = Pet.dog;
  final stasPet = Pet.cat;

  vasyaPet.printPetName();
  stasPet.printPetName();
}

enum DataStatus {
  initial, // Начальное состояние, ничего не произошло
  loading, // Идет загрузка данных
  loaded, // Данные успешно загружены
  error, // Произошла ошибка при загрузке
}

class DataCubit {
  DataStatus currentStatus = DataStatus.initial;

  Future<void> fetchData() async {
    // 1. Начинаем загрузку, меняем статус
    currentStatus = DataStatus.loading;
    // ... уведомляем UI о смене статуса ...

    try {
      // Имитация сетевого запроса
      await Future.delayed(Duration(seconds: 2));

      // 2. Успешное завершение
      currentStatus = DataStatus.loaded;
    } catch (e) {
      // 3. Обработка ошибки
      currentStatus = DataStatus.error;
    }
    // ... уведомляем UI о смене статуса ...
  }
}
