import 'package:atulya_app/pages/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buildi extends StatefulWidget {
  final String cat;
  Buildi(this.cat);
  @override
  State<Buildi> createState() => _BuildiState();
}

class _BuildiState extends State<Buildi> {
  fun(data) {
    data = data['imageUrl'];

    dynamic split = data.split(new RegExp(r"[@]"));
    split.removeAt(0);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 2, 8),
      child: SizedBox(
        width: 250,
        height: 200,
        child: Image.network(
          split[0],
          errorBuilder: (context, exception, stackTrace) {
            return Image.asset("assets/images/235.png");
          },
          // loadingBuilder: (context, exception, stackTrack) =>
          //     CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('items')
            .where("category", isEqualTo: widget.cat)
            .limit(4)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: snapshot.data!.docs.map((document) {
              int doo = document['price'];
              return GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Product(document.id)))
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 250,
                      height: 300,
                      child: Column(
                        children: [
                          fun(document),
                          Text(
                            document['product_name'],
                            overflow: TextOverflow.ellipsis,
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
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        });
  }
}
