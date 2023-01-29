import 'package:atulya_app/pages/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Containere extends StatelessWidget {
  var data;
  var stri;
  Containere(this.data, this.stri);
  @override
  Widget build(BuildContext context) {
    var doo = data['price'];
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Product(data.id)));
            },
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                stri,
                errorBuilder: (context, exception, stackTrace) {
                  return Image.asset("assets/images/235.png");
                },
                // loadingBuilder: (context, exception, stackTrack) =>
                //     CircularProgressIndicator(),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                data['product_name'],
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
        ],
      ),
    );
  }
}
