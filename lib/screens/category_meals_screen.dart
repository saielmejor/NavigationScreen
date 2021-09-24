import 'package:flutter/material.dart';
import 'package:naviagtion_app/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId; //constructor when somebody selects the category
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);
  static const routeName = 'category-meals';
  //create a static property
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    // this will inform dart that whatever we get as an argumen it will
    // be map string keys and vavules
    //accessing route arguments by using routeArgs
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    //you need to filter the category id from the dummy data list
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    //in the dummydata it finds where the meal is and returns
    // the category id and trans form it to a list
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      //create a dynamic list

      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
