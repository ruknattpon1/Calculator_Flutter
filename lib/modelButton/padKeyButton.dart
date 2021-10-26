import 'package:flutter/material.dart';

class padkeyButton extends StatelessWidget {
  padkeyButton(
      {required this.textnumPad,
      required this.textColor,
      required this.callback});
  final String textnumPad;
  final Color textColor;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RawMaterialButton(
        child: Text(
          textnumPad,
          style: TextStyle(
              color: textColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          return callback(textnumPad);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        constraints: BoxConstraints.tightFor(width: 60, height: 60),
        fillColor: Color(0xFF272B33),
      ),
    );
  }
}
