import 'package:flutter/material.dart';
import '../models/meal.dart';
//accept favorite meals

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('You have no favorite meals -  start adding some '));
  }
}
