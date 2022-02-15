import 'package:flutter/material.dart';

Widget tag(String tag) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
      child: Text(tag,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),),
    ),
  );
}