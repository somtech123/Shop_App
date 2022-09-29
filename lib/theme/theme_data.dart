import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.purple,
  accentColor: Colors.deepOrange,
  iconTheme: ThemeData.light().iconTheme.copyWith(color: Colors.deepOrange),
  textTheme: ThemeData.light().textTheme.copyWith(
      headline6: const TextStyle(fontSize: 20),
      headline5: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      bodyText1: const TextStyle(color: Colors.black, fontSize: 20),
      bodyText2: const TextStyle(color: Colors.black, fontSize: 25)),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  accentColor: Colors.deepOrange,
  iconTheme: ThemeData.light().iconTheme.copyWith(color: Colors.deepOrange),
  textTheme: ThemeData.light().textTheme.copyWith(
      headline6: const TextStyle(fontSize: 20),
      headline5: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText1: const TextStyle(color: Colors.white, fontSize: 20),
      bodyText2: const TextStyle(color: Colors.white, fontSize: 25)),
);
