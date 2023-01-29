import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final grad = LinearGradient(
    colors: <Color>[Colors.greenAccent.shade400, Colors.blueAccent]);

class Inforamtion extends StatefulWidget {
  @override
  _InforamtionState createState() => _InforamtionState();
}

class _InforamtionState extends State<Inforamtion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent.shade400,
        title: Row(children: [
          SizedBox(
            width: 30,
          ),
          Container(
              height: 60,
              width: 170,
              child: Image.asset("assets/icons/pre.png")),
        ]),
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: grad,
                ),
              ),
            ),
            Positioned(
                top: 102,
                left: 10,
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height - 420,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 65,
                      ),
                      Container(
                        width: 340,
                        height: 150,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage("assets/app/pp.jpg"),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Harsh Shrivastava",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.lato(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 2,
                                        color: Colors.black),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Btech- Cse(2019-23)",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 2,
                                        color: Colors.black),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Jaypee University of \n" +
                                        "Engineering and Technology",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 2,
                                        color: Colors.black),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () async {
                                          var url =
                                              "https://github.com/harshu-2001";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: Text(
                                          "Github",
                                          overflow: TextOverflow.clip,
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 2,
                                              color: Colors
                                                  .lightBlueAccent.shade100),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        onTap: () async {
                                          var url =
                                              "https://twitter.com/harshu_2001";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: Text(
                                          "twitter",
                                          overflow: TextOverflow.clip,
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 2,
                                              color: Colors
                                                  .lightBlueAccent.shade100),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 340,
                        height: 150,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage("assets/icons/kk.jpg"),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Kamesh Parshar",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.lato(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 2,
                                        color: Colors.black),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Btech- Cse(2019-23)",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 2,
                                        color: Colors.black),
                                  ),
                                ),
                                Align(
                                  //https://twitter.com/KameshParashar
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Jaypee University of \n" +
                                        "Engineering and Technology",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 2,
                                        color: Colors.black),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () async {
                                          var url =
                                              "https://github.com/xKameshx";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: Text(
                                          "Github",
                                          overflow: TextOverflow.clip,
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 2,
                                              color: Colors
                                                  .lightBlueAccent.shade100),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        onTap: () async {
                                          var url =
                                              "https://twitter.com/KameshParashar";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: Text(
                                          "twitter",
                                          overflow: TextOverflow.clip,
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 2,
                                              color: Colors
                                                  .lightBlueAccent.shade100),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: 120,
                left: 110,
                child: Text(
                  "Created By : - ",
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      color: Colors.lightBlueAccent.shade700),
                ))
          ],
        ),
      ),
    );
  }
}
