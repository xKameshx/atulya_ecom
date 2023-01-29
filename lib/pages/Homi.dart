import 'package:atulya_app/widget/all.dart';
import 'package:atulya_app/widget/buildi.dart';
import 'package:atulya_app/widget/image_slider.dart';
import 'package:atulya_app/widget/name.dart';
import 'package:atulya_app/widget/view_all.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homi extends StatefulWidget {
  @override
  _HomiState createState() => _HomiState();
}

class _HomiState extends State<Homi> {
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
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: ImageSliderDem(),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => All()))
                            },
                        child: Card(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/app/all.jpg"),
                          ),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Name("mob.jpg", "Smartphones"),
                    SizedBox(
                      width: 5,
                    ),
                    Name("app.jpg", "Appliances"),
                    SizedBox(
                      width: 5,
                    ),
                    Name("fash.jpg", "Fashion"),
                    SizedBox(
                      width: 5,
                    ),
                    Name("elec.jpg", "Electronics"),
                    SizedBox(
                      width: 5,
                    ),
                    Name("Bea.jpg", "Beauty")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "   Recently Viewed",
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Buildi("Laptops")),
            )),
            SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "   View All",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                    onPressed: () => {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => All()))
                        },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.lightBlueAccent,
                    ),
                    child: Text(
                      "View All",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
            Card(
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ViewAll(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
