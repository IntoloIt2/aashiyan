import 'package:flutter/material.dart';

Container lableText(String lable) {
  return Container(
    padding: EdgeInsets.only(right: 5),
    child: Text(
      "$lable : ",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Material textField(BuildContext context) {
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.all(Radius.circular(5)),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "First name",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

          //fillColor: Colors.green
        ),
      ),
    ),
  );
}
