import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppwriteService {
  // Singleton pattern to ensure a single instance of AppwriteService.
  static final AppwriteService _instance = AppwriteService._internal();
  late final Client client;
  late final Account account;
  late final Databases databases;

  factory AppwriteService() {
    return _instance;
  }
  
  // Private constructor for the singleton pattern.
  AppwriteService._internal() {
    // Initialize the Appwrite client with endpoint, project ID, and self-signed status.
    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // API Endpoint
        .setProject('6681850100271f51474d') // project ID
        .setSelfSigned(status: true); // For self-signed certificates, only use for development

    // Initialize account and databases services using the client.
    account = Account(client);
    databases = Databases(client);
  }
}

// GoogleSignIn instance with scopes for email and readonly access to contacts.
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

// Function to create a new user with email and password.
Future<String> createEmailUser(String name, String email, String password) async {
  try {
    await AppwriteService().account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

// Function to log in a user with email and password.
Future<String> loginUser(String email, String password) async {
  try {
    await AppwriteService().account.createEmailPasswordSession(email: email, password: password);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

// Function to create a new tweet document in the database.
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

// Creates a stream that periodically fetches tweets from the database.
Stream<List<Document>> pollTweets() async* { 
  while (true) {
    try {
      final response = await AppwriteService().databases.listDocuments(
        databaseId: 'twitter_database',
        collectionId: '66860d2a001a6a9ad263',
        queries: [
          Query.notEqual('user', ''), 
        ],
      );
      yield response.documents;
      await Future.delayed(const Duration(seconds: 10)); // The function waits for 10 seconds between each query to reduce
    } catch (e) {
      print('Error fetching tweets: $e');
      yield []; 
      await Future.delayed(const Duration(seconds: 10)); // server load and network traffic.
    }
  }
}

//  Function to get the details of the currently logged-in user.
Future<User?> getUser() async {
  try {
    final user = await AppwriteService().account.get();
    return user;
  } catch (e) {
    print('Error fetching user: $e');
    return null;
  }
}

//  Function to sign in with Google using OAuth2.
Future<void> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    final session = await AppwriteService().account.createOAuth2Session(
      provider: OAuthProvider.google,
      success: 'https://appwrite.io/auth/oauth2/succes', 
      failure: 'https://appwrite.io/auth/oauth2/failure', 
    );

    print(session);
  } catch (error) {
    print(error);
  }
}