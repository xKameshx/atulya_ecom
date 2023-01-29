import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

final grad = LinearGradient(
    colors: <Color>[Colors.greenAccent.shade400, Colors.blueAccent]);

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  //final FirebaseAuth _auth = FirebaseAuth.instance;
  var user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed("main");
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          //color: Colors.blue.shade800,
          decoration: BoxDecoration(gradient: grad),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 200,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 150,
                    color: Colors.white,
                  )),
              Positioned(
                top: 90,
                //left: 23,
                child: Container(
                  alignment: Alignment.center,
                  width: 350,
                  height: 200,
                  //width: MediaQuery.of(context).size.width,
                  //width: MediaQuery.of(context).size.width-50,
                  //color: Colors.grey,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(200.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(200.0),
                        bottomLeft: Radius.circular(0)),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Container(
                          width: 200,
                          height: 200,
                          child: Image(
                            image: AssetImage('assets/icons/Logo1.png'),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 40),
                        RichText(
                          text: TextSpan(
                            text: 'Welcome to Atulya',
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(height: 5),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          width: 300,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Colors.blueAccent),
                            ),
                            onPressed: () => Navigator.of(context)
                                .pushReplacementNamed("SignUp"),
                            padding: EdgeInsets.all(10),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            splashColor: Colors.greenAccent,
                            child: Text(
                              "Sign Up with Email",
                              style: GoogleFonts.lato(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed("Login"),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
