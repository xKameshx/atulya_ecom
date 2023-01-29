import 'package:atulya_app/pages/Homi.dart';
import 'package:atulya_app/pages/cart.dart';
import 'package:atulya_app/widget/account.dart';
import 'package:atulya_app/widget/kist.dart';
import 'package:atulya_app/widget/search.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final _pageController = PageController();
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

  // final databaseRef = FirebaseDatabase.instance.reference().child("Details/");
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("Login");
      }
    });
  }

  // void printFirebase() {
  //   databaseRef.once().then((DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value.values[1]}');
  //     print('Data : ${snapshot.key}');
  //   });
  // }

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
    // printFirebase();
  }

  @override
  Widget build(BuildContext context) {
    // print(user);

    // printFirebase();
    // print(user);
    // address.add(user.address);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Homi(),
          Search(),
          Cart(),
          Account(_auth, user),
        ],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.blue,
              darkActiveColor: Colors.lightBlueAccent),
          BottomBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: Colors.blue,
              darkActiveColor: Colors.lightBlueAccent),
          BottomBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              title: Text('Cart'),
              activeColor: Colors.blue,
              darkActiveColor: Colors.lightBlueAccent),
          BottomBarItem(
              icon: Icon(Icons.person),
              title: Text('Account'),
              activeColor: Colors.blue,
              darkActiveColor: Colors.lightBlueAccent),
        ],
      ),
    );
  }
}
