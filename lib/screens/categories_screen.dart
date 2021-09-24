import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Deli app')),
        body: GridView(
            padding: const EdgeInsets.all(25),
            children: DUMMY_CATEGORIES
                .map((catData) => CategoryItem(
                      catData.title,
                      catData.color,
                      catData.id,
                      //forwards the id
                    ))
                .toList(),
            //mapping the dummy categories to the categories item format
            //maps a list of data to a widget
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, //assign width of 200 pixels per grid
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20) //designing look of grid

            ));
  }
}
