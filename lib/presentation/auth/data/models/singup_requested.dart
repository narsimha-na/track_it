class SignUpRequested {
  String name;
  String email;
  String password;
  int mobileNumber;
  double targetWeight;
  double currentWeight;
  double height;
  String gender;
  String age;

  SignUpRequested({
    required this.name,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.targetWeight,
    required this.currentWeight,
    required this.height,
    required this.gender,
    required this.age,
  });

  @override
  String toString() {
    return 'SignUpRequested(email: $email, password: $password, mobileNumber: $mobileNumber, targetWeight: $targetWeight, currentWeight: $currentWeight, height: $height, gender: $gender, age: $age)';
  }
}
