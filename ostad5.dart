abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * (interestRate / 100);
    } else {
      print("Insufficient funds!");
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
    } else {
      print("Insufficient funds!");
    }
  }
}

void main() {
  var savingsAcc = SavingsAccount(1, 1000, 2.5);
  print("Savings Account Initial Balance: ${savingsAcc.balance}");
  savingsAcc.deposit(500);
  print("After deposit: ${savingsAcc.balance}");
  savingsAcc.withdraw(300);
  print("After withdrawal: ${savingsAcc.balance}");

  var currentAcc = CurrentAccount(2, 2000, 1000);
  print("Current Account Initial Balance: ${currentAcc.balance}");
  currentAcc.deposit(800);
  print("After deposit: ${currentAcc.balance}");
  currentAcc.withdraw(3000);
  print("After withdrawal: ${currentAcc.balance}");
}
