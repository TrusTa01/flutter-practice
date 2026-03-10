// class Cockie {
//   String shape;
//   int bakingTime;

//   Cockie(this.shape, this.bakingTime);

//   void bake() {
//     print("Печенья формы $shape печется $bakingTime минут");
//   }
// }

// void main() {

//   Cockie myCockie = Cockie("Круглое", 15);

//   myCockie.bake();
// }




// class Human {
//   String name;
//   int age;

//   Human(this.name, this.age);

//   void introduceHuman() {
//     print("Это $name и ему $age");

//   }
// }

// void main() {
//   Human sanya = Human("Пидор", 18);

//   sanya.introduceHuman();
// }




// class BankAccount {
//   final String owner;
//   double _balance = 0;

//   BankAccount(this.owner);

//   double get balance => _balance;

//   void deposit(double amount) {
//     if (amount > 0) {
//       _balance +=amount;
//     }
//   }

//   set bonus(double percent) {
//     if (percent > 0 && percent <=10){
//       _balance += _balance * percent / 100;
//     }
//   }
// }

// void main () {
//   BankAccount account = BankAccount("Иван");
//   account.deposit(1000);

//   print(account.balance);
//   account.bonus = 5;
//   print(account.balance);
// }

// class Transport {
//   String name;
//   int maxSpeed;

//   Transport(this.name, this.maxSpeed);

//   void move() {
//     print("$name двигается со скоростью до $maxSpeed");
//   }
// }

// class Car extends Transport {
//   int numberOfDoors;

//   Car(String name, int maxSpeed, this.numberOfDoors) : super(name, maxSpeed);

//   @override
//   void move() {
//     print('И у нее $numberOfDoors двери!');
//   }
// }

// void main () {
//   Transport xtransport = Transport("Что-то", 200);
//   Car myCar = Car("Тесла", 250, 4);

//   xtransport.move();
//   myCar.move();
// }

// class Student {
//   String name;
//   static int totalStudents = 0;

//   Student(this.name) {
//     totalStudents++;
//   }

//   static void printTotal() {
//     print("Всего студентов: $totalStudents");
//   }
// }

// void main() {
//   Student alice = Student("Алиса");
//   Student bob = Student("Боб");

//   Student.printTotal();
// }

// class Wallet {
//   double money;

//   Wallet(this.money);

//   void showMoney() {
//     print("В кошельке $money рублей");
//   }
// }

// void main () {
//   Wallet one = Wallet(100);

//   one.showMoney();
// }

// class Student {
//   String name;
//   List<int> grades;

//   Student(this.name) : grades = [];

//   void addGrade(int grade) {
//     grades.add(grade);
//   }

//   void showInfo() {
//     print("Студент $name. Оценки: $grades");
//   }
// }

// void main() {
//   Student anna = Student("Анна");

//   anna.addGrade(4);
//   anna.addGrade(5);
//   anna.addGrade(4);

//   anna.showInfo();
// }




// class Animal {
//   String name;

//   Animal(this.name);

//   void speak() {
//     print("звук");
//   }
// }

// class Cat extends Animal {

//   Cat(String name) :super(name);

//   @override
//   void speak(){
//     print("МЯЯЯУ!");
//   }
// }

// class Dog extends Animal {

//   Dog(String name) :super(name);

//   @override
//   void speak(){
//     print("ГАВ!");
//   }
// }

// void main() {
//   Cat barsik = Cat("Барсик");
//   Dog sharik = Dog("Шарик");

//   barsik.speak();
//   sharik.speak();
// }




// class Password {
//   String _password;

//   Password(this._password);

//   String get password => _password;

//   set newPassword(String check) {

//     if (check.length < 6) {
//      print("Пароль '$check' слишком короткий!");
//     } else {
//       _password = check;
//        print("Пароль успешно изменен на: '$check'");
//     }

//   }
// }

// void main () {
//   Password myPassword = Password("Пароль");
//   print("Текущий пароль: ${myPassword.password}");

//   myPassword.newPassword = "123"; // Не пройдет
//   print("Текущий пароль: ${myPassword.password}");

//   myPassword.newPassword = "secret123"; // Пройдет
//   print("Текущий пароль: ${myPassword.password}");

// }




// class Human {
//   String name;
//   static int count = 0;

//   Human({
//    required this.name
//   }) {
//     count += 1;
//     }

//   static void showCount() {
//     print("Созданно объектов $count");
//   }
// }

// void main() {
//   var vova = Human(name: "Вова");
//   Human.showCount();
//   print(vova.name);
//   var sanya = Human(name: "Саня");
//   Human.showCount();
//   print(sanya.name);
//   var kolya = Human(name: "Коля");
//   Human.showCount();
//   print(kolya.name);
//   print(kolya);
// }




// class Temperature {
//   double _celsius = 0;

//   double get celsius => _celsius;

//   set celsius(double newValue) {
//     if (newValue < -100 || newValue > 100) {
//       print("Неверное значение: $newValue. Допустимый диапазон: -100 до 100");
//     }
//     newValue = _celsius;
//   }

//   double get fahrenheit => _celsius * 9 / 5 + 32;

//   set fahrenheit(double fahrenheitValue) {
//     celsius = (fahrenheitValue - 32) * 5 / 9;
//   }
// }

// void main() {
//   Temperature temp = Temperature();

//   temp.celsius = 25;
//   print("25°C = ${temp.fahrenheit}°F");
// }




// class BankAccountWithHistory {
//   double _balance = 0;
//   final List<String> _transactionHistory = [];

//   double get balance => _balance;

//   List<String> get history => _transactionHistory;

//   set deposit(double amount) {
//     if (amount > 0) {
//       _balance += amount;
//        _transactionHistory.add('Пополнение: +$amount руб. Баланс: $_balance руб.');
//     } else {
//       _transactionHistory.add('Ошибка пополнения: неверная сумма $amount');
//     }
//   } 
   
//   set withdraw(double amount) {
//     if (amount > 0 && amount <= _balance) {
//       _balance -= amount;
//       _transactionHistory.add('Снятие: -$amount руб. Баланс: $_balance руб.');
//     } else {
//       _transactionHistory.add('Ошибка снятия: недостаточно средств или неверная сумма');
//     }
//   }
// }

// void main() {
//   BankAccountWithHistory account = BankAccountWithHistory();

//   account.deposit = 1000;
// }