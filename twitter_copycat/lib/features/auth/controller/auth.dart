import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

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

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

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

Stream<List<Document>> pollTweets() async* { // Creates a stream that periodically fetches tweets from the database.
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

// get details of the user logged in
Future<User?> getUser() async {
  try {
    final user = await AppwriteService().account.get();
    return user;
  } catch (e) {
    print('Error fetching user: $e');
    return null;
  }
}

Future<void> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // El usuario canceló la operación
      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Llama a Appwrite con el token de Google
    final session = await AppwriteService().account.createOAuth2Session(
      provider: OAuthProvider.google,
      success: 'https://appwrite.io/auth/oauth2/succes', // URL de redireccionamiento en caso de éxito
      failure: 'https://appwrite.io/auth/oauth2/failure', // URL de redireccionamiento en caso de fallo
    );

    print(session);
  } catch (error) {
    print(error);
  }
}
// Future<bool> continueWithGoogle() async {
//   try {
//     final result = await AppwriteService().account.createOAuth2Session(
//       provider: OAuthProvider.google,
//       success: 'https://localhost80/v1/auth.html',
//       failure: 'https://appwrite.io/auth/oauth2/failure',
//       scopes: ['profile', 'email'],
//     );

//     final url = Uri.parse(result.data['url']);
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//       return true;
//     } else {
//       throw 'Could not launch $url';
//     }
//   } on AppwriteException catch (e) {
//     print('Appwrite Exception: ${e.message}');
//     return false;
//   } catch (e) {
//     print('Error: $e');
//     return false;
//   }
// }