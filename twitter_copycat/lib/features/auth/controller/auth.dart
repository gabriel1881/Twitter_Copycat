import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('6681850100271f51474d')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development

Account account = Account(client);

// Create a new user using email
Future<String> createEmailUser(String name, String email, String password) async {
  try {
    await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

// Login and create new session
Future<String> loginUser(String email, String password) async {
  try {
    await account.createEmailPasswordSession(email: email, password: password);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}