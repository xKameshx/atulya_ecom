// import 'dart:html';

import 'package:atulya_app/pages/cart.dart';
import 'package:atulya_app/pages/product.dart';
import 'package:atulya_app/widget/kist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/rendering.dart';

// import 'package:';

class AddData extends StatefulWidget {
  final String search;
  AddData(this.search);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  fun(data) {
    data = data['imageUrl'];

    dynamic split = data.split(new RegExp(r"[@]"));
    split.removeAt(0);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 2, 8),
      child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              shape: BoxShape.rectangle),
          width: 120,
          height: 100,
          child: Image.network(
            split[0],
            errorBuilder: (context, exception, stackTrace) {
              return Image.asset("assets/images/235.png");
            },
            // loadingBuilder: (context, exception, stackTrack) =>
            //     CircularProgressIndicator(),
          )),
    );
  }

  funi() {
    var g;
    if (widget.search.toString() == " Laptop") {
      g = 'Laptops';
    } else if (' Television' == widget.search.toString()) {
      g = 'Televisions';
    } else if (' Smartphone' == widget.search.toString()) {
      g = 'Smartphones';
    } else if (' Jeans' == widget.search.toString()) {
      g = 'Jeans';
    } else {
      //print("lo");
      g = '';
    }
    return g;
  }

  @override
  Widget build(BuildContext context) {
    String g = '';
    // print(widget.search);
    // print(widget.search.runtimeType);
    g = funi();
    // print(g);
    for (int i = 0; i < lapi.length; i++) {
      if (lapi[i] == widget.search.toLowerCase()) {
        // print("lo");
        g = 'Laptops';
      }
    }
    for (int i = 0; i < tele.length; i++) {
      if (tele[i] == widget.search.toLowerCase()) {
        g = 'Televisions';
      }
    }
    for (int i = 0; i < jean.length; i++) {
      if (jean[i] == widget.search.toLowerCase()) {
        g = 'Jeans';
      }
    }
    for (int i = 0; i < mobi.length; i++) {
      if (mobi[i] == widget.search.toLowerCase()) {
        g = 'Smartphones';
      }
    }
    if (g == '') {
      return Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () =>
                    {Navigator.of(context).popAndPushNamed("carti")},
                icon: Icon(Icons.shopping_cart_outlined)),
          ],
          title: Text(
            widget.search,
            style: GoogleFonts.lato(
                // fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Image.asset("assets/app/3232.jpg"),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () => {Navigator.of(context).popAndPushNamed("carti")},
              icon: Icon(Icons.shopping_cart_outlined)),
        ],
        title: Text(
          widget.search,
          style: GoogleFonts.lato(
              // fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('items')
            .where("category", isEqualTo: g)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: snapshot.data!.docs.map((document) {
              int doo = document['price'];
              return GestureDetector(
                onTap: () => {
                  // print("first : ${document.id}"),
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Product(document.id)))
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 2,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          fun(document),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['product_name'],
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueAccent),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "₹ " + "$doo",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
