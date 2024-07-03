class UserData {
  String? name;
  String? email;
  String? phone;
  String? username;
  String? dateOfBirth;
  String? password;

  @override
  String toString() {
    return 'UserData{name: $name, email: $email, phone: $phone, username: $username, dateOfBirth: $dateOfBirth, password: $password}';
  }
}

final userData = UserData();