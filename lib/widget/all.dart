import 'package:atulya_app/pages/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class All extends StatefulWidget {
  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  fun(data) {
    data = data['imageUrl'];

    dynamic split = data.split(new RegExp(r"[@]"));
    split.removeAt(0);

    return Padding(
      padding: const EdgeInsets.all(4),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All items",
          style: GoogleFonts.lato(
              // fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
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
