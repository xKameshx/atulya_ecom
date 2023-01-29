import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot extends StatefulWidget {
  Forgot({Key? key}) : super(key: key);

  @override
  _ForgotState createState() => _ForgotState();
}

final grad = LinearGradient(
    colors: <Color>[Colors.greenAccent.shade400, Colors.blueAccent]);

class _ForgotState extends State<Forgot> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email;
  Future<void> forgotpass() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      try {
        await _auth.sendPasswordResetEmail(email: _email);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirmation'),
                content: Text("Password Reset Link sended to $_email"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              );
            });
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('ERROR'),
                content: Text(e.toString()),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              );
            });
        print(e);
      }
    } else {
      print("hello");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          //color: Colors.blue.shade800,
          decoration: BoxDecoration(gradient: grad),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 200,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 150,
                    color: Colors.white,
                  )),
              Positioned(
                  left: 10,
                  top: 50,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      ))),
              Positioned(
                top: 90,
                //left: 23,
                child: Container(
                  alignment: Alignment.center,
                  width: 350,
                  height: 200,
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
                //left: 20,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 19, 0, 1),
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Image(
                              image: AssetImage('assets/icons/Logo1.png'),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        //SizedBox(height: 50),
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  height: 58,
                                  width: 320,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                    child: Container(
                                      //margin: EdgeInsets.all(8),
                                      height: 58,
                                      width: 320,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 8, 8, 2),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              border: Border.all(
                                                  color:
                                                      Colors.lightBlueAccent)),
                                          child: TextFormField(
                                            validator: (input) {
                                              if (input!.isEmpty)
                                                return "Enter email";
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Email',
                                              hintStyle: GoogleFonts.lato(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                                size: 20,
                                              ),
                                            ),
                                            onSaved: (input) => _email = input!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 50,
                                  width: 200,
                                  alignment: Alignment.center,
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    elevation: 5,
                                    splashColor: Colors.greenAccent,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState?.save();
                                      }
                                      if (_email.isNotEmpty) {
                                        forgotpass();
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side:
                                          BorderSide(color: Colors.blueAccent),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    color: Colors.blueAccent,
                                    textColor: Colors.white,
                                    child: Center(
                                      child: Text(
                                        "Reset Link",
                                        style: GoogleFonts.lato(
                                            fontSize: 20,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  // decoration: BoxDecoration(
                                  //   gradient: grad,
                                  // ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, "SignUp");
                                      },
                                      child: Center(
                                        child: Text(
                                          "Create New",
                                          style: GoogleFonts.lato(
                                            fontSize: 16,
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
