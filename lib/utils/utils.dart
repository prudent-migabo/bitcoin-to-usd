import 'package:flutter/material.dart';

InputDecoration textFieldDecor ({String? hintText}){
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    fillColor: Colors.grey.shade200,
    filled: true,
    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  );
}