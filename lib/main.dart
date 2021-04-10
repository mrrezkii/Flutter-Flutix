import 'package:bwa_flutix/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("Sign Up"),
                    onPressed: () async {
                      SignInSignUpResult result = await AuthServices.signUp(
                          "rezki@mail.com",
                          "123455622222",
                          "Nando",
                          ["Action", "Horrror", "Music", "Drama"],
                          "Jepang");

                      if (result.userModel == null) {
                        print(result.message);
                      } else {
                        print(result.userModel.toString());
                      }
                    }),
                RaisedButton(
                    child: Text("Sign In"),
                    onPressed: () async {
                      SignInSignUpResult result = await AuthServices.signIn(
                        "rezki@mail.com",
                        "123455622222b",
                      );

                      if (result.userModel == null) {
                        print(result.message);
                      } else {
                        print(result.userModel.toString());
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
