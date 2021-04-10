part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModel userModel) async {
    String genres = "";

    for (var genre in userModel.selectedGenres) {
      genres += genre + ((genre != userModel.selectedGenres.last) ? ',' : '');
    }

    _userCollection.doc(userModel.id).set({
      'email': userModel.email,
      'name': userModel.name,
      'balance': userModel.balance,
      'selectedGenres': userModel.selectedGenres,
      'selectedLanguage': userModel.selectedLanguage,
      'profilePicture': userModel.profilePicture ?? ""
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return UserModel(
      id,
      snapshot.data()['email'],
      balance: snapshot.data()['balance'],
      profilePicture: snapshot.data()['profilePicture'],
      selectedGenres: (snapshot.data()['selectedGenres'] as List)
          .map((e) => e.toString())
          .toList(),
      selectedLanguage: snapshot.data()['selectedLanguage'],
      name: snapshot.data()['name'],
    );
  }
}
