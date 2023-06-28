import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required Key key, required this.title, required this.onPressed}) : super(key: key);
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
     child:  ElevatedButton(
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).hintColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(255,63,108, 1),
    ),
      onPressed: onPressed,
    ));
  }
}
