// import 'package:atulya_app/Authentication/hompage.dart';
import 'package:atulya_app/widget/kist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Proced extends StatefulWidget {
  dynamic ko;
  dynamic ko1;
  Proced(this.ko, this.ko1);

  @override
  State<Proced> createState() => _ProcedState(ko, ko1);
}

class _ProcedState extends State<Proced> {
  dynamic map0;
  dynamic mapi1;
  _ProcedState(this.map0, this.mapi1);
  var price = 0;
  var finalprice;

  @override
  Widget build(BuildContext context) {
    var price = 0;
    for (int i = 0; i < mapi1.length; i++) {
      var key = mapi1.keys.elementAt(i);
      print(mapi1[key]);
      if (price != null) {
        var b = (mapi1[key]).toInt();
        price = (price + b).toInt();
      }
    }
    if (price != null) {
      finalprice = price + 50;
    }
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "  Order Info",
                style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "   Subtotal",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            //fontWeight: FontWeight.w700,
                            color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(price.toString())), //₹
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "  Shipping Cost",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            //fontWeight: FontWeight.w700,
                            color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(" ₹ 50")),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "  Subtotal",
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            //fontWeight: FontWeight.w700,
                            color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(finalprice.toString())),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // P/roced(map, mapi),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: Container(
                              width: 400,
                              height: 400,
                              child: AlertDialog(
                                // title: Center(
                                //   child: Text(
                                //     'Item Added',
                                //     style: GoogleFonts.lato(
                                //       color: Colors.black,
                                //       fontWeight: FontWeight.w600,
                                //       fontSize: 18,
                                //     ),
                                //   ),
                                // ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                content: Column(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      height: 200,
                                      child:
                                          Image.asset("assets/icons/ima.gif"),
                                    ),
                                    Text(
                                      'Thank You!',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        pro.clear();
                                        Navigator.of(context).pop();
                                        Navigator.of(context)
                                            .pushReplacementNamed("main");
                                      },
                                      child: Text(
                                        'OK',
                                        style: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Pay",
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
