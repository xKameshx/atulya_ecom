import 'package:atulya_app/Authentication/check.dart';
import 'package:atulya_app/Authentication/database.dart';
import 'package:atulya_app/widget/kist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';

final grad = LinearGradient(
    colors: <Color>[Colors.greenAccent.shade400, Colors.blueAccent]);

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var ico = Icons.keyboard_arrow_down_sharp;
  late String _email, _password, _name, check, phone;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var c = new Check(_name, _email, phone, address, _password);
      savepost(c);
      if (equals(check, _password)) {
        try {
          UserCredential user = await _auth.createUserWithEmailAndPassword(
              email: _email, password: _password);
          if (user != null) {
            await _auth.currentUser!.updateDisplayName(_name);
          }
        } catch (e) {
          showError(e.toString(), "error");
          print(e);
        }
      } else {
        showError("Password unmatched", "Incorrect");
      }
    }
  }

  showError(String errormessage, String val) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$val'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
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
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                  top: 180,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 150,
                    color: Colors.white,
                  )),
              Positioned(
                  left: 10,
                  top: 50,
                  child: IconButton(
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed("start"),
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
                top: 60,
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
                            height: 180,
                            width: 130,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  //margin: EdgeInsets.all(8),
                                  height: 58,
                                  width: 320,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular(25),
                                          border: Border.all(
                                              color: Colors.lightBlueAccent)),
                                      child: TextFormField(
                                        validator: (input) {
                                          if (input!.isEmpty)
                                            return "Enter Name";
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Name',
                                          hintStyle: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 16),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            size: 20,
                                          ),
                                        ),
                                        onSaved: (input) => _name = input!,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  height: 58,
                                  width: 320,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular(25),
                                          border: Border.all(
                                              color: Colors.lightBlueAccent)),
                                      child: TextFormField(
                                        validator: (input) {
                                          if (input!.isEmpty)
                                            return "Enter Email";
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Email',
                                          hintStyle: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 16),
                                          prefixIcon: Icon(
                                            Icons.email,
                                            size: 20,
                                          ),
                                        ),
                                        onSaved: (input) => _email = input!,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.all(8),
                                  height: 58,
                                  width: 320,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular(25),
                                          border: Border.all(
                                              color: Colors.lightBlueAccent)),
                                      child: TextFormField(
                                        validator: (input) {
                                          if (input!.length < 10)
                                            return "Input at least 10 characters";
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Phone Number',
                                          hintStyle: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 16),
                                          prefixIcon: Icon(
                                            Icons.call,
                                            size: 20,
                                          ),
                                        ),
                                        obscureText: true,
                                        onSaved: (input) => phone = input!,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  height: 58,
                                  width: 320,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular(25),
                                          border: Border.all(
                                              color: Colors.lightBlueAccent)),
                                      child: TextFormField(
                                        validator: (input) {
                                          if (input!.isEmpty)
                                            return "Enter Address";
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Address',
                                          hintStyle: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 16),
                                          prefixIcon: Icon(
                                            Icons.location_on,
                                            size: 20,
                                          ),
                                        ),
                                        onSaved: (input) => address = input!,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  height: 58,
                                  width: 320,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular(25),
                                          border: Border.all(
                                              color: Colors.lightBlueAccent)),
                                      child: TextFormField(
                                        validator: (input) {
                                          if (input!.length < 6)
                                            return "Input at least 6 characters";
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Password',
                                          hintStyle: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 16),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            size: 20,
                                          ),
                                        ),
                                        obscureText: true,
                                        onSaved: (input) => _password = input!,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  height: 58,
                                  width: 320,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular(25),
                                          border: Border.all(
                                              color: Colors.lightBlueAccent)),
                                      child: TextFormField(
                                        validator: (input) {
                                          if (input!.length < 6)
                                            return "Input at least 6 characters";
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Confirm Password',
                                          hintStyle: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontSize: 16),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            size: 20,
                                          ),
                                        ),
                                        obscureText: true,
                                        onSaved: (input) => check = input!,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 16),

                                //SizedBox(width:200),
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
                                      signUp();
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
                                        "SignUp",
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
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Already have an account?",
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
                                      onTap: () => Navigator.of(context)
                                          .pushReplacementNamed("Login"),
                                      child: Center(
                                        child: Text(
                                          "Login",
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
