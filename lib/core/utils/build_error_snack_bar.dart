import 'package:flutter/material.dart';

SnackBar errorSnackBar(String errMessage) {
  return SnackBar(
    content: Text(
      errMessage,
      style: const TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.red[300], // Customize the background color
    duration: const Duration(seconds: 3),
  );
}
