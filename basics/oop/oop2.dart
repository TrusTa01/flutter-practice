class BankAccount {
  final String owner;
  double _balance = 0;

  BankAccount(this.owner);

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  set bonus(double percent) {
    if (percent > 0 && percent <= 10) {
      _balance += _balance * percent / 100;
    }
  }
}

void main() {
  BankAccount account = BankAccount("Иван");
  account.deposit(1000);

  print(account.balance);
  account.bonus = 5;
  print(account.balance);
}
