import 'package:flutter/material.dart';

class Single_Product extends StatelessWidget {
  final String img;
  const Single_Product({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Container(
          width: 150,
          padding: EdgeInsets.all(10),
          child: Image.network(
            img,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
