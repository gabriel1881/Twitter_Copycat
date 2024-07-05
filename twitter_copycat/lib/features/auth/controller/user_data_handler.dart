class UserData {
  String? name;
  String? email;
  String? phone;
  String? username;
  String? dateOfBirth;
  String? password;

 // Override the toString method to provide a readable string representation of the UserData object.
  @override
  String toString() {
    return 'UserData{name: $name, email: $email, phone: $phone, username: $username, dateOfBirth: $dateOfBirth, password: $password}';
  }
}

// Singleton instance of UserData to store user information globally.
final userData = UserData();