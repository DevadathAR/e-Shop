import 'package:flutter/material.dart';

Widget LogInTextForm(BuildContext context,
    {hint, labels, controllerused, isobscure}) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: TextFormField(
        controller: controllerused,
        obscureText: isobscure,
        decoration: InputDecoration(
            hintText: hint,
            labelText: labels,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
      ),
    ),
  );
}
