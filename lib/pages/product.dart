import 'package:atulya_app/widget/kist.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final grad = LinearGradient(
    colors: <Color>[Colors.greenAccent.shade400, Colors.blueAccent]);

class Product extends StatefulWidget {
  var value1;
  Product(this.value1);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  fun(data) {
    data = data['imageUrl'];
    List<String> split = data.split(new RegExp(r"[@]"));
    split.removeAt(0);
    return split;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 35,
            ),
            Container(
                height: 60,
                width: 170,
                child: Image.asset("assets/icons/pre.png")),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent.shade400,
        bottomOpacity: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('items')
            .doc(widget.value1.toString())
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var data = snapshot.data!.data();
            if (data != null) {
              List<String> tup = fun(data);
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(clipBehavior: Clip.hardEdge, children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      // height: /,
                      child: ImageSliderDemo(tup),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    // left: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          data['product_name'],
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 365,
                    left: 8,
                    child: Text(
                      "₹ ${data['price'].toString()}",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 400,
                    left: 8,
                    child: Text(
                      "FREE Delivery ",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 5,
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 10,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                pro.add(widget.value1.toString());
                                print(pro);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: 200,
                                        height: 200,
                                        child: AlertDialog(
                                          title: Center(
                                            child: Text(
                                              'Item Added',
                                              style: GoogleFonts.lato(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          content: SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Image.asset(
                                                "assets/icons/icons8-shopping-cart.gif"),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
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
                                      );
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              child: Text(
                                "ADD TO CART",
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              )),
                        ),
                      )),
                  Positioned(
                    top: 425,
                    left: 8,
                    child: Text(
                      "EMI from  ₹ ${(data['price'] / 12).toStringAsFixed(2)} / month. ",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ]),
                decoration:
                    BoxDecoration(color: Colors.lightBlueAccent.shade400),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  List<String> li;
  ImageSliderDemo(this.li);
  funi(item) {
    dynamic vie;
    try {
      vie = Image.network(item);
    } catch (e) {
      vie = Image.asset("assets/images/235.png");
    }
    return vie;
  }

  @override
  Widget build(BuildContext context) {
    // print(li);
    return CarouselSlider(
      options: CarouselOptions(
        // enableInfiniteScroll: ,
        aspectRatio: 1.0,
        viewportFraction: 1,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        initialPage: 0,
        height: 330,
        // pageSnapping: false,
        autoPlay: true,
      ),
      items: li.map((item) => Center(child: funi(item))).toList(),
    );
  }
}
