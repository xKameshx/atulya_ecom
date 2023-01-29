import 'package:atulya_app/pages/cam.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Name extends StatelessWidget {
  String str;
  String val;
  Name(this.str, this.val);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddData(val)))
            },
        child: Card(
          child: SizedBox(
            height: 80,
            width: 80,
            child: Image.asset("assets/app/$str"),
          ),
        ));
  }
}
