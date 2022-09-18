import 'package:flutter/material.dart';

AppBar appBar(String text) {
  return AppBar(
    
    title: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
