part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = userCredential.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(userModel);

      return SignInSignUpResult(userModel: userModel);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }
}

class SignInSignUpResult {
  final UserModel userModel;
  final String message;

  SignInSignUpResult({this.userModel, this.message});
}
