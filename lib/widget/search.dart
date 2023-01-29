import 'package:atulya_app/widget/buildi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent.shade400,
        title: Center(
          child: Container(
              height: 60,
              width: 170,
              child: Image.asset("assets/icons/pre.png")),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: 20,
            left: 15,
            child: Center(
              child: ElevatedButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Search Product",
                      style: GoogleFonts.lato(
                          // fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.grey.shade300),
                    ),
                  ],
                ),
                onPressed: () => Navigator.pushNamed(context, "mode"),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width - 30, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 85,
            child: Text(
              "History",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.lightBlue,
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 125,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 300,
                  child: Buildi("Laptops")),
            ),
          ),
          Positioned(
            left: 2,
            top: 455,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 300,
                  child: Buildi("Televisions")),
            ),
          )
        ]),
      ),
    );
  }
}
