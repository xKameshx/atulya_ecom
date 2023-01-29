import 'package:flutter/material.dart';

final grad=LinearGradient(
            colors: <Color>[Colors.greenAccent.shade400,
            Colors.blueAccent]

          );

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 3950),(){});
    Navigator.of(context).pushReplacementNamed("start");
  }
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
            height: 354,
            width: 354,
            child: Image.asset("assets/images/We deliver your happiness_Trim.gif",filterQuality: FilterQuality.high,),
          ),
        ),
      ),
    );
  }
}