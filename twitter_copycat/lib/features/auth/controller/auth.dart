import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService {
  static final AppwriteService _instance = AppwriteService._internal();
  late final Client client;
  late final Account account;
  late final Databases databases;

  factory AppwriteService() {
    return _instance;
  }

  AppwriteService._internal() {
    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject('6681850100271f51474d') // Your project ID
        .setSelfSigned(status: true); // For self-signed certificates, only use for development

    account = Account(client);
    databases = Databases(client);
  }
}

Future<String> createEmailUser(String name, String email, String password) async {
  try {
    await AppwriteService().account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

Future<String> loginUser(String email, String password) async {
  try {
    await AppwriteService().account.createEmailPasswordSession(email: email, password: password);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

Future<void> createTweet(String userId, String tweetContent) async {
  try {
    await AppwriteService().databases.createDocument(
      databaseId: 'twitter_database',
      collectionId: '66860d2a001a6a9ad263',
      documentId: ID.unique(),
      data: {
        'user': userId,
        'body': tweetContent,
        'date': DateTime.now().toIso8601String(),
      },
    );
  } on AppwriteException catch (e) {
    print(e.message);
  }
}

Future<List<Document>> listTweets() async {
  try {
    final response = await AppwriteService().databases.listDocuments(
      databaseId: 'twitter_database',
      collectionId: '66860d2a001a6a9ad263',
      queries: [
        Query.notEqual('user', ''), // Filtra documentos con 'content' no vacío
      ],
    );
    return response.documents;
  } on AppwriteException catch (e) {
    print('Error fetching tweets: ${e.message}');
    return [];
  }
}