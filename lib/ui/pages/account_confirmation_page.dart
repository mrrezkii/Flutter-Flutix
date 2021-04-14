part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .read<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 90),
                      height: 56,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(
                                    GoToRegistrationPage(
                                        widget.registrationData));
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                          Center(
                            child: Text("Confirm\nNew Account",
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      )),
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                (widget.registrationData.profileImage == null)
                                    ? AssetImage("assets/user_pic.png")
                                    : FileImage(
                                        widget.registrationData.profileImage),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text("${widget.registrationData.name}",
                      style: blackTextFont.copyWith(fontSize: 20),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 120,
                  ),
                  (isSigningUp)
                      ? SpinKitSpinningCircle(
                          color: Color(0xFF3E9D9D),
                          size: 45,
                        )
                      : SizedBox(
                          width: 250,
                          height: 45,
                          child: RaisedButton(
                            color: Color(0xFF3E9D9D),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Create My Account",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () {
                              setState(() async {
                                isSigningUp = true;
                                var auth = widget.registrationData;
                                SignInSignUpResult result =
                                    await AuthServices.signUp(
                                        auth.email,
                                        auth.password,
                                        auth.name,
                                        auth.selectedGenres,
                                        auth.selectedLang);

                                if (result.userModel == null) {
                                  setState(() {
                                    isSigningUp = false;
                                  });

                                  imageFileToUpload =
                                      widget.registrationData.profileImage;

                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Color(0xFFFF5C83),
                                    message: result.message,
                                  )..show(context);
                                }
                              });
                            },
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
