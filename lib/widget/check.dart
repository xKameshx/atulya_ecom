import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  dynamic va;
  Check(this.va);
  fun(data) {
    data = data['imageUrl'];
    List<String> split = data.split(new RegExp(r"[@]"));
    split.removeAt(0);
    return split[0];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('items').doc(va).snapshots(),
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
              String tup = fun(data);
              return Container(
                child: Text(data['product_name']),
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }
}
