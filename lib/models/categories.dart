import 'package:flutter/material.dart';

class Catagory {
  final id;
  final title;
  final Color;

  const Catagory({
    required this.id,
    required this.title,
    this.Color = Colors.blue,
  });
}
