import 'package:atulya_app/pages/proced.dart';
import 'package:atulya_app/pages/product.dart';
import 'package:atulya_app/widget/kist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  fun(data) {
    data = data['imageUrl'];
    List<String> split = data.split(new RegExp(r"[@]"));
    split.removeAt(0);
    return split[0];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(pro);
    var map = Map();
    bool gy = true;
    // var mob;
    // var auther = FirebaseFirestore.instance.collection('items');
    pro.forEach((element) {
      if (!map.containsKey(element)) {
        map[element] = 1;
      } else {
        map[element] += 1;
      }
    });
    if (pro.isNotEmpty) {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Cart",
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightBlueAccent.shade700),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal
                  itemCount: map.length,
                  itemBuilder: (context, value) {
                    var key = map.keys.elementAt(value);
                    var valu = map[key];

                    // print(key);
                    // print(valu);

                    return Card(
                      child: Container(
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('items')
                                .doc(key)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<
                                        DocumentSnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                if (data != null) {
                                  String tup = fun(data);
                                  double doo = data['price'].toDouble();
                                  mapi[key] = doo * valu;
                                  if (gy) {
                                    price = price + mapi[key];
                                  }
                                  print(mapi);
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Product(key)));
                                          },
                                          child: SizedBox(
                                            width: 90,
                                            height: 90,
                                            child: Image.network(
                                              tup,
                                              errorBuilder: (context, exception,
                                                  stackTrace) {
                                                return Image.asset(
                                                    "assets/images/235.png");
                                              },
                                              // loadingBuilder: (context, exception, stackTrack) =>
                                              //     CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240,
                                          child: Column(
                                            children: [
                                              Text(
                                                data['product_name'],
                                                overflow: TextOverflow.clip,
                                                style: GoogleFonts.lato(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.blueAccent),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "₹ " + "$doo",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.grey.shade700),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          Colors.grey.shade300,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              gy = false;
                                                              valu = valu - 1;
                                                              map[key] = valu;
                                                              pro.remove(key);
                                                              var n = mapi[key];
                                                              if (n / doo ==
                                                                  1.0) {
                                                                mapi.removeWhere(
                                                                    (keyw, value) =>
                                                                        keyw ==
                                                                        key);
                                                              } else {
                                                                mapi[key] =
                                                                    n / doo;
                                                              }

                                                              // print(price);
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons.remove,
                                                            size: 15,
                                                            color: Colors.black,
                                                          )),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 10,
                                                    // ),
                                                    Center(
                                                      child: Text(
                                                        valu.toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 0,
                                                    // ),
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          Colors.grey.shade300,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              gy = false;
                                                              valu = valu + 1;
                                                              map[key] = valu;
                                                              var n = mapi[key];
                                                              mapi[key] =
                                                                  doo * n;

                                                              pro.add(key);
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons.add,
                                                            size: 15,
                                                            color: Colors.black,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 70,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey.shade300,
                                                      radius: 15,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              gy = true;
                                                              map.removeWhere(
                                                                  (var keye,
                                                                          var value) =>
                                                                      keye ==
                                                                      key);
                                                              pro.removeWhere(
                                                                  (var keye) =>
                                                                      keye ==
                                                                      key);

                                                              mapi.remove(key);
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .delete_outline_outlined,
                                                            color: Colors.black,
                                                            size: 15,
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              } else {
                                return Container();
                              }
                            }),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   Delivery Location",
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/app/preview.png"),
                    ),
                    Text(
                      "Kampoo ,Lashkar Gwalior",
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightBlue.shade400,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   Payment Method",
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/app/pay-.png"),
                    ),
                    Text("    Cash on Delivery "),
                  ],
                ),
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
                      dynamic mapo = map;
                      dynamic mapio = mapi;

                      print(mapo);
                      print(mapio);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Proced(map, mapi)));
                      // map.clear();
                      // mapi.clear();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Checkout",
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      );
    } else {
      price = 0.0;
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
          body: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                height: 170,
                child: Image.asset("assets/icons/empty-cart.png")),
          ));
    }
  }
}
