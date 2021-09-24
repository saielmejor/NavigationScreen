//create a model for category
import 'package:flutter/material.dart';

//create constructor for model 
class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange, // select orange by default 
  });
}
